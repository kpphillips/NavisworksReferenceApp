//
//  IAPHelper.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 2/24/14.
//  Copyright (c) 2014 KP Phillips. All rights reserved.
//

// Declaration of a notification we'll use to notify listeners when a product has been purchased
UIKIT_EXTERN NSString *const IAPHelperProductPurchasedNotification;

//Block Definition
typedef void (^RequestProductsCompletionHandler)(BOOL success, NSArray * products);

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface IAPHelper : NSObject

// Method definition
// Initializer that takes a list of product identifiers, such as de.smmb.buyfruit.apple, de.smmb.buyfruit.orange, etc.
- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers;
// Method to retrieve information about the products from iTunes Connect
- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler;
// Method to start buying a product
- (void)buyProduct:(SKProduct *)product;
// Method to determine if a product has been purchased
- (BOOL)productPurchased:(NSString *)productIdentifier;
// Method to restore completed transactions
//If you have non-consumable or auto-renew subscription types, you must implement this feature, or Apple will reject your app.
- (void)restoreCompletedTransactions;

@end
