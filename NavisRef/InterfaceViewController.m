//
//  InterfaceViewController.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 9/8/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import "InterfaceViewController.h"
#import "SWRevealViewController.h"
//#import "InterfacePopViewController.h"
#import "Flurry.h"


//#import <QuartzCore/QuartzCore.h>


@interface UIViewController ()

@end

@implementation InterfaceViewController{    //#UPDATE 1.1
    
    CGPoint endImage;
    CGRect originalLayoutSize;
    CGPoint imageShift;
    CGPoint buttonShift;
    CGPoint pointValueForCurrentButton;
    
    
    float buttonxMultiplier;
    float buttonyMultiplier;
    BOOL buttonsShifted;
    NSInteger okButtonQuadrant;
    NSInteger appButtonQuadrant;
    NSInteger quickButtonQuadrant;
    NSInteger infoButtonQuadrant;
    NSInteger ribbonButtonQuadrant;
    NSInteger dockButtonQuadrant;
    NSInteger sceneButtonQuadrant;
    NSInteger navButtonQuadrant;
    NSInteger statusButtonQuadrant;

    
    
    
    CGPoint okButtonShift;
    CGPoint appButtonShift;
    CGPoint quickButtonShift;
    CGPoint infoButtonShift;
    CGPoint ribbonButtonShift;
    CGPoint dockButtonShift;
    CGPoint sceneButtonShift;
    CGPoint navButtonShift;
    CGPoint statusButtonShift;

    
    
}    //#UPDATE 1.1


//@synthesize showPopover;
@synthesize okButton;
@synthesize appButton;
@synthesize quickButton;
@synthesize infoButton;
@synthesize ribbonButton;
@synthesize dockButton;
@synthesize sceneButton;
@synthesize navButton;
@synthesize statusButton;
//@synthesize uiString;
@synthesize textView;
@synthesize imageView;


//#UPDATE 1.1
//static CGFloat textWidth = 0;
static CGFloat imageScaleFactor = 1.75; //1.25 clear, 1.6875 is vertically 1/2 poportional, 1.443 is ipad porportional
static NSInteger quadrantNumber = 0;
static CGFloat textViewBottomPadding = 12;
static float iPadPointHeightLandscape = 768;
static CGFloat iphoneButtonOffsetY = 15;


//called before view did load method
-(void)viewDidLayoutSubviews{
    //set text size and origin
    textView.frame = [self setTextViewSizeAndOrigin:pointValueForCurrentButton.y];
}

//#UPDATE 1.1



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{


    
    [Flurry logEvent:@"001 Interface"];

    //*****need to set the popover delegate somewhere
    //    _popoverController.delegate = self;
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Change button color
//    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
 //   _sidebarButton.target = self.revealViewController;
 //   _sidebarButton.action = @selector(revealToggle:);
    
    //Set Text view
    textView.text = @"Visit kpphillips.com to download supporting files that follow along with the tutorials.  Start by opening the Architectural file.  Press a numbered button to see information about the User Interface.";
    [UITextView animateWithDuration:1.00 animations:^{textView.alpha = 1;}];
    
    
    
    // Round text view corners
    CALayer *textLayer = [textView layer];
    [textLayer setMasksToBounds:YES];
    [textLayer setCornerRadius:10.0f];
    //text view set border
    textView.layer.borderWidth = 1.0f;
    textView.layer.borderColor = [[UIColor blackColor] CGColor];
    
    NSLog(@"frame height: %f", textView.frame.size.height);
    NSLog(@"frame width: %f", textView.frame.size.width);

    //load buttons in an array to allow global change
    NSArray *buttons = [NSArray arrayWithObjects: self.okButton, self.appButton, self.quickButton, self.infoButton, self.ribbonButton, self.dockButton, self.sceneButton, self.navButton, self.statusButton, nil];
    
     for(UIButton *btn in buttons)
    {
        // set buttons settings globally here
        //Set button background colors
        // Set the button Text Color
     
        [btn setBackgroundColor:[UIColor colorWithRed:0.0f / 255.0f green:200.0f / 255.0f blue:252.0f / 255.0f alpha:1.0f]];
        
        // Draw a custom gradient
        CAGradientLayer *btnGradient = [CAGradientLayer layer];
        btnGradient.frame = btn.bounds;
        btnGradient.colors = [NSArray arrayWithObjects:
                              (id)[[UIColor colorWithRed:0.0f / 255.0f green:200.0f / 255.0f blue:252.0f / 255.0f alpha:1.0f] CGColor],
                              (id)[[UIColor colorWithRed:18.0f / 255.0f green:252.0f / 255.0f blue:182.0f / 255.0f alpha:1] CGColor],
                              nil];
        [btn.layer insertSublayer:btnGradient atIndex:0];

        // Round button corners
        CALayer *btnLayer = [btn layer];
        [btnLayer setMasksToBounds:YES];
        [btnLayer setCornerRadius:5.0f];
        // Apply a 1 pixel, black border around Buy Button
        [btnLayer setBorderWidth:1.0f];
        [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
    
    }
    
    //fade in the 1st button and blink
    [UIView animateWithDuration:0.00 animations:^{okButton.alpha = 1;}];
    [UIView animateWithDuration:0.00 animations:^{appButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{quickButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{infoButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{ribbonButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{dockButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{sceneButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{navButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{statusButton.alpha = 0;}];
    
    //#UPDATE 1.1
    //mask image to view
    // Create a mask layer and the frame to determine what will be visible in the view.
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGRect maskRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    // Create a path with the rectangle in it.
    CGPathRef path = CGPathCreateWithRect(maskRect, NULL);
    // Set the path to the mask layer.
    maskLayer.path = path;
    // Release the path since it's not covered by ARC.
    CGPathRelease(path);
    // Set the mask of the view.
    self.view.layer.mask = maskLayer;
    

    //setup for iPad devices
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        //Move image Utilities
        imageView.contentMode = UIViewContentModeTopLeft;
        imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
        endImage.x = 1; //set so the gesture recognzer works on load
        imageView.contentScaleFactor = imageScaleFactor;
        
        
        //default calcs
        originalLayoutSize = CGRectMake(0, 0, 1024, 768); //buttons layed out on iPad view
        buttonxMultiplier = ((imageView.image.size.width / imageView.contentScaleFactor)/originalLayoutSize.size.width);
        buttonyMultiplier = ((imageView.image.size.height / imageView.contentScaleFactor)/originalLayoutSize.size.height);
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:okButton.frame.origin];
            okButtonQuadrant = quadrantBasedOnButton; //hold Q
            //need to calculate button location
            //buttonShift = CGPointMake(0, 0);
            [self moveImageToQuadrant:okButtonQuadrant];
            buttonShift.x = ((buttonxMultiplier * (okButton.center.x)) + imageShift.x); //approx 320
            buttonShift.y = ((buttonyMultiplier * (okButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor)); //approx 80
            okButtonShift =  buttonShift; //hold button shift center
        }
        
        //may need to animate button moveing or displaying
        okButton.center = CGPointMake(okButtonShift.x, okButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(okButton.center.x, okButton.center.y);
    
    //#UPDATE 1.1

}

/*
-(IBAction)showPopover:(id)sender{
    //add text to popover
    }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        //uiString = @"asdf";

    //find each segue identifier and load its string
    if ([segue.identifier isEqualToString:@"sw_amPop"]) {
        _uiString = @"Application Button and Menu: Location for accessing files common tools.";
    }
    else if ([segue.identifier isEqualToString:@"sw_qtPop"]){
        _uiString = @"Quick Access Toolbar: Convenient location for frequently used commands.";
    }
    else if ([segue.identifier isEqualToString:@"sw_icPop"]){
        _uiString = @"InfoCenter: Allows access to many product-related information sources";
    }
    else if ([segue.identifier isEqualToString:@"sw_tpPop"]){
        _uiString = @"Ribbon: Tabs and palletts that allow access to tools and controls";
    }
    else if ([segue.identifier isEqualToString:@"sw_dwPop"]){
        _uiString = @"Dockable Windows: Functional windows for accessibility to tools and features";
    }
    else if ([segue.identifier isEqualToString:@"sw_svPop"]){
        _uiString = @"Scene View: Area where you interact with you 3D models.";
    }
    else if ([segue.identifier isEqualToString:@"sw_ntPop"]){
        _uiString = @"Navigation Tools: Interactive navigation and orientation of 3D models.";
    }
    else if ([segue.identifier isEqualToString:@"sw_sbPop"]){
        _uiString = @"Status Bar: Indication of file performance on your computer";
    }

    
//set the view options
        if ([segue.destinationViewController isKindOfClass:[InterfacePopViewController class]]) {
            InterfacePopViewController *isc = (InterfacePopViewController *) segue.destinationViewController;
            isc.text = [[NSAttributedString alloc] initWithString:[self.uiString description]];
        }

}

//gets called when popover is dismissedfrom user pressing on screen somewhere
//does not get called if dismissed programatically
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)sender{
    //popover dismissed
    NSLog(@"%s", __func__);

}
*/

- (void)textViewDidChange:(UITextView *)textView
{
   //
    
}

/*
- (CGFloat)textViewHeightForText:(NSString *)text andWidth:(CGFloat)textWidth
{
    //UITextView *textView = [[UITextView alloc] init];
    [textView setText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(textWidth, FLT_MAX)];
    return size.height;
}
*/

- (IBAction)okButtonPressed:(id)sender {
    //add popover here
    
    [UIView animateWithDuration:1.00 animations:^{okButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{appButton.alpha = 1;}];
    textView.text = @"1. Application Button and Menu: Location for accessing files common tools.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:appButton.frame.origin];
            appButtonQuadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:appButtonQuadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (appButton.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (appButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            appButtonShift = buttonShift;
        }
        [self moveImageToQuadrant:appButtonQuadrant];
        appButton.center = CGPointMake(appButtonShift.x, appButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(appButton.center.x, appButton.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:appButton.center.y];
    }];
    
}


- (IBAction)appButtonPressed:(id)sender {
    //add popover here
    
    [UIView animateWithDuration:1.00 animations:^{appButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{quickButton.alpha = 1;}];
    textView.text = @"2. Quick Access Toolbar: Convenient location for frequently used commands.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:quickButton.frame.origin];
            quickButtonQuadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:quickButtonQuadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (quickButton.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (quickButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            quickButtonShift = buttonShift;
        }
        [self moveImageToQuadrant:quickButtonQuadrant];
        quickButton.center = CGPointMake(quickButtonShift.x, quickButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(quickButton.center.x, quickButton.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:quickButton.center.y];
    }];

}

- (IBAction)quickButtonPressed:(id)sender {
    //add popover here
    [UIView animateWithDuration:1.00 animations:^{quickButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{infoButton.alpha = 1;}];
    textView.text = @"3. InfoCenter: Allows access to many product-related information sources.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:infoButton.frame.origin];
            infoButtonQuadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:infoButtonQuadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (infoButton.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (infoButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            infoButtonShift = buttonShift;
        }
        [self moveImageToQuadrant:infoButtonQuadrant];
        infoButton.center = CGPointMake(infoButtonShift.x, infoButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(infoButton.center.x, infoButton.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:infoButton.center.y];
    }];


}

- (IBAction)infoButtonPressed:(id)sender {
    //add popover here
    [UIView animateWithDuration:1.00 animations:^{infoButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{ribbonButton.alpha = 1;}];
    textView.text = @"4. Ribbon: Tabs and palletts that allow access to tools and controls.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:ribbonButton.frame.origin];
            ribbonButtonQuadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:ribbonButtonQuadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (ribbonButton.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (ribbonButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            ribbonButtonShift = buttonShift;
        }
        [self moveImageToQuadrant:ribbonButtonQuadrant];
        ribbonButton.center = CGPointMake(ribbonButtonShift.x, ribbonButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(ribbonButton.center.x, ribbonButton.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:ribbonButton.center.y];
    }];
}
- (IBAction)ribbonButtonPressed:(id)sender {
    //add popover here
    
    [UIView animateWithDuration:1.00 animations:^{ribbonButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{dockButton.alpha = 1;}];
    textView.text = @"5. Dockable Windows: Functional windows for accessibility to tools and features.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:dockButton.frame.origin];
            dockButtonQuadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:dockButtonQuadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (dockButton.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (dockButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            //button offset
            if ((buttonShift.y + 22) > (self.view.bounds.size.height - textViewBottomPadding)) {
                buttonShift.y = (self.view.bounds.size.height - 22 - textViewBottomPadding);
            }//button offset
            
            dockButtonShift = buttonShift;
        }
        [self moveImageToQuadrant:dockButtonQuadrant];
        dockButton.center = CGPointMake(dockButtonShift.x, dockButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(dockButton.center.x, dockButton.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:dockButton.center.y];
    }];

}
- (IBAction)dockButtonPressed:(id)sender {
    //add popover here
    [UIView animateWithDuration:1.00 animations:^{dockButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{sceneButton.alpha = 1;}];
    textView.text = @"6. Scene View: Area where you interact with you 3D models.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:sceneButton.frame.origin];
            sceneButtonQuadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:sceneButtonQuadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (sceneButton.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (sceneButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            //y button offset
            if ((buttonShift.y + 22) > (self.view.bounds.size.height - textViewBottomPadding)) {
                buttonShift.y = (self.view.bounds.size.height - 22 - textViewBottomPadding);
                
            }//y button offset
            
            sceneButtonShift = buttonShift;
        }
        [self moveImageToQuadrant:sceneButtonQuadrant];
        sceneButton.center = CGPointMake(sceneButtonShift.x, sceneButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(sceneButton.center.x, sceneButton.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:sceneButton.center.y];
    }];

}
- (IBAction)sceneButtonPressed:(id)sender {
    //add popover here
    [UIView animateWithDuration:1.00 animations:^{sceneButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{navButton.alpha = 1;}];
    textView.text = @"7. Navigation Tools: Interactive navigation and orientation of 3D models.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:navButton.frame.origin];
            navButtonQuadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:navButtonQuadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (navButton.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (navButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            navButtonShift = buttonShift;
        }
        [self moveImageToQuadrant:navButtonQuadrant];
        navButton.center = CGPointMake(navButtonShift.x, navButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(navButton.center.x, navButton.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:navButton.center.y];
    }];

}
- (IBAction)navButtonPressed:(id)sender {
    //add popover here
    [UIView animateWithDuration:1.00 animations:^{navButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{statusButton.alpha = 1;}];
    textView.text = @"8. Status Bar: Indication of file performance on your computer.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:statusButton.frame.origin];
            statusButtonQuadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:statusButtonQuadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (statusButton.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (statusButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            statusButtonShift = buttonShift;
        }
        [self moveImageToQuadrant:statusButtonQuadrant];
        statusButton.center = CGPointMake(statusButtonShift.x, statusButtonShift.y);
    }
    pointValueForCurrentButton = CGPointMake(statusButton.center.x, statusButton.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:statusButton.center.y];
    }];

}
- (IBAction)statusButtonPressed:(id)sender {
    //add popover here
    [UIView animateWithDuration:1.00 animations:^{statusButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{okButton.alpha = 1;}];
    textView.text = @"Visit kpphillips.com to download supporting files that follow along with the tutorials.  Start by opening the Architectural file.  Press a numbered button to see information about the User Interface.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        [self moveImageToQuadrant:okButtonQuadrant];
        
        buttonsShifted = YES; //note that all buttons have been moved
    }
    pointValueForCurrentButton = CGPointMake(okButton.center.x, okButton.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:okButton.center.y];
    }];
}

//used to calculate size and origin of textview based on text string
-(CGRect)setTextViewSizeAndOrigin:(CGFloat)thisButtonCenterY{
    
    CGSize newSize = [textView sizeThatFits:CGSizeMake(self.view.bounds.size.width-(textViewBottomPadding*2), MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, self.view.bounds.size.width-(textViewBottomPadding*2)), newSize.height);
    newFrame.origin.y = self.view.bounds.size.height - newFrame.size.height - textViewBottomPadding;
    newFrame.origin.x = textViewBottomPadding;
    
    if ((thisButtonCenterY + 22 + 2) > newFrame.origin.y) {
        NSLog(@"overlapping");
        newFrame.origin.y = textViewBottomPadding;
        
        if (self.view.bounds.size.height == iPadPointHeightLandscape){
            newFrame.origin.y = textViewBottomPadding + 20;
            
        }
        
        
    }
    return newFrame;
}


//used to determine the Quadrant to move the image to based on the location of the button
-(NSInteger)determineQuadrant:(CGPoint)aPointOrigin{
    float oneThirdSize = originalLayoutSize.size.height/3;
    //CGSize originalLayoutSize = CGSizeMake(1024, 768); //original iPad 1x screen size
    if (aPointOrigin.x < (originalLayoutSize.size.width/2)  && aPointOrigin.y < (originalLayoutSize.size.height/2)) {
        quadrantNumber = 1;
    }else if (aPointOrigin.x > (originalLayoutSize.size.width/2)  && aPointOrigin.y < (originalLayoutSize.size.height/2)) {
        quadrantNumber = 2;
    }else if (aPointOrigin.x < (originalLayoutSize.size.width/2)  &&
              aPointOrigin.y > oneThirdSize && aPointOrigin.y < oneThirdSize*2) {
        quadrantNumber = 3;
    }else if (aPointOrigin.x > (originalLayoutSize.size.width/2)  &&
              aPointOrigin.y > oneThirdSize && aPointOrigin.y < oneThirdSize*2) {
        quadrantNumber = 4;
    }else if (aPointOrigin.x < (originalLayoutSize.size.width/2)  && aPointOrigin.y > (originalLayoutSize.size.height/2)) {
        quadrantNumber = 5;
    }else {
        quadrantNumber = 6;
    }
    return quadrantNumber;
}

//this method is used when a button is pressed to move the image to the correct Quadrant
-(void)moveImageToQuadrant:(NSInteger)aQuadrant{
    
    imageShift = CGPointMake(0, 0);
    
    if (aQuadrant == 1) {
        //top left
        imageShift = CGPointMake(0,0);
    }else if (aQuadrant == 2){
        //top right
        imageShift = CGPointMake(self.view.bounds.size.width - (imageView.image.size.width/imageView.contentScaleFactor) ,0);
    }else if (aQuadrant == 3){
        //middle left
        imageShift = CGPointMake(0,-originalLayoutSize.size.height/3);
    }else if (aQuadrant == 4){
        //middle right
        imageShift = CGPointMake(self.view.bounds.size.width - (imageView.image.size.width/imageView.contentScaleFactor),
                                 -originalLayoutSize.size.height/3);
    }else if (aQuadrant == 5){
        //bottom left
        imageShift = CGPointMake(0,self.view.bounds.size.height - (imageView.image.size.height/imageView.contentScaleFactor));
    }else {
        //bottom right
        imageShift = CGPointMake(self.view.bounds.size.width - (imageView.image.size.width/imageView.contentScaleFactor) , self.view.bounds.size.height - (imageView.image.size.height/imageView.contentScaleFactor));
    }
    //determine Quadrant
    //find buttons center and see wich quadrant it fits in
    
    //float slideFactor = 0.01 * slideMult; // Increase for more of a slide
    [UIView animateWithDuration:1.75
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         imageView.frame = CGRectMake(imageShift.x, imageShift.y ,imageView.image.size.width, imageView.image.size.height);
                     } completion:nil];
    endImage = imageView.frame.origin;
    
    //need to return the image shift
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
