//
//  main.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 8/12/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSLog( @"calling: %s", __PRETTY_FUNCTION__ );

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
