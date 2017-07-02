//
//  VisibilityViewController.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 10/12/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import "VisibilityViewController.h"
#import "SWRevealViewController.h"
#import "Flurry.h"



@interface VisibilityViewController ()

@end

@implementation VisibilityViewController{    //#UPDATE 1.1
    
    CGPoint endImage;
    //BOOL imageIsAtZeroWithPositiveTranslation;
    CGRect originalLayoutSize;
    CGPoint imageShift;
    CGPoint buttonShift;
    CGPoint pointValueForCurrentButton;

    
    float buttonxMultiplier;
    float buttonyMultiplier;
    BOOL buttonsShifted;
    NSInteger rightClickQuadrant;
    NSInteger transparencySelectQuadrant;
    NSInteger transparencyDoneQuadrant;
    NSInteger rightClickColor1Quadrant;
    NSInteger color1SelectQuadrant;
    NSInteger color1DoneQuadrant;
    NSInteger rightClickColor2Quadrant;
    NSInteger color2DoneQuadrant;
 
   
    CGPoint rightClickShift;
    CGPoint transparencySelectShift;
    CGPoint transparencyDoneShift;
    CGPoint rightClickColor1Shift;
    CGPoint color1SelectShift;
    CGPoint color1DoneShift;
    CGPoint rightClickColor2Shift;
    CGPoint color2DoneShift;
    
}    //#UPDATE 1.1



@synthesize rightClick;
@synthesize transparencySelect;
@synthesize transparencyDone;
@synthesize rightClickColor1;
@synthesize color1Select;
@synthesize color1Done;
@synthesize rightClickColor2;
@synthesize color2Done;


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
    [Flurry logEvent:@"004 Visibility"];

    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //load images into an array
    UIImage *img1 = [UIImage imageNamed:@"04_01_Visibility_Start.png"];
	UIImage *img2 = [UIImage imageNamed:@"04_02_Transparency.png"];
	UIImage *img3 = [UIImage imageNamed:@"04_03_Transparency_slideOK.png"];
    UIImage *img4 = [UIImage imageNamed:@"04_04_Transparency_done.png"];
    UIImage *img5 = [UIImage imageNamed:@"04_05_Color1.png"];
    UIImage *img6 = [UIImage imageNamed:@"04_06_Color1OK.png"];
    UIImage *img7 = [UIImage imageNamed:@"04_07_Color1_done.png"];
    UIImage *img8 = [UIImage imageNamed:@"04_08_ColorAll_done.png"];
	self.imageArray = [NSArray arrayWithObjects:img1, img2, img3, img4,img5,img6,img7,img8, nil];
    //self.imageArrayAnimation = [NSArray arrayWithObjects:img8,img9,img10,img11, nil];
    
    
    imageView.image = [imageArray objectAtIndex:0];
    textView.text = @"1. To overide the visibility of objects or specific appended files right click on the object or file in the selection tree.";
    // Round text view corners
    CALayer *textLayer = [textView layer];
    [textLayer setMasksToBounds:YES];
    [textLayer setCornerRadius:10.0f];
    //text view set border
    textView.layer.borderWidth = 1.0f;
    textView.layer.borderColor = [[UIColor blackColor] CGColor];
    
    
    //load buttons in an array to allow global change
    NSArray *buttons = [NSArray arrayWithObjects: self.rightClick, self.transparencySelect, self.transparencyDone, self.rightClickColor1, self.color1Select,self.color1Done,self.rightClickColor2,self.color2Done, nil];
    
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
    [UIView animateWithDuration:1.00 animations:^{rightClick.alpha = 1;}];
    [UIView animateWithDuration:0.00 animations:^{transparencySelect.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{transparencyDone.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{rightClickColor1.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{color1Select.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{color1Done.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{rightClickColor2.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{color2Done.alpha = 0;}];

    
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
        NSInteger quadrantBasedOnButton = [self determineQuadrant:rightClick.frame.origin];
        rightClickQuadrant = quadrantBasedOnButton; //hold Q
        //need to calculate button location
        //buttonShift = CGPointMake(0, 0);
        [self moveImageToQuadrant:rightClickQuadrant];
        buttonShift.x = ((buttonxMultiplier * (rightClick.center.x)) + imageShift.x); //approx 320
        buttonShift.y = ((buttonyMultiplier * (rightClick.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor)); //approx 80
        rightClickShift=  buttonShift; //hold button shift center
    }
    
    //may need to animate button moveing or displaying
    rightClick.center = CGPointMake(rightClickShift.x, rightClickShift.y);
    }
    pointValueForCurrentButton = CGPointMake(rightClick.center.x, rightClick.center.y);

    //#UPDATE 1.1

    
    
}

- (IBAction)rightClickButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:1];
    [UIView animateWithDuration:1.00 animations:^{rightClick.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{transparencySelect.alpha = 1;}];
    textView.text = @"2. Hover over the Override Item tool and select the Override Transparency on the fly out menu.";
    
    //setup for iPad devices
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
        NSInteger quadrantBasedOnButton = [self determineQuadrant:transparencySelect.frame.origin];
        transparencySelectQuadrant = quadrantBasedOnButton; //hold Q value
        [self moveImageToQuadrant:transparencySelectQuadrant];
        //calls function to animate image to move to quadrant
        //calculate and set button location
        buttonShift.x = ((buttonxMultiplier * (transparencySelect.center.x)) + imageShift.x);
        buttonShift.y = ((buttonyMultiplier * (transparencySelect.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
        transparencySelectShift = buttonShift;
    }
    [self moveImageToQuadrant:transparencySelectQuadrant];
    transparencySelect.center = CGPointMake(transparencySelectShift.x, transparencySelectShift.y);
    }
    pointValueForCurrentButton = CGPointMake(transparencySelect.center.x, transparencySelect.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:transparencySelect.center.y];
    }];
}

- (IBAction)transparencySelectButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:2];
    [UIView animateWithDuration:1.00 animations:^{transparencySelect.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{transparencyDone.alpha = 1;}];
    textView.text = @"3. Change the transparency value in the dialog and press OK to see the result for the selected objects.";
    
        //setup for iPad devices
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
        NSInteger quadrantBasedOnButton = [self determineQuadrant:transparencyDone.frame.origin];
        transparencyDoneQuadrant = quadrantBasedOnButton; //hold Q value
        [self moveImageToQuadrant:transparencyDoneQuadrant];
        //calls function to animate image to move to quadrant
        //calculate and set button location
        buttonShift.x = ((buttonxMultiplier * (transparencyDone.center.x)) + imageShift.x);
        buttonShift.y = ((buttonyMultiplier * (transparencyDone.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
        transparencyDoneShift = buttonShift;
    }
    [self moveImageToQuadrant:transparencyDoneQuadrant];
    transparencyDone.center = CGPointMake(transparencyDoneShift.x, transparencyDoneShift.y);
    }
    pointValueForCurrentButton = CGPointMake(transparencyDone.center.x, transparencyDone.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:transparencyDone.center.y];
    }];
}


- (IBAction)transparencyDoneButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:3];
    [UIView animateWithDuration:1.00 animations:^{transparencyDone.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{rightClickColor1.alpha = 1;}];
    textView.text = @"4. To change the color right click on the object or file in the selection tree.";

    //setup for iPad devices
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
        NSInteger quadrantBasedOnButton = [self determineQuadrant:rightClickColor1.frame.origin];
        rightClickColor1Quadrant = quadrantBasedOnButton; //hold Q value
        [self moveImageToQuadrant:rightClickColor1Quadrant];
        //calls function to animate image to move to quadrant
        //calculate and set button location
        buttonShift.x = ((buttonxMultiplier * (rightClickColor1.center.x)) + imageShift.x);
        buttonShift.y = ((buttonyMultiplier * (rightClickColor1.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
        rightClickColor1Shift = buttonShift;
    }
    [self moveImageToQuadrant:rightClickColor1Quadrant];
    rightClickColor1.center = CGPointMake(rightClickColor1Shift.x, rightClickColor1Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(rightClickColor1.center.x, rightClickColor1.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:rightClickColor1.center.y];
    }];
}

- (IBAction)rightClickColor1ButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:4];
    [UIView animateWithDuration:1.00 animations:^{rightClickColor1.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{color1Select.alpha = 1;}];
    textView.text = @"5. Hover over the Override Item tool and select the Override Color on the fly out menu.";
    
    //setup for iPad devices
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
        NSInteger quadrantBasedOnButton = [self determineQuadrant:color1Select.frame.origin];
        color1SelectQuadrant = quadrantBasedOnButton; //hold Q value
        [self moveImageToQuadrant:color1SelectQuadrant];
        //calls function to animate image to move to quadrant
        //calculate and set button location
        buttonShift.x = ((buttonxMultiplier * (color1Select.center.x)) + imageShift.x);
        buttonShift.y = ((buttonyMultiplier * (color1Select.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
        color1SelectShift = buttonShift;
    }
    [self moveImageToQuadrant:color1SelectQuadrant];
    color1Select.center = CGPointMake(color1SelectShift.x, color1SelectShift.y);
    }
    
    pointValueForCurrentButton = CGPointMake(color1Select.center.x, color1Select.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:color1Select.center.y];
    }];
}

- (IBAction)color1SelectButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:5];
    [UIView animateWithDuration:1.00 animations:^{color1Select.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{color1Done.alpha = 1;}];
    textView.text = @"6. Select the color for the selected objects and select OK to see the results in the model view.";
    
        //setup for iPad devices
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
        NSInteger quadrantBasedOnButton = [self determineQuadrant:color1Done.frame.origin];
        color1DoneQuadrant = quadrantBasedOnButton; //hold Q value
        [self moveImageToQuadrant:color1DoneQuadrant];
        //calls function to animate image to move to quadrant
        //calculate and set button location
        buttonShift.x = ((buttonxMultiplier * (color1Done.center.x)) + imageShift.x);
        buttonShift.y = ((buttonyMultiplier * (color1Done.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
        color1DoneShift = buttonShift;
    }
    [self moveImageToQuadrant:color1DoneQuadrant];
    color1Done.center = CGPointMake(color1DoneShift.x, color1DoneShift.y);
    }
    pointValueForCurrentButton = CGPointMake(color1Done.center.x, color1Done.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:color1Done.center.y];
    }];
}

- (IBAction)color1DoneButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:6];
    [UIView animateWithDuration:1.00 animations:^{color1Done.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{rightClickColor2.alpha = 1;}];
    textView.text = @"7. Repeat the previous steps for multiple files of with different visibility settings";
    
    //setup for iPad devices
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
        NSInteger quadrantBasedOnButton = [self determineQuadrant:rightClickColor2.frame.origin];
        rightClickColor2Quadrant = quadrantBasedOnButton; //hold Q value
        [self moveImageToQuadrant:rightClickColor2Quadrant];
        //calls function to animate image to move to quadrant
        //calculate and set button location
        buttonShift.x = ((buttonxMultiplier * (rightClickColor2.center.x)) + imageShift.x);
        buttonShift.y = ((buttonyMultiplier * (rightClickColor2.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
        rightClickColor2Shift = buttonShift;
    }
    [self moveImageToQuadrant:rightClickColor2Quadrant];
    rightClickColor2.center = CGPointMake(rightClickColor2Shift.x, rightClickColor2Shift.y);
    }
    pointValueForCurrentButton = CGPointMake(rightClickColor2.center.x, rightClickColor2.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:rightClickColor2.center.y];
    }];
}

- (IBAction)rightClickColor2ButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:7];
    [UIView animateWithDuration:1.00 animations:^{rightClickColor2.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{color2Done.alpha = 1;}];
    textView.text = @"8. After changing the visibility of all the objects the model objects and their respected disciplines are distinguished between each other.";
    
    //setup for iPad devices
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
        NSInteger quadrantBasedOnButton = [self determineQuadrant:color2Done.frame.origin];
        color2DoneQuadrant = quadrantBasedOnButton; //hold Q value
        [self moveImageToQuadrant:color2DoneQuadrant];
        //calls function to animate image to move to quadrant
        //calculate and set button location
        buttonShift.x = ((buttonxMultiplier * (color2Done.center.x)) + imageShift.x);
        buttonShift.y = ((buttonyMultiplier * (color2Done.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
        color2DoneShift = buttonShift;
    }
    [self moveImageToQuadrant:color2DoneQuadrant];
    color2Done.center = CGPointMake(color2DoneShift.x, color2DoneShift.y);
    }
    pointValueForCurrentButton = CGPointMake(color2Done.center.x, color2Done.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:color2Done.center.y];
    }];
}

- (IBAction)color2DoneButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:0];
    [UIView animateWithDuration:1.00 animations:^{color2Done.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{rightClick.alpha = 1;}];
    textView.text = @"1. To overide the visibility of objects or specific appended files right click on the object or file in the selection tree.";
    
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    [self moveImageToQuadrant:rightClickQuadrant];
    
    buttonsShifted = YES; //note that all buttons have been moved
    }
    pointValueForCurrentButton = CGPointMake(rightClick.center.x, rightClick.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:rightClick.center.y];
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
