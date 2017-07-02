//
//  ClashViewController.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 2/8/14.
//  Copyright (c) 2014 KP Phillips. All rights reserved.
//

#import "ClashViewController.h"
#import "SWRevealViewController.h"
#import "Flurry.h"


@interface ClashViewController ()

@end

@implementation ClashViewController{    //#UPDATE 1.1
    
    CGPoint endImage;
    CGRect originalLayoutSize;
    CGPoint imageShift;
    CGPoint buttonShift;
    CGPoint pointValueForCurrentButton;

    
    float buttonxMultiplier;
    float buttonyMultiplier;
    BOOL buttonsShifted;
    NSInteger button1Quadrant;
    NSInteger button2Quadrant;
    NSInteger button3Quadrant;
    NSInteger button4Quadrant;
    NSInteger button5Quadrant;
    NSInteger button6Quadrant;
    NSInteger button7Quadrant;
    NSInteger button8Quadrant;
    NSInteger button9Quadrant;
    NSInteger button10Quadrant;
    NSInteger button11Quadrant;
    NSInteger button12Quadrant;
    NSInteger button13Quadrant;
    NSInteger button14Quadrant;
    NSInteger button15Quadrant;
    NSInteger button16Quadrant;
    NSInteger button17Quadrant;
    NSInteger button18Quadrant;
    NSInteger button19Quadrant;
    NSInteger button20Quadrant;
    NSInteger button21Quadrant;
    NSInteger button22Quadrant;
    NSInteger button23Quadrant;
    NSInteger button24Quadrant;
    NSInteger button25Quadrant;
    NSInteger button26Quadrant;
    NSInteger button27Quadrant;
    NSInteger button28Quadrant;
    NSInteger button29Quadrant;
    NSInteger button30Quadrant;
    NSInteger button31Quadrant;
    NSInteger button32Quadrant;
    NSInteger button33Quadrant;
    NSInteger button34Quadrant;
    NSInteger button35Quadrant;
    NSInteger button36Quadrant;
    NSInteger button37Quadrant;
    NSInteger button38Quadrant;

    
    
    CGPoint button1Shift;
    CGPoint button2Shift;
    CGPoint button3Shift;
    CGPoint button4Shift;
    CGPoint button5Shift;
    CGPoint button6Shift;
    CGPoint button7Shift;
    CGPoint button8Shift;
    CGPoint button9Shift;
    CGPoint button10Shift;
    CGPoint button11Shift;
    CGPoint button12Shift;
    CGPoint button13Shift;
    CGPoint button14Shift;
    CGPoint button15Shift;
    CGPoint button16Shift;
    CGPoint button17Shift;
    CGPoint button18Shift;
    CGPoint button19Shift;
    CGPoint button20Shift;
    CGPoint button21Shift;
    CGPoint button22Shift;
    CGPoint button23Shift;
    CGPoint button24Shift;
    CGPoint button25Shift;
    CGPoint button26Shift;
    CGPoint button27Shift;
    CGPoint button28Shift;
    CGPoint button29Shift;
    CGPoint button30Shift;
    CGPoint button31Shift;
    CGPoint button32Shift;
    CGPoint button33Shift;
    CGPoint button34Shift;
    CGPoint button35Shift;
    CGPoint button36Shift;
    CGPoint button37Shift;
    CGPoint button38Shift;

    
    
}    //#UPDATE 1.1

@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize button6;
@synthesize button7;
@synthesize button8;
@synthesize button9;
@synthesize button10;
@synthesize button11;
@synthesize button12;
@synthesize button13;
@synthesize button14;
@synthesize button15;
@synthesize button16;
@synthesize button17;
@synthesize button18;
@synthesize button19;
@synthesize button20;
@synthesize button21;
@synthesize button22;
@synthesize button23;
@synthesize button24;
@synthesize button25;
@synthesize button26;
@synthesize button27;
@synthesize button28;
@synthesize button29;
@synthesize button30;
@synthesize button31;
@synthesize button32;
@synthesize button33;
@synthesize button34;
@synthesize button35;
@synthesize button36;
@synthesize button37;
@synthesize button38;



@synthesize imageView;
@synthesize textView;
@synthesize imageArray;
//@synthesize imageArrayAnimation;

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
    [Flurry logEvent:@"017 Clash Detection"];

    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //load images into an array
    UIImage *img1 = [UIImage imageNamed:@"17_01.png"];
	UIImage *img2 = [UIImage imageNamed:@"17_02.png"];
	UIImage *img3 = [UIImage imageNamed:@"17_03.png"];
    UIImage *img4 = [UIImage imageNamed:@"17_04.png"];
    UIImage *img5 = [UIImage imageNamed:@"17_05.png"];
    UIImage *img6 = [UIImage imageNamed:@"17_06.png"];
    UIImage *img7 = [UIImage imageNamed:@"17_07.png"];
    UIImage *img8 = [UIImage imageNamed:@"17_08.png"];
    UIImage *img9 = [UIImage imageNamed:@"17_09.png"];
    UIImage *img10 = [UIImage imageNamed:@"17_10.png"];
    UIImage *img11 = [UIImage imageNamed:@"17_11.png"];
    UIImage *img12 = [UIImage imageNamed:@"17_12.png"];
    UIImage *img13 = [UIImage imageNamed:@"17_13.png"];
    UIImage *img14 = [UIImage imageNamed:@"17_14.png"];
    UIImage *img15 = [UIImage imageNamed:@"17_15.png"];
    UIImage *img16 = [UIImage imageNamed:@"17_16.png"];
    UIImage *img17 = [UIImage imageNamed:@"17_17.png"];
    UIImage *img18 = [UIImage imageNamed:@"17_18.png"];
    UIImage *img19 = [UIImage imageNamed:@"17_19.png"];
    UIImage *img20 = [UIImage imageNamed:@"17_20.png"];
    UIImage *img21 = [UIImage imageNamed:@"17_21.png"];
    UIImage *img22 = [UIImage imageNamed:@"17_22.png"];
    UIImage *img23 = [UIImage imageNamed:@"17_23.png"];
    UIImage *img24 = [UIImage imageNamed:@"17_24.png"];
    UIImage *img25 = [UIImage imageNamed:@"17_25.png"];
    UIImage *img26 = [UIImage imageNamed:@"17_26.png"];
    UIImage *img27 = [UIImage imageNamed:@"17_27.png"];
    UIImage *img28 = [UIImage imageNamed:@"17_28.png"];
    UIImage *img29 = [UIImage imageNamed:@"17_29.png"];
    UIImage *img30 = [UIImage imageNamed:@"17_30.png"];
    UIImage *img31 = [UIImage imageNamed:@"17_31.png"];
    UIImage *img32 = [UIImage imageNamed:@"17_32.png"];
    UIImage *img33 = [UIImage imageNamed:@"17_33.png"];
    UIImage *img34 = [UIImage imageNamed:@"17_34.png"];
    UIImage *img35 = [UIImage imageNamed:@"17_35.png"];
    UIImage *img36 = [UIImage imageNamed:@"17_36.png"];
    UIImage *img37 = [UIImage imageNamed:@"17_37.png"];
    UIImage *img38 = [UIImage imageNamed:@"17_38.png"];

    
    
    
	self.imageArray = [NSArray arrayWithObjects:img1, img2, img3, img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16,img17,img18,img19,img20,img21,img22,img23,img24,img25,img26,img27,img28,img29,img30,img31,img32,img33,img34,img35,img36,img37,img38, nil];
 //   self.imageArrayAnimation = [NSArray arrayWithObjects: img19,img20,img21,img22,img23,img24,img25, nil];
    
    
    imageView.image = [imageArray objectAtIndex:0];
    textView.text = @"1. Close any dialogs that are not needed.";
    
    // Round text view corners
    CALayer *textLayer = [textView layer];
    [textLayer setMasksToBounds:YES];
    [textLayer setCornerRadius:10.0f];
    //text view set border
    textView.layer.borderWidth = 1.0f;
    textView.layer.borderColor = [[UIColor blackColor] CGColor];
    
    
    
    //load buttons in an array to allow global change
    NSArray *buttons = [NSArray arrayWithObjects: self.button1, self.button2, self.button3, self.button4, self.button5, self.button6,self.button7,self.button8, self.button9, self.button10, self.button11, self.button12, self.button13, self.button14, self.button15, self.button16, self.button17, self.button18, self.button19, self.button20, self.button21,self.button22,self.button23,self.button24,self.button25,self.button26,self.button27,self.button28,self.button29,self.button30,self.button31,self.button32,self.button33,self.button34,self.button35,self.button36,self.button37,self.button38,nil];
    
    for(UIButton *btn in buttons)
    {
        // set buttons settings globally here
        
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
    [UIView animateWithDuration:1.00 animations:^{button1.alpha = 1;}];
    [UIView animateWithDuration:0.00 animations:^{button2.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button3.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button4.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button5.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button6.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button7.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button8.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button9.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button10.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button11.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button12.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button13.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button14.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button15.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button16.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button17.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button18.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button19.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button20.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button21.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button22.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button23.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button24.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button25.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button26.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button27.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button28.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button29.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button30.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button31.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button32.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button33.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button34.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button35.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button36.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button37.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{button38.alpha = 0;}];


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
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button1.frame.origin];
            button1Quadrant = quadrantBasedOnButton; //hold Q
            //need to calculate button location
            //buttonShift = CGPointMake(0, 0);
            [self moveImageToQuadrant:button1Quadrant];
            buttonShift.x = ((buttonxMultiplier * (button1.center.x)) + imageShift.x); //approx 320
            buttonShift.y = ((buttonyMultiplier * (button1.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor)); //approx 80
            button1Shift =  buttonShift; //hold button shift center
        }
        
        //may need to animate button moveing or displaying
        button1.center = CGPointMake(button1Shift.x, button1Shift.y);
    
       // button1.center = CGPointMake(250, button1Shift.y);
        NSLog(@"button @%fx, @%fy", button1.center.x, button1.center.y);
        NSLog(@"button @%fx, @%fy", buttonShift.x, buttonShift.y);
    }
    //#UPDATE 1.1

    pointValueForCurrentButton = CGPointMake(button1.center.x, button1.center.y);

}

- (IBAction)button1Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:1];
    [UIView animateWithDuration:1.00 animations:^{button1.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button2.alpha = 1;}];
    textView.text = @"2. Select the the Clash Detection tool.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button2.frame.origin];
            button2Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button2Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button2.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button2.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button2Shift = buttonShift;
        }
        [self moveImageToQuadrant:button2Quadrant];
        button2.center = CGPointMake(button2Shift.x, button2Shift.y);
        NSLog(@"button @%fx, @%fy", buttonShift.x, buttonShift.y);

    
    }
    pointValueForCurrentButton = CGPointMake(button2.center.x, button2.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button2.center.y];
    }];

}

- (IBAction)button2Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:2];
    [UIView animateWithDuration:1.00 animations:^{button2.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button3.alpha = 1;}];
    textView.text = @"3. Select the Add Test tool.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button3.frame.origin];
            button3Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button3Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button3.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button3.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button3Shift = buttonShift;
        }
        [self moveImageToQuadrant:button3Quadrant];
        button3.center = CGPointMake(button3Shift.x, button3Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button3.center.x, button3.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button3.center.y];
    }];

}

- (IBAction)button3Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:3];
    [UIView animateWithDuration:1.00 animations:^{button3.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button4.alpha = 1;}];
    textView.text = @"4. Collapse the clash test dialog by selecting the up arrow.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button4.frame.origin];
            button4Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button4Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button4.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button4.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button4Shift = buttonShift;
        }
        [self moveImageToQuadrant:button4Quadrant];
        button4.center = CGPointMake(button4Shift.x, button4Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button4.center.x, button4.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button4.center.y];
    }];

}

- (IBAction)button4Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:4];
    [UIView animateWithDuration:1.00 animations:^{button4.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button5.alpha = 1;}];
    textView.text = @"5. Select the Rules tab.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button5.frame.origin];
            button5Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button5Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button5.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button5.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button5Shift = buttonShift;
        }
        [self moveImageToQuadrant:button5Quadrant];
        button5.center = CGPointMake(button5Shift.x, button5Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button5.center.x, button5.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button5.center.y];
    }];

}

- (IBAction)button5Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:5];
    [UIView animateWithDuration:1.00 animations:^{button5.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button6.alpha = 1;}];
    textView.text = @"6. Rules can be applied to the clash tests to reduce redundant clashes.  Select the New button to add an additional rule.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button6.frame.origin];
            button6Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button6Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button6.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button6.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button6Shift = buttonShift;
        }
        [self moveImageToQuadrant:button6Quadrant];
        button6.center = CGPointMake(button6Shift.x, button6Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button6.center.x, button6.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button6.center.y];
    }];

}

- (IBAction)button6Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:6];
    [UIView animateWithDuration:1.00 animations:^{button6.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button7.alpha = 1;}];
    textView.text = @"7. Select a rule to view its properties. If none are needed, cancel the dialog.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button7.frame.origin];
            button7Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button7Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button7.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button7.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button7Shift = buttonShift;
        }
        [self moveImageToQuadrant:button7Quadrant];
        button7.center = CGPointMake(button7Shift.x, button7Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button7.center.x, button7.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button7.center.y];
    }];

}

- (IBAction)button7Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:7];
    [UIView animateWithDuration:1.00 animations:^{button7.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button8.alpha = 1;}];
    textView.text = @"8. Choose the Select tab to set up the clash test.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button8.frame.origin];
            button8Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button8Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button8.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button8.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button8Shift = buttonShift;
        }
        [self moveImageToQuadrant:button8Quadrant];
        button8.center = CGPointMake(button8Shift.x, button8Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button8.center.x, button8.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button8.center.y];
    }];
}

- (IBAction)button8Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:8];
    [UIView animateWithDuration:1.00 animations:^{button8.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button9.alpha = 1;}];
    textView.text = @"9. Under Selection A change the display to show the sets that were previously created.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button9.frame.origin];
            button9Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button9Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button9.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button9.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button9Shift = buttonShift;
        }
        [self moveImageToQuadrant:button9Quadrant];
        button9.center = CGPointMake(button9Shift.x, button9Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button9.center.x, button9.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button9.center.y];
    }];
    
}

- (IBAction)button9Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:9];
    [UIView animateWithDuration:1.00 animations:^{button9.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button10.alpha = 1;}];
    textView.text = @"10. Select the Sets option.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button10.frame.origin];
            button10Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button10Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button10.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button10.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button10Shift = buttonShift;
        }
        [self moveImageToQuadrant:button10Quadrant];
        button10.center = CGPointMake(button10Shift.x, button10Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button10.center.x, button10.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button10.center.y];
    }];
    
}

- (IBAction)button10Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:10];
    [UIView animateWithDuration:1.00 animations:^{button10.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button11.alpha = 1;}];
    textView.text = @"11. Select the Sets under the Selection B portion also.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button11.frame.origin];
            button11Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button11Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button11.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button11.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button11Shift = buttonShift;
        }
        [self moveImageToQuadrant:button11Quadrant];
        button11.center = CGPointMake(button11Shift.x, button11Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button11.center.x, button11.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button11.center.y];
    }];

    
}

- (IBAction)button11Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:11];
    [UIView animateWithDuration:1.00 animations:^{button11.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button12.alpha = 1;}];
    textView.text = @"12. Select the Sets in Selection A to to run against the Sets in Selection B.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button12.frame.origin];
            button12Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button12Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button12.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button12.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button12Shift = buttonShift;
        }
        [self moveImageToQuadrant:button12Quadrant];
        button12.center = CGPointMake(button12Shift.x, button12Shift.y);
    }
    
    pointValueForCurrentButton = CGPointMake(button12.center.x, button12.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button12.center.y];
    }];
    
}

- (IBAction)button12Pressed:(id)sender {
    //NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:12];
    [UIView animateWithDuration:1.00 animations:^{button12.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button13.alpha = 1;}];
    textView.text = @"13. Select the icons as indicated at the lower part of the Selection A and B dialog.  Hover over the icons to get a quick description of the icons.  Make the indicated selections in the Settings area.  Select Run Test.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button13.frame.origin];
            button13Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button13Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button13.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button13.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button13Shift = buttonShift;
        }
        [self moveImageToQuadrant:button13Quadrant];
        button13.center = CGPointMake(button13Shift.x, button13Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button13.center.x, button13.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button13.center.y];
    }];
    
}

- (IBAction)button13Pressed:(id)sender {
    //  NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:13];
    [UIView animateWithDuration:1.00 animations:^{button13.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button14.alpha = 1;}];
    textView.text = @"14. With the first clash selected, choose the Item 1 button in the Highlighting section.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button14.frame.origin];
            button14Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button14Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button14.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button14.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button14Shift = buttonShift;
        }
        [self moveImageToQuadrant:button14Quadrant];
        button14.center = CGPointMake(button14Shift.x, button14Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button14.center.x, button14.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button14.center.y];
    }];

    
}

- (IBAction)button14Pressed:(id)sender {
    //  NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:14];
    [UIView animateWithDuration:1.00 animations:^{button14.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button15.alpha = 1;}];
    textView.text = @"15. Select the Item 2 button to highlight the 2nd object in the clash.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button15.frame.origin];
            button15Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button15Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button15.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button15.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button15Shift = buttonShift;
        }
        [self moveImageToQuadrant:button15Quadrant];
        button15.center = CGPointMake(button15Shift.x, button15Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button15.center.x, button15.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button15.center.y];
    }];
    
}

- (IBAction)button15Pressed:(id)sender {
    //  NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:15];
    [UIView animateWithDuration:1.00 animations:^{button15.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button16.alpha = 1;}];
    textView.text = @"16. Select to Highlight all clashes in the view.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button16.frame.origin];
            button16Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button16Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button16.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button16.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button16Shift = buttonShift;
        }
        [self moveImageToQuadrant:button16Quadrant];
        button16.center = CGPointMake(button16Shift.x, button16Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button16.center.x, button16.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button16.center.y];
    }];

    
}

- (IBAction)button16Pressed:(id)sender {
    //  NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:16];
    [UIView animateWithDuration:1.00 animations:^{button16.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button17.alpha = 1;}];
    textView.text = @"17. In the Isolation section select the Dim Other option.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button17.frame.origin];
            button17Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button17Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button17.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button17.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button17Shift = buttonShift;
        }
        [self moveImageToQuadrant:button17Quadrant];
        button17.center = CGPointMake(button17Shift.x, button17Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button17.center.x, button17.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button17.center.y];
    }];
    
}

- (IBAction)button17Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:17];
    [UIView animateWithDuration:1.00 animations:^{button17.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button18.alpha = 1;}];
    textView.text = @"18. In the Viewpoint section select to Animate transitions. When selecting different clashes the model view will zoom in and out to the next clash.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button18.frame.origin];
            button18Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button18Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button18.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button18.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            if ((buttonShift.y + 22) > (self.view.bounds.size.height - textViewBottomPadding)) {
                buttonShift.y = (self.view.bounds.size.height - 22 - textViewBottomPadding);
            }//button offset
            
            button18Shift = buttonShift;
        }
        [self moveImageToQuadrant:button18Quadrant];
        button18.center = CGPointMake(button18Shift.x, button18Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button18.center.x, button18.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button18.center.y];
    }];
    
}

- (IBAction)button18Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:18];
    [UIView animateWithDuration:1.00 animations:^{button18.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button19.alpha = 1;}];
    textView.text = @"19. Select another clash to view the transition.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button19.frame.origin];
            button19Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button19Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button19.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button19.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button19Shift = buttonShift;
        }
        [self moveImageToQuadrant:button19Quadrant];
        button19.center = CGPointMake(button19Shift.x, button19Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button19.center.x, button19.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button19.center.y];
    }];
    
}

/*
- (IBAction)button19Pressed:(id)sender {
    
    //index 18-14
    //animation
    imageView.animationImages = imageArrayAnimation;
    imageView.animationDuration = 5;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    //imageView.image = [imageArray objectAtIndex:18];
    [UIView animateWithDuration:1.00 animations:^{button19.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button20.alpha = 1;}];
    textView.text = @"The simulation will show the objects based on their task settings.  If objects are not visable check the columns for the tasks and the simulation settings to make sure they are accurate for the playback time.";
    
}
*/

- (IBAction)button19Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:19];
    [UIView animateWithDuration:1.00 animations:^{button19.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button20.alpha = 1;}];
    textView.text = @"20. Check the display settings and try new options to see the results in the model view.";
   
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button20.frame.origin];
            button20Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button20Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button20.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button20.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button20Shift = buttonShift;
        }
        [self moveImageToQuadrant:button20Quadrant];
        button20.center = CGPointMake(button20Shift.x, button20Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button20.center.x, button20.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button20.center.y];
    }];
    
}

- (IBAction)button20Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:20];
    [UIView animateWithDuration:1.00 animations:^{button20.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button21.alpha = 1;}];
    textView.text = @"21. Select the Display Settings bar to minimize the options when all the settings are in place.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button21.frame.origin];
            button21Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button21Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button21.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button21.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button21Shift = buttonShift;
        }
        [self moveImageToQuadrant:button21Quadrant];
        button21.center = CGPointMake(button21Shift.x, button21Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button21.center.x, button21.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button21.center.y];
    }];

    
}

- (IBAction)button21Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:21];
    [UIView animateWithDuration:1.00 animations:^{button21.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button22.alpha = 1;}];
    textView.text = @"22. Sort the clashes by selecting the column heading you want to sort.  Choose the Level column.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button22.frame.origin];
            button22Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button22Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button22.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button22.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button22Shift = buttonShift;
        }
        [self moveImageToQuadrant:button22Quadrant];
        button22.center = CGPointMake(button22Shift.x, button22Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button22.center.x, button22.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button22.center.y];
    }];
    
}

- (IBAction)button22Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:22];
    [UIView animateWithDuration:1.00 animations:^{button22.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button23.alpha = 1;}];
    textView.text = @"23. Sort again by selecting the Grid Intersection column.";
   
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button23.frame.origin];
            button23Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button23Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button23.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button23.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button23Shift = buttonShift;
        }
        [self moveImageToQuadrant:button23Quadrant];
        button23.center = CGPointMake(button23Shift.x, button23Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button23.center.x, button23.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button23.center.y];
    }];

    
}

- (IBAction)button23Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:23];
    [UIView animateWithDuration:1.00 animations:^{button23.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button24.alpha = 1;}];
    textView.text = @"24. This will combine clashes at a specific grid intersection.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button24.frame.origin];
            button24Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button24Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button24.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button24.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button24Shift = buttonShift;
        }
        [self moveImageToQuadrant:button24Quadrant];
        button24.center = CGPointMake(button24Shift.x, button24Shift.y);
    }

    pointValueForCurrentButton = CGPointMake(button24.center.x, button24.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button24.center.y];
    }];
    
}

- (IBAction)button24Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:24];
    [UIView animateWithDuration:1.00 animations:^{button24.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button25.alpha = 1;}];
    textView.text = @"25. Clashes can be combined in groups.  Select the New Group button.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button25.frame.origin];
            button25Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button25Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button25.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button25.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button25Shift = buttonShift;
        }
        [self moveImageToQuadrant:button25Quadrant];
        button25.center = CGPointMake(button25Shift.x, button25Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button25.center.x, button25.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button25.center.y];
    }];

    
}

- (IBAction)button25Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:25];
    [UIView animateWithDuration:1.00 animations:^{button25.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button26.alpha = 1;}];
    textView.text = @"26. Name the group based on the clashes that will be included in the group.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button26.frame.origin];
            button26Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button26Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button26.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button26.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button26Shift = buttonShift;
        }
        [self moveImageToQuadrant:button26Quadrant];
        button26.center = CGPointMake(button26Shift.x, button26Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button26.center.x, button26.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button26.center.y];
    }];

    
}

- (IBAction)button26Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:26];
    [UIView animateWithDuration:1.00 animations:^{button26.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button27.alpha = 1;}];
    textView.text = @"27. Select the clashes that will be included in the group by using control select on the keyboard.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button27.frame.origin];
            button27Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button27Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button27.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button27.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button27Shift = buttonShift;
        }
        [self moveImageToQuadrant:button27Quadrant];
        button27.center = CGPointMake(button27Shift.x, button27Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button27.center.x, button27.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button27.center.y];
    }];
    
}

- (IBAction)button27Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:27];
    [UIView animateWithDuration:1.00 animations:^{button27.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button28.alpha = 1;}];
    textView.text = @"28. Drag and drop the selected clashes to the group.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button28.frame.origin];
            button28Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button28Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button28.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button28.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button28Shift = buttonShift;
        }
        [self moveImageToQuadrant:button28Quadrant];
        button28.center = CGPointMake(button28Shift.x, button28Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button28.center.x, button28.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button28.center.y];
    }];
    
}

- (IBAction)button28Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:28];
    [UIView animateWithDuration:1.00 animations:^{button28.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button29.alpha = 1;}];
    textView.text = @"29. Select the arrow next to the group to expand the group.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button29.frame.origin];
            button29Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button29Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button29.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button29.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            if ((buttonShift.y + 22) > (self.view.bounds.size.height - textViewBottomPadding)) {
                buttonShift.y = (self.view.bounds.size.height - 22 - textViewBottomPadding);
            }//button offset
            
            button29Shift = buttonShift;
        }
        [self moveImageToQuadrant:button29Quadrant];
        button29.center = CGPointMake(button29Shift.x, button29Shift.y);
    }
    
    pointValueForCurrentButton = CGPointMake(button29.center.x, button29.center.y);


    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button29.center.y];
    }];
    
}

- (IBAction)button29Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:29];
    [UIView animateWithDuration:1.00 animations:^{button29.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button30.alpha = 1;}];
    textView.text = @"30. You can also create a group based on clashes through a specific object.  Right click on object in the Item 1 area.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button30.frame.origin];
            button30Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button30Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button30.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button30.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button30Shift = buttonShift;
        }
        [self moveImageToQuadrant:button30Quadrant];
        button30.center = CGPointMake(button30Shift.x, button30Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button30.center.x, button30.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button30.center.y];
    }];

    
}

- (IBAction)button30Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:30];
    [UIView animateWithDuration:1.00 animations:^{button30.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button31.alpha = 1;}];
    textView.text = @"31. A group can be created or press escape or click out of the area to close the dialog.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button31.frame.origin];
            button31Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button31Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button31.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button31.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button31Shift = buttonShift;
        }
        [self moveImageToQuadrant:button31Quadrant];
        button31.center = CGPointMake(button31Shift.x, button31Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button31.center.x, button31.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button31.center.y];
    }];

    
}

- (IBAction)button31Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:31];
    [UIView animateWithDuration:1.00 animations:^{button31.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button32.alpha = 1;}];
    textView.text = @"32. Slide the bar on the bottom of the clash window to view more columns from the clash results.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button32.frame.origin];
            button32Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button32Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button32.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button32.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button32Shift = buttonShift;
        }
        [self moveImageToQuadrant:button32Quadrant];
        button32.center = CGPointMake(button32Shift.x, button32Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button32.center.x, button32.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button32.center.y];
    }];
    
}

- (IBAction)button32Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:32];
    [UIView animateWithDuration:1.00 animations:^{button32.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button33.alpha = 1;}];
    textView.text = @"33. Right click on a clash to assign it to a specific person or trade.";
   
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button33.frame.origin];
            button33Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button33Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button33.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button33.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            if ((buttonShift.y + 22) > (self.view.bounds.size.height - textViewBottomPadding)) {
                buttonShift.y = (self.view.bounds.size.height - 22 - textViewBottomPadding);
            }//button offset
            
            button33Shift = buttonShift;
        }
        [self moveImageToQuadrant:button33Quadrant];
        button33.center = CGPointMake(button33Shift.x, button33Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button33.center.x, button33.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button33.center.y];
    }];
    
}

- (IBAction)button33Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:33];
    [UIView animateWithDuration:1.00 animations:^{button33.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button34.alpha = 1;}];
    textView.text = @"34. Select the Assign option.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button34.frame.origin];
            button34Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button34Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button34.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button34.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button34Shift = buttonShift;
        }
        [self moveImageToQuadrant:button34Quadrant];
        button34.center = CGPointMake(button34Shift.x, button34Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button34.center.x, button34.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button34.center.y];
    }];

    
}



- (IBAction)button34Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:34];
    [UIView animateWithDuration:1.00 animations:^{button34.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button35.alpha = 1;}];
    textView.text = @"35. Fill out the dialog with the responsible trade and optional notes.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button35.frame.origin];
            button35Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button35Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button35.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button35.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button35Shift = buttonShift;
        }
        [self moveImageToQuadrant:button35Quadrant];
        button35.center = CGPointMake(button35Shift.x, button35Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button35.center.x, button35.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button35.center.y];
    }];
    
}


- (IBAction)button35Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:35];
    [UIView animateWithDuration:1.00 animations:^{button35.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button36.alpha = 1;}];
    textView.text = @"36. The Assigned column will begin to populate based on the clashes that are assigned by the user.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button36.frame.origin];
            button36Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button36Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button36.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button36.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button36Shift = buttonShift;
        }
        [self moveImageToQuadrant:button36Quadrant];
        button36.center = CGPointMake(button36Shift.x, button36Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button36.center.x, button36.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button36.center.y];
    }];

    
}
- (IBAction)button36Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:36];
    [UIView animateWithDuration:1.00 animations:^{button36.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button37.alpha = 1;}];
    textView.text = @"37. Once groups are made, display settings are set, and clashes are assigned to specific trades, you have the option to export these resupts.  Press the Report tab.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button37.frame.origin];
            button37Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button37Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button37.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button37.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button37Shift = buttonShift;
        }
        [self moveImageToQuadrant:button37Quadrant];
        button37.center = CGPointMake(button37Shift.x, button37Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button37.center.x, button37.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button37.center.y];
    }];

    
}


- (IBAction)button37Pressed:(id)sender {
    // NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:37];
    [UIView animateWithDuration:1.00 animations:^{button37.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button38.alpha = 1;}];
    textView.text = @"38. You have the option to include specific information in clash reports and options for the format for the export.  Export a couple reports to see the results.";
    
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        if (!buttonsShifted) {
            NSInteger quadrantBasedOnButton = [self determineQuadrant:button38.frame.origin];
            button38Quadrant = quadrantBasedOnButton; //hold Q value
            [self moveImageToQuadrant:button38Quadrant];
            //calls function to animate image to move to quadrant
            //calculate and set button location
            buttonShift.x = ((buttonxMultiplier * (button38.center.x)) + imageShift.x);
            buttonShift.y = ((buttonyMultiplier * (button38.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
            button38Shift = buttonShift;
        }
        [self moveImageToQuadrant:button38Quadrant];
        button38.center = CGPointMake(button38Shift.x, button38Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(button38.center.x, button38.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button38.center.y];
    }];

    
}


- (IBAction)button38Pressed:(id)sender {
    //[imageView stopAnimating];
    imageView.image = [imageArray objectAtIndex:0];
    [UIView animateWithDuration:1.00 animations:^{button38.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button1.alpha = 1;}];
    textView.text = @"1. Close any dialogs that are not needed.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
        //Move image Utilities
        imageView.contentScaleFactor = imageScaleFactor;
        //calls function to get Quadrant
        [self moveImageToQuadrant:button1Quadrant];
        
        buttonsShifted = YES; //note that all buttons have been moved
    }
    pointValueForCurrentButton = CGPointMake(button1.center.x, button1.center.y);

    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button1.center.y];
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