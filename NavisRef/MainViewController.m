//
//  MainViewController.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 9/8/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import "MainViewController.h"
#import "Flurry.h"
#import "SWRevealViewController.h"
#import "ProductsIAHelper.h"
#import "IAPHelper.h"
#import "SidebarViewController.h"
#import <MessageUI/MessageUI.h>



@interface MainViewController () <MFMailComposeViewControllerDelegate>

//**IAP
//instantiate the two variables products and priceFormatter. NSNumberFormatter allows you to flexibly convert backwards and forwards between numbers (NSNumber) and localized string (NSString) representations of those numbers
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) NSNumberFormatter *priceFormatter;
//**IAP

@end

@implementation MainViewController
@synthesize iapButton;
@synthesize upgradeButton;
@synthesize restoreButton;
@synthesize purchaseButton;
@synthesize textView;
@synthesize maybeLaterButton;
@synthesize sendFeedback;

@synthesize imageView;
@synthesize imageArrayAnimation;
@synthesize directionView1;
@synthesize directionView2;



@synthesize slideTutorialText;
//@synthesize showPopover;
//BOOL purchasing = NO;

static CGFloat textWidth = 0;
NSString *textViewDescription = @"";
static float iPadPointHeightLandscape = 768;
static CGFloat textViewBottomPadding = 12;


//called before view did load method
-(void)viewDidLayoutSubviews{
    //set text size and origin
    //textView.frame = [self setTextViewSizeAndOrigin:pointValueForCurrentButton.y];
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        
        //textView.frame = CGRectMake(200,200,textWidth,127);
        //imageView.frame = CGRectMake(0, 0 ,self.view.bounds.size.width,self.view.bounds.size.height);


    }

}


/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */



-(IBAction)sendFeedbackButtonPressed:(id)sender{
    //
    
    
    [Flurry logEvent:@"000f Feedback Button Pressed"];
    
    NSString *iOSVersion = [[UIDevice currentDevice] systemVersion];
    NSString *model = [[UIDevice currentDevice] model];
    NSString *version = @"1.2";
    NSString *build = @"1.2";
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setToRecipients:[NSArray arrayWithObjects: @"kpphillips@gmail.com",nil]];
    [mailComposer setSubject:[NSString stringWithFormat: @"Navisworks Reference V%@ (build %@) Feedback",version,build]];
    NSString *supportText = [NSString stringWithFormat:@"Device: %@\niOS Version:%@\n\n",model,iOSVersion];
    supportText = [supportText stringByAppendingString: @"Please provide your question or just leave a note. Or any other comments that you would like to see in future releases. Thanks!"];
    [mailComposer setMessageBody:supportText isHTML:NO];
    [self presentViewController:mailComposer animated:YES completion:nil];

    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [Flurry logEvent:@"000g Feedback Button Dismissed"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


//******NOT BEING CALLED
-(IBAction)iapButtonPressed:(id)sender;
{
    
    //
    NSLog(@"iapButtonPressed");
    
    ProductsTableViewController* content = [[ProductsTableViewController alloc] init];
    UIPopoverController* aPopover = [[UIPopoverController alloc]
                                     initWithContentViewController:content];
    //   [aPopover setDelegate:self];
    
    //    aPopover.delegate = self;
    
    // Store the popover in a custom property for later use.
    self.popController = aPopover;
    
    [self.popController presentPopoverFromBarButtonItem:sender
                               permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    
    //    aPopover.popoverContentSize = CGSizeMake(644, 425);
    [aPopover presentPopoverFromRect:iapButton.frame inView:self.view permittedArrowDirections: UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionUp animated:YES];
    
    
    
}


-(IBAction)upgradeButtonPressed:(id)sender;{
    [UIView animateWithDuration:0.00 animations:^{upgradeButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{textView.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{sendFeedbackButton.alpha = 0;}];


    [Flurry logEvent:@"000a Upgrade Button Pressed"];

    
    if ([SKPaymentQueue canMakePayments]){
        
    
    
    //add ui for upgrading to pro
    NSLog(@"upgradeButtonPressed");
    [upgradeActivity startAnimating];
    upgradeActivity.hidden = NO;
    
    //[self reload];
    self.products = nil;
    //[self.tableView reloadData];
    
    
    [[ProductsIAHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if (success) {
            self.products = products;
            
            
            SKProduct *product = self.products[0];
            
            NSString *description = product.localizedDescription;
            NSString *title = product.localizedTitle;
            NSString *price = [product.price stringValue];
            [self.priceFormatter setLocale:product.priceLocale];
            NSString *localPrice = [self.priceFormatter stringFromNumber:product.price];
            //product info into strings
            [purchaseButton setTitle:localPrice forState:UIControlStateNormal];
            [textView setText:title];
            NSLog(@"Title: %@ – Price: %@ – Local Price: %@", title, price, localPrice);
            NSLog(@"Description: %@", description);
            textViewDescription = description;
            NSLog(@"Description2: %@", textViewDescription);
            //upgradeActivity.hidden = YES;
        
        
            //hide direction buttons for animation
            [UIView animateWithDuration:0.00 animations:^{directionView1.alpha = 0;}];
            [UIView animateWithDuration:0.00 animations:^{directionView2.alpha = 0;}];

            [UIView animateWithDuration:0.00 animations:^{slideTutorialText.alpha = 0;}];

           // [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(crossfade) userInfo:nil repeats:YES];

            imageView.animationImages = imageArrayAnimation;
            imageView.animationDuration = 12;
            imageView.alpha = .6;
            imageView.animationRepeatCount = 0;
            [imageView startAnimating];

            //imageView.frame = CGRectMake(0, 0 ,self.view.bounds.size.width,self.view.bounds.size.height);

            
            //[self.refreshControl endRefreshing];
            textView.text = textViewDescription;
            //[textView sizeToFit];
            CGRect frame= textView.frame;
            frame.size.width=textWidth;
            textView.frame=frame;
            
            CGSize newSize = [textView sizeThatFits:CGSizeMake(self.view.bounds.size.width-(textViewBottomPadding*3)-upgradeButton.frame.size.width, MAXFLOAT)];
            CGRect newFrame = textView.frame;
            newFrame.size = CGSizeMake(fmaxf(newSize.width, self.view.bounds.size.width-(textViewBottomPadding*3)-upgradeButton.frame.size.width), newSize.height);
            newFrame.origin.y = self.view.bounds.size.height - newFrame.size.height - textViewBottomPadding;
            newFrame.origin.x = textViewBottomPadding;

            
            //textView.frame = CGRectMake(574,613,textWidth,127);
            textView.frame = newFrame;


          
            //textView.frame = [self setTextViewSizeAndOrigin:pointValueForCurrentButton.y];
            if (self.view.bounds.size.height < iPadPointHeightLandscape) {
                //[[UIApplication sharedApplication] setStatusBarHidden:YES];
                
                
//            CGRect newSize = CGRectMake(self.view.bounds.size.width - (textViewBottomPadding*2) - upgradeButton.frame.size.width - textView.frame.size.width,
//                                     self.view.bounds.size.height - textViewBottomPadding - textView.frame.size.height,
//                                     textView.frame.size.width,
//                                     textView.frame.size.height);//x,y - width,height
//                
//                textView.frame = newSize;

                
                
            }
            
            [UIView animateWithDuration:1.00 animations:^{purchaseButton.alpha = 1;}];
            [UIView animateWithDuration:1.00 animations:^{restoreButton.alpha = 1;}];
            [UIView animateWithDuration:1.00 animations:^{textView.alpha = 1;}];
            [UIView animateWithDuration:1.00 animations:^{maybeLaterButton.alpha = 1;}];
            [textView setHidden:NO];
            //[setStatusBarHidden:NO];
            //[[UIApplication sharedApplication] setStatusBarHidden:YES];

            
            

        }
        else  [UIView animateWithDuration:1.00 animations:^{upgradeButton.alpha = 1;}];

        
        upgradeActivity.hidden = YES;

        
    }];
    
    
    
   
    //textView.text = @"Additional tutorials that cover Selection, Properties, Sets, Viewpoints, Creating Markups, Taking Measurements and an overview of TimeLiner and Clash Detection.";
     
        NSLog(@"Description3: %@", textViewDescription);

    }
    
    else
    {
        textView.text = @"To unlock content please enable In-App Purchases in Settings";
        //[textView sizeToFit];
        CGRect frame= textView.frame;
        frame.size.width=textWidth;
        textView.frame=frame;
        textView.frame = CGRectMake(574,686,textWidth,54);

        [UIView animateWithDuration:1.00 animations:^{textView.alpha = 1;}];
        [UIView animateWithDuration:1.00 animations:^{maybeLaterButton.alpha = 1;}];
        [textView setHidden:NO];

    }

    //textView.text = @"test: @%", description ];
    //textView.text = description;
    //size the UItextView
    
    
    

    self.priceFormatter = [[NSNumberFormatter alloc] init];
    [self.priceFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [self.priceFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    //int i = products.count;
    // NSLog(@"number in array %d", i);
    
}

/*
- (void)crossfade {
    [UIView animateWithDuration:.25 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imageView.alpha = !imageView.alpha;
    }completion:^(BOOL done){
        //
    }];
}
*/


-(IBAction)restoreButtonPressed:(id)sender;{
    [Flurry logEvent:@"000b Restore Button Pressed"];

    NSLog(@"restoreButtonPressed");
    [restoreActivity startAnimating];
    restoreActivity.hidden = YES;
    [[ProductsIAHelper sharedInstance] restoreCompletedTransactions];
    //restoreActivity.hidden = YES;
    [UIView animateWithDuration:1.00 animations:^{purchaseButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{restoreButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{textView.alpha = 0;}];
    [UIView animateWithDuration:3.00 animations:^{upgradeButton.alpha = 1;}];
    [UIView animateWithDuration:1.00 animations:^{maybeLaterButton.alpha = 0;}];
    [UIView animateWithDuration:3.00 animations:^{sendFeedbackButton.alpha = 1;}];


    //[textView setHidden:YES];
    [imageView stopAnimating];
    [UIView animateWithDuration:1.00 animations:^{directionView1.alpha = 1;}];
    [UIView animateWithDuration:1.00 animations:^{directionView2.alpha = 1;}];

    [UIView animateWithDuration:1.00 animations:^{slideTutorialText.alpha = 1;}];
    imageView.image = [UIImage imageNamed:@"Main.png"];
    //[[UIApplication sharedApplication] setStatusBarHidden:NO];
    imageView.alpha = 1;

    
}



-(IBAction)purchaseButtonPressed:(id)sender;{
    [Flurry logEvent:@"000c Purchase Button Pressed"];

    NSLog(@"purchaseButtonPressed");
    
    [buyActivity startAnimating];
    buyActivity.hidden = YES;
    
    UIButton *buyButton = (UIButton *)sender;
    SKProduct *product = self.products[buyButton.tag];
    NSLog(@"Buying %@...", product.productIdentifier);
    [[ProductsIAHelper sharedInstance] buyProduct:product];
    [UIView animateWithDuration:1.00 animations:^{purchaseButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{restoreButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{textView.alpha = 0;}];
    [UIView animateWithDuration:3.00 animations:^{upgradeButton.alpha = 1;}];
    [UIView animateWithDuration:1.00 animations:^{maybeLaterButton.alpha = 0;}];
    [UIView animateWithDuration:3.00 animations:^{sendFeedbackButton.alpha = 1;}];


    
    //[textView setHidden:YES];
    [imageView stopAnimating];
    [UIView animateWithDuration:1.00 animations:^{directionView1.alpha = 1;}];
    [UIView animateWithDuration:1.00 animations:^{directionView2.alpha = 1;}];

    [UIView animateWithDuration:1.00 animations:^{slideTutorialText.alpha = 1;}];


    imageView.image = [UIImage imageNamed:@"Main.png"];
    //[[UIApplication sharedApplication] setStatusBarHidden:NO];
    imageView.alpha = 1;

}

-(IBAction)maybeLaterButtonPressed:(id)sender{
    
    [Flurry logEvent:@"000e Maybe Later Button Pressed"];

    [UIView animateWithDuration:1.00 animations:^{purchaseButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{restoreButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{textView.alpha = 0;}];
    [UIView animateWithDuration:2.00 animations:^{upgradeButton.alpha = 1;}];
    [UIView animateWithDuration:1.00 animations:^{maybeLaterButton.alpha = 0;}];
    [imageView stopAnimating];
    [UIView animateWithDuration:1.00 animations:^{directionView1.alpha = 1;}];
    [UIView animateWithDuration:1.00 animations:^{directionView2.alpha = 1;}];
    [UIView animateWithDuration:3.00 animations:^{sendFeedbackButton.alpha = 1;}];

    [UIView animateWithDuration:1.00 animations:^{slideTutorialText.alpha = 1;}];


    imageView.image = [UIImage imageNamed:@"Main.png"];
    //[[UIApplication sharedApplication] setStatusBarHidden:NO];
    imageView.alpha = 1;

}




//- (void)productsPurchased{
   
//}

//notification when a product is purchsed
- (void)productPurchased:(NSNotification *)notification {

    NSLog(@"Products Purchase, class method");
    //load buttons in an array to allow global change
    
    [UIView animateWithDuration:0.00 animations:^{upgradeButton.alpha = 0;}];
    //purchasing = YES;
    
    //[self viewDidLoad];
    //[self loadView];
    
    //[SidebarViewController viewDidLoad];
    
    
    //[restoreActivity stopAnimating];
    //restoreActivity.hidden = YES;
    //buyActivity.hidden = YES;
    


}

-(IBAction)showPopover:(id)sender;
{
    //
    
}



- (void)viewDidLoad
{

#ifdef NDEBUG
    // do nothing
#define MyLog(...)
#else
#define MyLog NSLog
#endif
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];

    [Flurry logEvent:@"000 Main Read"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:IAPHelperProductPurchasedNotification object:nil];
    
    //load images into an array
    //UIImage *img1 = [UIImage imageNamed:@"Main.png"];
	UIImage *img2 = [UIImage imageNamed:@"IAP_1.PNG"];
	UIImage *img3 = [UIImage imageNamed:@"IAP_2.PNG"];
    UIImage *img4 = [UIImage imageNamed:@"IAP_3.PNG"];
    UIImage *img5 = [UIImage imageNamed:@"IAP_4.PNG"];

    
    self.imageArrayAnimation = [NSArray arrayWithObjects:img2,img3,img4,img5, nil];
    
    
    imageView.image = [UIImage imageNamed:@"Main.png"];
    imageView.frame = self.view.bounds;
    //imageView.frame.origin = self.view.bounds.origin;
    //imageView.image
    
   // imageView.frame = CGRectMake(0, 0 ,self.view.bounds.size.width,self.view.bounds.size.height);


    //float imgFactor = imageView.frame.size.height / imageView.frame.size.width;
 //   imageFrame.frame.size.width = [[UIScreen mainScreen] bounds].size.width;
 //   imageFrame.frame.size.height = frame.size.width * imgFactor;
    
//    CGRect frameRect = imageView.frame;
//    CGPoint rectPoint = frameRect.origin;
//    CGFloat newXPos = rectPoint.x - 0.5f;
//    imageView.frame = CGRectMake(newXPos, 0.0f, imageView.frame.size.width, imageView.frame.size.height);

    
//    UIImage *image = [[UIImage imageNamed:@"Shadowed.png"]
//    imageWithAlignmentRectInsets :UIEdgeInsetsMake(0, 0, 20, 20)];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    
    
     textView.text = @"DESCRIPTION WILL GO HERE";
     // Round text view corners
     CALayer *textLayer = [textView layer];
     [textLayer setMasksToBounds:YES];
     [textLayer setCornerRadius:10.0f];
     //text view set border
     textView.layer.borderWidth = 1.0f;
     textView.layer.borderColor = [[UIColor blackColor] CGColor];
     
     //get initial width set in storyboard
     textWidth = textView.frame.size.width;
     //size the UItextView
     [textView sizeToFit];
     CGRect frame= textView.frame;
     frame.size.width=textWidth;
     textView.frame=frame;
    [textView setHidden:YES];

//    //setup for iPad devices
//    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
//        [[UIApplication sharedApplication] setStatusBarHidden:YES];
//        
//        textView.frame = CGRectMake(200,200,textWidth,127);
//        
//    }
    
     /*
     NSLog(@"frame height: %f", textView.frame.size.height);
     NSLog(@"frame width: %f", textView.frame.size.width);
     */
    
    //load buttons in an array to allow global change
    NSArray *buttons = [NSArray arrayWithObjects: self.iapButton,self.upgradeButton,self.restoreButton,self.purchaseButton, self.maybeLaterButton, nil];
    
    
    for(UIButton *btn in buttons)
    {
        // set buttons settings globally here
        //Set button background colors
        // Set the button Text Color
        
        //  [btn setBackgroundColor:[UIColor colorWithRed:0.0f / 255.0f green:200.0f / 255.0f blue:252.0f / 255.0f alpha:1.0f]];
        
        /*      // Draw a custom gradient
         CAGradientLayer *btnGradient = [CAGradientLayer layer];
         btnGradient.frame = btn.bounds;
         btnGradient.colors = [NSArray arrayWithObjects:
         (id)[[UIColor colorWithRed:0.0f / 255.0f green:200.0f / 255.0f blue:252.0f / 255.0f alpha:1.0f] CGColor],
         (id)[[UIColor colorWithRed:18.0f / 255.0f green:252.0f / 255.0f blue:182.0f / 255.0f alpha:1] CGColor],
         nil];
         [btn.layer insertSublayer:btnGradient atIndex:0];
         */
        // Round button corners
        CALayer *btnLayer = [btn layer];
        [btnLayer setMasksToBounds:YES];
        [btnLayer setCornerRadius:5.0f];
        // Apply a 1 pixel, black border around Buy Button
        [btnLayer setBorderWidth:1.0f];
        [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
        
    }
    
    
    CALayer *btnLayer = [iapButton layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    // Apply a 1 pixel, black border around Buy Button
    [btnLayer setBorderWidth:1.0f];
    [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
    
    CALayer *btnLayer2 = [upgradeButton layer];
    [btnLayer2 setMasksToBounds:YES];
    [btnLayer2 setCornerRadius:5.0f];
    // Apply a 1 pixel, black border around Buy Button
    [btnLayer2 setBorderWidth:1.0f];
    [btnLayer2 setBorderColor:[[UIColor blackColor] CGColor]];
    
    CALayer *btnLayer3 = [restoreButton layer];
    [btnLayer3 setMasksToBounds:YES];
    [btnLayer3 setCornerRadius:5.0f];
    // Apply a 1 pixel, black border around Buy Button
    [btnLayer3 setBorderWidth:1.0f];
    [btnLayer3 setBorderColor:[[UIColor blackColor] CGColor]];
    
    CALayer *btnLayer4 = [purchaseButton layer];
    [btnLayer4 setMasksToBounds:YES];
    [btnLayer4 setCornerRadius:5.0f];
    // Apply a 1 pixel, black border around Buy Button
    [btnLayer4 setBorderWidth:1.0f];
    [btnLayer4 setBorderColor:[[UIColor blackColor] CGColor]];
    
    CALayer *btnLayer5 = [maybeLaterButton layer];
    [btnLayer5 setMasksToBounds:YES];
    [btnLayer5 setCornerRadius:5.0f];
    // Apply a 1 pixel, black border around Buy Button
    [btnLayer5 setBorderWidth:1.0f];
    [btnLayer5 setBorderColor:[[UIColor blackColor] CGColor]];
    
    
//    CALayer *btnLayer6 = [sendFeedbackButton layer];
//    [btnLayer6 setMasksToBounds:YES];
//    [btnLayer6 setCornerRadius:5.0f];
//    // Apply a 1 pixel, black border around Buy Button
//    [btnLayer6 setBorderWidth:1.0f];
//    [btnLayer6 setBorderColor:[[UIColor blackColor] CGColor]];

    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"hasSeenTutorial"]){
        //could create a view to run through a tutorial here later
        //[self displayTutorial];
        
        //turn off any tuturial buttons or text
        //***   [UIView animateWithDuration:0.00 animations:^{slideTutorialText.alpha = 0;}];
        
        NSLog(@"User had seen tutorial button");
        
    }
    
    //log that the main screen has beed displayed and user has seen tururial text.
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasSeenTutorial"];
    
    
    
    //*******TURN ON IF USING IAP BUTTON
    [UIView animateWithDuration:0.00 animations:^{iapButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{restoreButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{purchaseButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{maybeLaterButton.alpha = 0;}];

    if([[NSUserDefaults standardUserDefaults] boolForKey:@"com.kpphillips.NavisRef.essentials1"]){
        [UIView animateWithDuration:0.00 animations:^{upgradeButton.alpha = 0;}];
        
    }
    
    
    
    //Set up botton and text locations
    CGRect newSize = CGRectMake(self.view.bounds.size.width - textViewBottomPadding - sendFeedbackButton.frame.size.width,
                                textViewBottomPadding + 13,
                                sendFeedbackButton.frame.size.width,
                                sendFeedbackButton.frame.size.height);//x,y - width,height
    sendFeedbackButton.frame = newSize;
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        
        //Set up botton and text locations
        CGRect newSize = CGRectMake(self.view.bounds.size.width - textViewBottomPadding - sendFeedbackButton.frame.size.width,
                                    textViewBottomPadding + 3,
                                    sendFeedbackButton.frame.size.width,
                                    sendFeedbackButton.frame.size.height);//x,y - width,height
        sendFeedbackButton.frame = newSize;
        
    }

    //Set up botton and text locations
    newSize = CGRectMake(self.view.bounds.size.width - textViewBottomPadding - upgradeButton.frame.size.width,
                                self.view.bounds.size.height - textViewBottomPadding - upgradeButton.frame.size.height,
                                upgradeButton.frame.size.width,
                                upgradeButton.frame.size.height);//x,y - width,height
    upgradeButton.frame = newSize;
    
    maybeLaterButton.frame = upgradeButton.frame;
    //set activity button on this
    upgradeActivity.frame = upgradeButton.frame;

    
//    //Set up botton and text locations
//    newSize = CGRectMake(self.view.bounds.size.width - textViewBottomPadding - maybeLaterButton.frame.size.width,
//                                self.view.bounds.size.height - textViewBottomPadding - maybeLaterButton.frame.size.height,
//                                maybeLaterButton.frame.size.width,
//                                maybeLaterButton.frame.size.height);//x,y - width,height
//    maybeLaterButton.frame = newSize;
   
    NSLog(@"size %f, %f,", self.view.bounds.size.width,self.view.bounds.size.height );
    
    //Set up botton and text locations
    newSize = CGRectMake(self.view.bounds.size.width - textViewBottomPadding - restoreButton.frame.size.width,
                                self.view.bounds.size.height - (textViewBottomPadding*2) - (restoreButton.frame.size.height*2),
                                restoreButton.frame.size.width,
                                restoreButton.frame.size.height);//x,y - width,height
    restoreButton.frame = newSize;
    
    
    
    //Set up botton and text locations
    newSize = CGRectMake(self.view.bounds.size.width - textViewBottomPadding - purchaseButton.frame.size.width,
                         self.view.bounds.size.height - (textViewBottomPadding*3) - (purchaseButton.frame.size.height*3),
                         purchaseButton.frame.size.width,
                         purchaseButton.frame.size.height);//x,y - width,height
    purchaseButton.frame = newSize;

    
    
    
    NSLog(@"size %f, %f,", self.view.bounds.size.width,self.view.bounds.size.height );
    

    newSize = CGRectMake(self.view.bounds.size.width - (textViewBottomPadding*2) - upgradeButton.frame.size.width - textView.frame.size.width,
                                self.view.bounds.size.height - textViewBottomPadding - textView.frame.size.height,
                                textView.frame.size.width,
                                textView.frame.size.height);//x,y - width,height
    
    //newSize = CGRectMake(200,200, 200,150);//x,y - width,height
    textView.frame = newSize;


    
    
    //activity indicator
    
    //*******TURN ON IF USING UPGRADE BUTTON
    
    
	// Do any additional setup after loading the view.
    // Change button color
    //    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    //    _sidebarButton.target = self.revealViewController;
    //    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    // not during an app purchase tho
 //   if (!purchasing) {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
 //       purchasing = NO;
 //   }
    
    //    self.title = @"";
    
    // controller = [[ProductsTableViewController alloc] initWithStyle:(UITableViewStyle):@"ProductsTableViewController" bundle:nil];
    // popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
    [super viewDidLoad];
    
    
}


- (void)viewDidDisappear:(BOOL)animated{
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [Flurry logEvent:@"000a IAP Button Pressed"];
    
    //uiString = @"asdf";
    
    //find each segue identifier and load its string
    if ([segue.identifier isEqualToString:@"showPopover"]) {
        //    _uiString = @"Application Button and Menu: Location for accessing files common tools.";
        //
        
        //NSLog(@"Invalid product id: %@" , productIdentifier);
        NSLog(@"Prepare for segue");
        UINavigationController *navbar = [[UINavigationController alloc] init];
        
        
        ProductsTableViewController *content = [[ProductsTableViewController alloc] initWithStyle:navbar];
        //init nav bar
        //ProductsTableViewController *content = [[ProductsTableViewController alloc] init];
        //init nav bar
        //UINavigationController *navbar = [[UINavigationController alloc] initWithRootViewController:content];
        float popoverWidth = 320;
        float popoverHeight = 640;
        float navBarHeight = 80;
        navbar.preferredContentSize = CGSizeMake(popoverWidth, navBarHeight);
        
        
        UIPopoverController *aPopover = [[UIPopoverController alloc]
                                         initWithContentViewController:content];
        aPopover.popoverContentSize = CGSizeMake(popoverWidth, popoverHeight);
        
        
        //    [aPopover presentPopoverFromRect:iapButton.frame inView:self.view permittedArrowDirections: UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionUp animated:YES];
    }
    
    
    
    //set the view options
    if ([segue.destinationViewController isKindOfClass:[ProductsTableViewController class]]) {
        //     ProductsTableViewController *isc = (ProductsTableViewController *) segue.destinationViewController;
        //     isc.text = [[NSAttributedString alloc] initWithString:[self.uiString description]];
        NSLog(@"segue set view controller");
        // ProductsTableViewController *myObject = [[ProductsTableViewController alloc] init];
        //show the view?? self??
        // [myObject self];
        
        
        
        
        
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
