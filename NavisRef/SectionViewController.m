//
//  SectionViewController.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 1/4/14.
//  Copyright (c) 2014 KP Phillips. All rights reserved.
//

#import "SectionViewController.h"
#import "SWRevealViewController.h"
#import "Flurry.h"

@interface SectionViewController ()

@end

@implementation SectionViewController{    //#UPDATE 1.1
    
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





@synthesize imageView;
@synthesize textView;
@synthesize imageArray;

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
    [Flurry logEvent:@"013 Section"];

    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //load images into an array
    UIImage *img1 = [UIImage imageNamed:@"13_01.png"];
	UIImage *img2 = [UIImage imageNamed:@"13_02.png"];
	UIImage *img3 = [UIImage imageNamed:@"13_03.png"];
    UIImage *img4 = [UIImage imageNamed:@"13_04.png"];
    UIImage *img5 = [UIImage imageNamed:@"13_05.png"];
    UIImage *img6 = [UIImage imageNamed:@"13_06.png"];
    UIImage *img7 = [UIImage imageNamed:@"13_07.png"];
    UIImage *img8 = [UIImage imageNamed:@"13_08.png"];
    UIImage *img9 = [UIImage imageNamed:@"13_09.png"];
    UIImage *img10 = [UIImage imageNamed:@"13_10.png"];
    UIImage *img11 = [UIImage imageNamed:@"13_11.png"];
    UIImage *img12 = [UIImage imageNamed:@"13_12.png"];
    UIImage *img13 = [UIImage imageNamed:@"13_13.png"];
    UIImage *img14 = [UIImage imageNamed:@"13_14.png"];
    UIImage *img15 = [UIImage imageNamed:@"13_15.png"];
    UIImage *img16 = [UIImage imageNamed:@"13_16.png"];
    UIImage *img17 = [UIImage imageNamed:@"13_17.png"];
    
	self.imageArray = [NSArray arrayWithObjects:img1, img2, img3, img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16,img17, nil];
    //self.imageArrayAnimation = [NSArray arrayWithObjects:img8,img9,img10,img11, nil];
    
    
    imageView.image = [imageArray objectAtIndex:0];
    textView.text = @"1. Select the Enable Sectioning tool under the Viewpoint tab.";
    
    // Round text view corners
    CALayer *textLayer = [textView layer];
    [textLayer setMasksToBounds:YES];
    [textLayer setCornerRadius:10.0f];
    //text view set border
    textView.layer.borderWidth = 1.0f;
    textView.layer.borderColor = [[UIColor blackColor] CGColor];
    
    
    //load buttons in an array to allow global change
    NSArray *buttons = [NSArray arrayWithObjects: self.button1, self.button2, self.button3, self.button4, self.button5, self.button6,self.button7,self.button8, self.button9, self.button10, self.button11, self.button12, self.button13, self.button14, self.button15, self.button16, self.button17, nil];
    
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
    }
    pointValueForCurrentButton = CGPointMake(button1.center.x, button1.center.y);

    //#UPDATE 1.1


}

- (IBAction)button1Pressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:1];
    [UIView animateWithDuration:1.00 animations:^{button1.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button2.alpha = 1;}];
    textView.text = @"2. Notice the model will change based on where the section is located. Select the Move option to show the move gozmo on the section plane.";
    
    
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
    }
    pointValueForCurrentButton = CGPointMake(button2.center.x, button2.center.y);
    
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:button2.center.y];
    }];


}

- (IBAction)button2Pressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:2];
    [UIView animateWithDuration:1.00 animations:^{button2.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button3.alpha = 1;}];
    textView.text = @"3. Hover over the arrow in the posotive front direction.  Select and hold to move the plane either to the front or back of the model.  Notice if you move the plene too far in the back direction the model will disapear.";
    
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:3];
    [UIView animateWithDuration:1.00 animations:^{button3.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button4.alpha = 1;}];
    textView.text = @"4. Right click in the Saved Viewpoints dialog to save a snapshot.";
  
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:4];
    [UIView animateWithDuration:1.00 animations:^{button4.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button5.alpha = 1;}];
    textView.text = @"5. Select to save the Viewpoint.";
    
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:5];
    [UIView animateWithDuration:1.00 animations:^{button5.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button6.alpha = 1;}];
    textView.text = @"6. Name the Viewpoint and remember to edit the viewpoint and select the Hide/Required setting so the section settings will be saved in the viewpoint.  Refer to the Viewpoints tutorial for more information.";
    
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:6];
    [UIView animateWithDuration:1.00 animations:^{button6.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button7.alpha = 1;}];
    textView.text = @"7. Select the Sectioning Tools tab if it is hidden and on the Planes Settings pallette select the dropdown to show more section planes.";
    
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:7];
    [UIView animateWithDuration:1.00 animations:^{button7.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button8.alpha = 1;}];
    textView.text = @"8. On Plane 2 select the light bulb icon to turn on the second plan.";
    
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:8];
    [UIView animateWithDuration:1.00 animations:^{button8.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button9.alpha = 1;}];
    textView.text = @"9. Select the Alignment dropdown to show options for changing the current plane location.";
    
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:9];
    [UIView animateWithDuration:1.00 animations:^{button9.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button10.alpha = 1;}];
    textView.text = @"10. Select the Back location and the plane will move from its default selection.";
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:10];
    [UIView animateWithDuration:1.00 animations:^{button10.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button11.alpha = 1;}];
    textView.text = @"11. The plane may show up too far in the front direction.  Select the back directon arrow to move the plane in the that direction.";
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:11];
    [UIView animateWithDuration:1.00 animations:^{button11.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button12.alpha = 1;}];
    textView.text = @"12. When the position is set right click on the Viewpoint that was created to show the sectioning.";
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:12];
    [UIView animateWithDuration:1.00 animations:^{button12.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button13.alpha = 1;}];
    textView.text = @"13. Select Update to apply the current model visibility to the related Viewpoint.";
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:13];
    [UIView animateWithDuration:1.00 animations:^{button13.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button14.alpha = 1;}];
    textView.text = @"14. On the Plane Settings Pallette, select the Link Section Planes option to associate the visible planes together.";
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:14];
    [UIView animateWithDuration:1.00 animations:^{button14.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button15.alpha = 1;}];
    textView.text = @"15. Select the direction arrow on the gizmo again and move in the front and back direction to test that the planes are linked and move together.";
    
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:15];
    [UIView animateWithDuration:1.00 animations:^{button15.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button16.alpha = 1;}];
    textView.text = @"16. To turn off the gizmo in the model view toggle the move tool.  If you have the Rotate tool selected toggle that off also.";
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:16];
    [UIView animateWithDuration:1.00 animations:^{button16.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button17.alpha = 1;}];
    textView.text = @"17. Make sure to update the Viewpoint as done in previous steps to have a clean sectioned model view that can be selected at any time.  Also, try out the sectioning with the same steps using the top/bottom sections to move between level visibility.";
    
    
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
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:0];
    [UIView animateWithDuration:1.00 animations:^{button17.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{button1.alpha = 1;}];
    textView.text = @"1. Select the Enable Sectioning tool under the Viewpoint tab.";
    
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