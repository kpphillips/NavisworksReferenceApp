//
//  ProductsIAHelper.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 2/27/14.
//  Copyright (c) 2014 KP Phillips. All rights reserved.
//

#import "ProductsIAHelper.h"

static NSString *kIdentifierEssentials = @"com.kpphillips.NavisRef.essentials1";
//static NSString *kIdentifierAdvanced = @"com.kpphillips.NavisRef.advanced";


@implementation ProductsIAHelper

+ (ProductsIAHelper *)sharedInstance {
    static ProductsIAHelper *sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        NSSet *productIdentifiers = [NSSet setWithObjects:
                                     kIdentifierEssentials,
                                   //kIdentifierAdvanced,
                                     nil];
        sharedInstance = [[self alloc] initWithProductIdentifiers:productIdentifiers];
    });
    return sharedInstance;
}

- (NSString *)descriptionForProduct:(SKProduct *)product
{
    
    if ([product.productIdentifier isEqualToString:kIdentifierEssentials]) {
        return product.localizedDescription;
    }
   
    return nil;
}




@end
