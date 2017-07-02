//
//  IAPHelper.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 2/24/14.
//  Copyright (c) 2014 KP Phillips. All rights reserved.
//

#import "IAPHelper.h"
#import "Flurry.h"
#import "MainViewController.h"
#import "SWRevealViewController.h"

//Import StoreKit to access the In-App purchase APIs

//@import StoreKit;
#import <StoreKit/StoreKit.h>
NSString *const IAPHelperProductPurchasedNotification = @"IAPHelperProductPurchasedNotification";
// To receive a list of products from StoreKit, you need to implement the SKProductsRequestDelegate protocol.
// Here you mark the class as implementing this protocol in the class extension.
// For purchasing: modify the class extension to mark the class as implementing the SKPaymentTransactionObserver:
@interface IAPHelper () <SKProductsRequestDelegate, SKPaymentTransactionObserver>
@end

@implementation IAPHelper
{
// You create an instance variable to store the SKProductsRequest you will issue to retrieve a list of products, while it is active.
    SKProductsRequest *_productsRequest;

// You also keep track of the completion handler for the outstanding products request, ...
    RequestProductsCompletionHandler _completionHandler;
// ... the list of product identifiers passed in, ...
    NSSet *_productIdentifiers;
// ... and the list of product identifiers that have been previously purchased.
    NSMutableSet * _purchasedProductIdentifiers;
}
/*
    Next, add the initializer. This will check to see which products have been purchased or not. This works based on the values saved in NSUserDefaults and also keep track of the product identifiers that have been purchased in a list.
*/
 
 
- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers
{

    self = [super init];
    if (self){
        //Store product identifiers
        _productIdentifiers = productIdentifiers;
        
        //Check for previously purchased products
        _purchasedProductIdentifiers = [NSMutableSet set];
        
        for (NSString * productIdentifier in _productIdentifiers) {
            BOOL productPurchased = [[NSUserDefaults standardUserDefaults] boolForKey:productIdentifier];
            if (productPurchased) {
                [_purchasedProductIdentifiers addObject:productIdentifier];
                NSLog(@"Previously purchased: %@", productIdentifier);

            }else
            {
                NSLog(@"Not purchased: %@", productIdentifier);
            }
        }
/*
If you’re letting your users give you money, you better give them something good in return! So you need to add some code to identify when a payment “transaction” has finished, and process it accordingly.
        
Add the transaction observer to the bottom of the initWithProductIdentifiers: method. Now, when the IAPHelper class is initialized, it will make itself the transaction observer of the SKPaymentQueue. In other words: Apple will tell you when somebody purchased something.
*/
        
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];

    }

    return self;
    
}
/*
 Next, add the method to retrieve the product information from iTunes Connect. We set the IAPHelper class itself as the delegate, which means that it will receive a callback when the products list completes (productsRequest:didReceiveResponse) or fails (request:didFailWithError).

 */
- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler
{
// a copy of the completion handler block inside the instance variable
    _completionHandler = [completionHandler copy];
// Create a new instance of SKProductsRequest, which is the Apple-written class that contains the code to pull the info from iTunes Connect
    _productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:_productIdentifiers];
    _productsRequest.delegate = self;
    [_productsRequest start];
    
}

//Here we implement the two delegate callbacks – for success ...
//add success check
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSLog(@"Loaded products...");
    _productsRequest = nil;
    NSArray * skProducts = response.products;
    NSLog(@"Product count: %lu", (unsigned long)[skProducts count]);

    for (SKProduct * skProduct in skProducts) {
        NSLog(@"Found product: %@ – Product: %@ – Price: %0.2f", skProduct.productIdentifier, skProduct.localizedTitle, skProduct.price.floatValue);
    }
    
    for (NSString *invalidProductId in response.invalidProductIdentifiers)
    {
        NSLog(@"Invalid product id: %@" , invalidProductId);
    }
//    NSLog(@"Product identifier: %@", _productIdentifier);

    _completionHandler(YES, skProducts);
    _completionHandler = nil;

}
//add failure check
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Failed to load list of products.  Check your internet connection."
                                                      message:nil
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    NSLog(@"Failed to load list of products.  Check your internet connection.");
    _productsRequest = nil;
    _completionHandler(NO, nil);
    _completionHandler = nil;
    
}

//First we check if the product is allowed to be purchased, and if so it marks the purchase as in-progress, and issue an SKPayment to the SKPaymentQueue. The SKPayment class defines a request to the Apple App Store to process a payment.
- (BOOL)productPurchased:(NSString *)productIdentifier
{
   
    
    return [_purchasedProductIdentifiers containsObject:productIdentifier];
}

- (void)buyProduct:(SKProduct *)product
{
    NSLog(@"Buying %@...", product.productIdentifier);
    SKPayment * payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}


//You still have to implement the SKPaymentTransactionObserver protocol, so switch back to IAPHelper.m and add the following.


- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                
//***May need to add re-loadview here
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
            default:
                break;
        }
    };
}


// called when the transaction was successful
- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
    [Flurry logEvent:@"000d Essentials were Bought!! "];

    NSLog(@"completeTransaction...");
    [self provideContentForProductIdentifier:transaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Bought successfully!"
                                                      message:@"Thank you for your purchase. Enjoy!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:transaction.payment.productIdentifier];
   // [SWRevealViewController restoreUserInteraction];
    //call class method to clear out main view items
//    MainViewController *viewController = [[MainViewController alloc]init];
    
//    [viewController productsPurchased];

}

// called when a transaction has been restored and successfully completed
- (void)restoreTransaction:(SKPaymentTransaction *)transaction
{
    NSLog(@"restoreTransaction...");
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Restored successfully!"
                                                      message:@"Enjoy!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    [self provideContentForProductIdentifier:transaction.originalTransaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    //call class method to clear out main view items
 //   MainViewController *viewController = [[MainViewController alloc]init];
    
//    [viewController productsPurchased];

    
}


// called when a transaction has failed
- (void)failedTransaction:(SKPaymentTransaction *)transaction
{
    NSLog(@"failedTransaction...");
    if (transaction.error.code != SKErrorPaymentCancelled) {
        NSLog(@"Transaction error: %@", transaction.error.localizedDescription);
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Ups!"
                                                          message:transaction.error.localizedDescription
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];

}




//We‘re now adding the provideContentForProductIdentifier method. When a product is purchased, this method adds the product identifier to the list of purchased product identifiers, marks it as purchased in NSUserDefaults, and sends a notification so others can be aware of the purchase.

- (void)provideContentForProductIdentifier:(NSString *)productIdentifier
{
    
    NSLog(@"provideContentForProductIdentifier");
    [_purchasedProductIdentifiers addObject:productIdentifier];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:productIdentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:IAPHelperProductPurchasedNotification object:productIdentifier userInfo:nil];
}

//If you have non-consumable or auto-renew subscription types, you must implement this feature, or Apple will reject your app.
- (void)restoreCompletedTransactions {
    
    
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
    
    
  //  MainViewController *instance = [[MainViewController alloc] init];
  //  [instance  stopActivityIndicator];
    
    
    //restoreActivity.hidden = YES;

}
/*
 It will then call paymentQueue:updatedTransactions for each of the products, with the SKPaymentTransactionStateRestored case, we already implement earlier.
 
 Now, all we have to do is make the content available again. The restoreTransaction method calls the provideContentForProductIdentifier method, which sets the NSUserDefaults on YES for the correspondent product. Don't forget to call the finishTransaction method!
 
*/







    
@end
