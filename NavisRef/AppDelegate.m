//
//  AppDelegate.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 8/12/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import "AppDelegate.h"
#import "Flurry.h"
// register our class as a transaction observer
#import "ProductsIAHelper.h"
#import "SWRevealViewController.h"
#import "AppendViewController.h"

@interface AppDelegate()<SWRevealViewControllerDelegate>
@end


@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   


   // UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   // self.window = window;
    
   // AppendViewController *appendViewController = [[AppendViewController alloc] init];
    

    
    //For this observer to work well, you should register your class as a transaction observer as early as possible in your app initialization... this is done in the AppDelegate.
    [ProductsIAHelper sharedInstance];
    
//Flurry Load
    
  //
    [Flurry setCrashReportingEnabled:YES];
    //note: iOS only allows one crash reporting tool per app; if using another, set to: NO
 //  old hosted version not used [Flurry startSession:@"D7ZVKRYXS2CK5XZWMPWP"];
    
    //free version API used
  
  // old 5.0 version for iPad only  [Flurry startSession:@"V9HTH9T9BPG4MFS3DGP9"];

    [Flurry startSession:@"YPZ93SVJ6BDDF3SJWTX2"];
    
    //your code
//    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]
//                                                    initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
//    
 
    /*
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
     */
    
    // Override point for customization after application launch.
    
 //   UIImage *navBackgroundImage = [UIImage imageNamed:@"nav_bg"];
  //  [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
/*
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:10.0/255.0 green:10.0/255.0 blue:10.0/255.0 alpha:1.0], UITextAttributeTextColor,
                                                           [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],UITextAttributeTextShadowColor,
                                                           [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
                                                           UITextAttributeTextShadowOffset,
                                                           [UIFont fontWithName:@"Helvetica-Light" size:20.0], UITextAttributeFont, nil]];
 
*/
    return YES;

}

- (void)revealController:(SWRevealViewController *)revealController willMoveToPosition:(FrontViewPosition)position
{
    NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
    NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
