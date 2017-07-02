//
//  ProductsIAHelper.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 2/27/14.
//  Copyright (c) 2014 KP Phillips. All rights reserved.
//

#import "IAPHelper.h"

@interface ProductsIAHelper : IAPHelper

+ (ProductsIAHelper *)sharedInstance;

- (NSString *)descriptionForProduct:(SKProduct *)product;


@end
