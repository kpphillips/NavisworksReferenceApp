//
//  AppendViewController.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 9/29/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import "AppendViewController.h"
#import "SWRevealViewController.h"
#import "Flurry.h"


@interface AppendViewController () 


@end

@implementation AppendViewController{    //#UPDATE 1.1

    CGPoint endImage;
    //BOOL imageIsAtZeroWithPositiveTranslation;
    CGRect originalLayoutSize;
    CGPoint imageShift;
    CGPoint buttonShift;
    CGPoint pointValueForCurrentButton;


    float buttonxMultiplier;
    float buttonyMultiplier;
    BOOL buttonsShifted;
    NSInteger appendButtonQuadrant;
    NSInteger openButtonQuadrant;
    NSInteger rightClickQuadrant;
    NSInteger transformSelectQuadrant;
    NSInteger changeZinfoQuadrant;
    NSInteger okZinfoQuadrant;
    NSInteger doneAnimationQuadrant;
    
    CGPoint appendButtonShift;
    CGPoint openButtonShift;
    CGPoint rightClickShift;
    CGPoint transformSelectShift;
    CGPoint changeZinfoShift;
    CGPoint okZinfoShift;
    CGPoint doneAnimationShift;
    
    
}    //#UPDATE 1.1

@synthesize appendButton;
@synthesize openButton;
@synthesize rightClick;
@synthesize transformSelect;
@synthesize changeZinfo;
@synthesize okZinfo;
@synthesize doneAnimation;

@synthesize imageView;
@synthesize textView;
@synthesize imageArray;
@synthesize imageArrayAnimation;

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

    [Flurry logEvent:@"002 Append"];

    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    //[self.imageView addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //load images into an array
    UIImage *img1 = [UIImage imageNamed:@"02_01_AppendButton.png"];
	UIImage *img2 = [UIImage imageNamed:@"02_02_AppendOpen.png"];
	UIImage *img3 = [UIImage imageNamed:@"02_03_Appended.png"];
    UIImage *img4 = [UIImage imageNamed:@"02_04_Transform.png"];
    UIImage *img5 = [UIImage imageNamed:@"02_05_Transform_dialog.png"];
    UIImage *img6 = [UIImage imageNamed:@"02_06_Transform_dialog_z.png"];
    UIImage *img7 = [UIImage imageNamed:@"02_07_Transform_dialog_ok.png"];
    UIImage *img8 = [UIImage imageNamed:@"02_08_Transform_dialog_ok.png"];
    UIImage *img9 = [UIImage imageNamed:@"02_09_Transform_dialog_ok.png"];
    UIImage *img10 = [UIImage imageNamed:@"02_10_Transform_dialog_ok.png"];
    UIImage *img11 = [UIImage imageNamed:@"02_11_Transform_dialog_ok.png"];
    UIImage *img12 = [UIImage imageNamed:@"02_12_Finish.png"];
	self.imageArray = [NSArray arrayWithObjects:img1, img2, img3, img4,img5,img6,img7,img8,img9,img10,img11,img12, nil];
    self.imageArrayAnimation = [NSArray arrayWithObjects:img8,img9,img10,img11, nil];
    
    
    imageView.image = [imageArray objectAtIndex:0];
    textView.text = @"1. Press the append button and navigate to your 3D models.";
    // Round text view corners
    CALayer *textLayer = [textView layer];
    [textLayer setMasksToBounds:YES];
    [textLayer setCornerRadius:10.0f];
    //text view set border
    textView.layer.borderWidth = 1.0f;
    textView.layer.borderColor = [[UIColor blackColor] CGColor];
    
    //get initial width set in storyboard
//    textWidth = textView.frame.size.width;
//    //size the UItextView
//    [textView sizeToFit];
//    CGRect tframe= textView.frame;
//    tframe.size.width=textWidth;
//    textView.frame=tframe;
    
    //load buttons in an array to allow global change
    NSArray *buttons = [NSArray arrayWithObjects: self.appendButton, self.openButton, self.rightClick, self.transformSelect, self.changeZinfo, self.okZinfo,self.doneAnimation, nil];
   // [self.appendButton setTranslatesAutoresizingMaskIntoConstraints:YES];

    for(UIButton *btn in buttons)
    {
        // set buttons settings globally here
        
        //Move image Utilities
        //[btn setTranslatesAutoresizingMaskIntoConstraints:YES];
//        CGRect buttonFrame = btn.frame;
//        buttonFrame.size = CGSizeMake(20, 20);
//        btn.frame = buttonFrame;
      //  [btn setFrame:CGRectMake(btn.frame.origin.x, btn.frame.origin.y,
     //                            btn.frame.size.width/imageScaleFactor, btn.frame.size.height/imageScaleFactor)];

    
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
        
        //Move image Utilities
        //[btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    }

    
    
    //fade in the 1st button and blink
    [UIView animateWithDuration:1.00 animations:^{appendButton.alpha = 1;}];
    [UIView animateWithDuration:0.00 animations:^{openButton.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{rightClick.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{transformSelect.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{changeZinfo.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{okZinfo.alpha = 0;}];
    [UIView animateWithDuration:0.00 animations:^{doneAnimation.alpha = 0;}];
   
    //Need to eliminate resizing of image when iPad is used
    //if screen point size is 1024w x 768 or larger (larger screens will need adjustments, similar if same 4:3 ratio)
    //-dont scale or move image
    //dont move uibuttons
    
    NSLog(@"Views Bounds %fx %fy", self.view.bounds.size.width, self.view.bounds.size.height);
    
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
    NSInteger quadrantBasedOnButton = [self determineQuadrant:appendButton.frame.origin];
    appendButtonQuadrant = quadrantBasedOnButton; //hold Q
    //need to calculate button location
    //buttonShift = CGPointMake(0, 0);
    [self moveImageToQuadrant:appendButtonQuadrant];
    buttonShift.x = ((buttonxMultiplier * (appendButton.center.x)) + imageShift.x); //approx 320
    buttonShift.y = ((buttonyMultiplier * (appendButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor)); //approx 80
        
        //x button offset
        if (buttonShift.x - 22 < textViewBottomPadding) {
            buttonShift.x = 22 + textViewBottomPadding;
        }//x button offset
    appendButtonShift = buttonShift; //hold button shift center
    }
    
    //may need to animate button moveing or displaying
    appendButton.center = CGPointMake(appendButtonShift.x, appendButtonShift.y);
    
    //[appendButton setCenter:appendButton.center]; //not working
    }
    pointValueForCurrentButton = CGPointMake(appendButton.center.x, appendButton.center.y);

    //#UPDATE 1.1
    

}


- (IBAction)appendButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:1];
    [UIView animateWithDuration:1.00 animations:^{appendButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{openButton.alpha = 1;}];
    textView.text = @"2. Select either one or control select multiple files to append.";
    //size the UItextView
//    [textView sizeToFit];
//    CGRect frame= textView.frame;
//    frame.size.width=textWidth;
//    textView.frame=frame;
    
    //iPad Setup
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
    NSInteger quadrantBasedOnButton = [self determineQuadrant:openButton.frame.origin];
    openButtonQuadrant = quadrantBasedOnButton; //hold Q value
    [self moveImageToQuadrant:openButtonQuadrant];
    //calls function to animate image to move to quadrant
    //calculate and set button location
    buttonShift.x = ((buttonxMultiplier * (openButton.center.x)) + imageShift.x);
    buttonShift.y = ((buttonyMultiplier * (openButton.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
    openButtonShift = buttonShift;
    }
    [self moveImageToQuadrant:openButtonQuadrant];
    openButton.center = CGPointMake(openButtonShift.x, openButtonShift.y);

    NSLog(@"Button Frame origin%@", NSStringFromCGPoint(openButton.frame.origin));
    NSLog(@"Button Center %fx %fy", openButton.center.x, openButton.center.y);
    //use .frame if view is rotated
    NSLog(@"Views Bounds %fx %fy", self.view.bounds.origin.x, self.view.bounds.origin.y);
    }
    
    pointValueForCurrentButton = CGPointMake(openButton.center.x, openButton.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:openButton.center.y];
    }];
}

- (IBAction)openButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:2];
    imageView.contentScaleFactor = imageScaleFactor;
    [UIView animateWithDuration:1.00 animations:^{openButton.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{rightClick.alpha = 1;}];
    textView.text = @"3. Sometimes files are not aligned in the design software. Adjust these by right-clicking the file in the selection tree";
    //size the UItextView
//    [textView sizeToFit];
//    CGRect frame= textView.frame;
//    frame.size.width=textWidth;
//    textView.frame=frame;
    
    
    //iPad Setup
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
    NSInteger quadrantBasedOnButton = [self determineQuadrant:rightClick.frame.origin];
    //calls function to animate image to move to quadrant
    rightClickQuadrant = quadrantBasedOnButton;
    [self moveImageToQuadrant:rightClickQuadrant];
    //need to calculate button location
    buttonShift.x = ((buttonxMultiplier * (rightClick.center.x)) + imageShift.x);
    buttonShift.y = ((buttonyMultiplier * (rightClick.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
    rightClickShift = buttonShift;
    }
    [self moveImageToQuadrant:rightClickQuadrant];
    rightClick.center = CGPointMake(rightClickShift.x, rightClickShift.y);
    }
    pointValueForCurrentButton = CGPointMake(rightClick.center.x, rightClick.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:rightClick.center.y];
    }];
}
- (IBAction)rightClickPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:3];
    [UIView animateWithDuration:1.00 animations:^{rightClick.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{transformSelect.alpha = 1;}];
    textView.text = @"4. Select the Units and Transform option.";
    //size the UItextView
//    [textView sizeToFit];
//    CGRect frame= textView.frame;
//    frame.size.width=textWidth;
//    textView.frame=frame;
    
    //iPad Setup
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    if (!buttonsShifted) {
    NSInteger quadrantBasedOnButton = [self determineQuadrant:transformSelect.frame.origin];
    transformSelectQuadrant = quadrantBasedOnButton;
    //calls function to animate image to move to quadrant
    [self moveImageToQuadrant:transformSelectQuadrant];
    //need to calculate button location
    buttonShift.x = ((buttonxMultiplier * (transformSelect.center.x)) + imageShift.x);
    buttonShift.y = ((buttonyMultiplier * (transformSelect.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
    transformSelectShift = buttonShift;
    }
    [self moveImageToQuadrant:transformSelectQuadrant];
    transformSelect.center = CGPointMake(transformSelectShift.x, transformSelectShift.y);
    }
    pointValueForCurrentButton = CGPointMake(transformSelect.center.x, transformSelect.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:transformSelect.center.y];
    }];
    
}
- (IBAction)transformSelectButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:4];
    imageView.contentScaleFactor = imageScaleFactor;
    [UIView animateWithDuration:1.00 animations:^{transformSelect.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{changeZinfo.alpha = 1;}];
    textView.text = @"5. Change the offset for the selected model.";
    //size the UItextView
//    [textView sizeToFit];
//    CGRect frame= textView.frame;
//    frame.size.width=textWidth;
//    textView.frame=frame;
    //transformSelect.center.x = 29;

    
    //iPad Setup
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    if (!buttonsShifted) {
    //calls function to get Quadrant
    NSInteger quadrantBasedOnButton = [self determineQuadrant:changeZinfo.frame.origin];
    changeZinfoQuadrant = quadrantBasedOnButton;
    //calls function to animate image to move to quadrant
    [self moveImageToQuadrant:changeZinfoQuadrant];
    //need to calculate button location
    buttonShift.x = ((buttonxMultiplier * (changeZinfo.center.x)) + imageShift.x);
    buttonShift.y = ((buttonyMultiplier * (changeZinfo.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
    changeZinfoShift = buttonShift;
    }
    [self moveImageToQuadrant:changeZinfoQuadrant];
    changeZinfo.center = CGPointMake(changeZinfoShift.x, changeZinfoShift.y);
    }
    
    pointValueForCurrentButton = CGPointMake(changeZinfo.center.x, changeZinfo.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:changeZinfo.center.y];
    }];
    
}
- (IBAction)changeZinfoButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    imageView.image = [imageArray objectAtIndex:5];
    imageView.contentScaleFactor = imageScaleFactor;
    [UIView animateWithDuration:1.00 animations:^{changeZinfo.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{okZinfo.alpha = 1;}];
    textView.text = @"6. Select OK to close the dialog.";
    //size the UItextView
//    [textView sizeToFit];
//    CGRect frame= textView.frame;
//    frame.size.width=textWidth;
//    textView.frame=frame;
    
    //iPad Setup
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    if (!buttonsShifted) {
    //calls function to get Quadrant
    NSInteger quadrantBasedOnButton = [self determineQuadrant:okZinfo.frame.origin];
    okZinfoQuadrant = quadrantBasedOnButton;
    //calls function to animate image to move to quadrant
    [self moveImageToQuadrant:okZinfoQuadrant];
    //need to calculate button location
    buttonShift.x = ((buttonxMultiplier * (okZinfo.center.x)) + imageShift.x);
    buttonShift.y = ((buttonyMultiplier * (okZinfo.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
    okZinfoShift = buttonShift;
    }
    [self moveImageToQuadrant:okZinfoQuadrant];
    okZinfo.center = CGPointMake(okZinfoShift.x, okZinfoShift.y);
    }
    pointValueForCurrentButton = CGPointMake(okZinfo.center.x, okZinfo.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:okZinfo.center.y];
    }];

}
- (IBAction)okZinfoButtonPressed:(id)sender {
    NSLog(@"%s", __func__);
    //animation
    imageView.animationImages = imageArrayAnimation;
    imageView.animationDuration = 3;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
//    imageView.image = [imageArray objectAtIndex:7];
//    imageView.image = [imageArray objectAtIndex:8];
//    imageView.image = [imageArray objectAtIndex:9];
//    imageView.image = [imageArray objectAtIndex:10];
  //  imageView.image = [imageArray objectAtIndex:11];
    [UIView animateWithDuration:1.00 animations:^{okZinfo.alpha = 0;}];
    [UIView animateWithDuration:1.00 animations:^{doneAnimation.alpha = 1;}];
    textView.text = @"7. The model will move into place. Sometimes you will neet to check the design software to determine the accurate offset value.";
    //size the UItextView
//    [textView sizeToFit];
//    CGRect frame= textView.frame;
//    frame.size.width=textWidth;
//    textView.frame=frame;

    
    //iPad Setup
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    if (!buttonsShifted) {
    //calls function to get Quadrant
    NSInteger quadrantBasedOnButton = [self determineQuadrant:doneAnimation.frame.origin];
    doneAnimationQuadrant = quadrantBasedOnButton;
    //calls function to animate image to move to quadrant
    [self moveImageToQuadrant:doneAnimationQuadrant];
    //need to calculate button location
    buttonShift.x = ((buttonxMultiplier * (doneAnimation.center.x)) + imageShift.x);
    buttonShift.y = ((buttonyMultiplier * (doneAnimation.center.y)) + imageShift.y - (iphoneButtonOffsetY/imageScaleFactor));
    doneAnimationShift = buttonShift;
    }
    [self moveImageToQuadrant:doneAnimationQuadrant];
    doneAnimation.center = CGPointMake(doneAnimationShift.x, doneAnimationShift.y);
    }
    pointValueForCurrentButton = CGPointMake(doneAnimation.center.x, doneAnimation.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:doneAnimation.center.y];
    }];
    
}


- (IBAction)doneAnimationbuttonPressed:(id)sender{
    
    [imageView stopAnimating];
    [UIView animateWithDuration:0.25 animations:^{appendButton.alpha = 1;}];
    [UIView animateWithDuration:0.25 animations:^{doneAnimation.alpha = 0;}];
    imageView.image = [imageArray objectAtIndex:0];
    textView.text = @"1. Press the append button and navigate to your 3D models.";
    //size the UItextView
//    [textView sizeToFit];
//    CGRect frame= textView.frame;
//    frame.size.width=textWidth;
//    textView.frame=frame;
    
       //iPad Setup
    if (self.view.bounds.size.height < iPadPointHeightLandscape) {
    //Move image Utilities
    imageView.contentScaleFactor = imageScaleFactor;
    //calls function to get Quadrant
    //NSInteger quadrantBasedOnButton = [self determineQuadrant:appendButton.frame.origin];
    //appendButtonQuadrant = quadrantBasedOnButton;
    //calls function to animate image to move to quadrant
    [self moveImageToQuadrant:appendButtonQuadrant];
    
    buttonsShifted = YES; //note that all buttons have been moved
    }
    pointValueForCurrentButton = CGPointMake(appendButton.center.x, appendButton.center.y);
    //set text size and origin
    [UIView animateWithDuration:1 animations:^{
        textView.frame = [self setTextViewSizeAndOrigin:appendButton.center.y];
    }];
    
}

//fires when first touch is sensed
-(BOOL)gestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    NSLog(@"%s", __func__);
   // if (translation.x > 0 && endImage.x <= 0)
    if (endImage.x == 0 || [touch.view isKindOfClass:[UIButton class]]) {
        NSLog(@"TX is > 0 & endimage is <= 0");
        //endImage.x = 1;
        return NO;
        }
        return YES;
        
}


//fires when first touch is sent but after gestureRecognizerShouldBegin - not used because SW calls this too and may be called before this method
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)recognizer{
//    NSLog(@"%s", __func__);
//    
//    return YES;
//}


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
    
    NSLog(@"Content Scale %f", imageView.contentScaleFactor);
    NSLog(@"Image size is is %fx %fy", imageView.image.size.width / imageView.contentScaleFactor,
          imageView.image.size.height / imageView.contentScaleFactor);
    NSLog(@"Image origin is %fx %fy", imageView.frame.origin.x, imageView.frame.origin.y);
    NSLog(@"Image shift is %fx %fy", imageShift.x, imageShift.y);
    NSLog(@"View size is is %fx %fy", self.view.bounds.size.width, self.view.bounds.size.height);

    //need to return the image shift

}


- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    
 NSLog(@"%s", __func__);
    
    CGPoint translation = [recognizer translationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
    NSLog(@"UIGestureRecognizerStateBegan");
        
        NSLog(@"Image Frame Origin Begin %@", NSStringFromCGPoint(imageView.frame.origin));
        NSLog(@"Translation is %fx %fy", translation.x, translation.y);
        
       
        
    }
    
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"UIGestureRecognizerStateChanged");

        NSLog(@"Translation is %fx %fy", translation.x, translation.y);
        NSLog(@"EndFrameImage is %fx %fy",endImage.x, endImage.y);
        
        //sets the location of the frame to the movement of the gesture plus the last image location.
        //prevents the image to start at 0,0 if the user lifts and moves the image multiple times.
        
        imageView.frame = CGRectMake(translation.x + endImage.x, translation.y + endImage.y, imageView.image.size.width, imageView.image.size.height);
     
    

    }
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
    
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 100;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.01 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x  + (velocity.x * slideFactor),
                                         recognizer.view.center.y  + (velocity.y * slideFactor));
        //calculating the amount to constrain the shifted image
        //MIN(MAX(finalPoint.x, [offset right.x]), [offset left.x]);
        //get the image scaled size in view to adjust for the offset
        float imageScaleSizeX = imageView.image.size.width / imageView.contentScaleFactor;
        float imageScaleSizeY = imageView.image.size.height / imageView.contentScaleFactor;
        
        finalPoint.x = MIN(MAX(finalPoint.x, ((self.view.bounds.size.width) - (imageView.bounds.size.width / 2)) + (imageView.image.size.width - imageScaleSizeX)),
                           (imageView.bounds.size.width / 2));
        finalPoint.y = MIN(MAX(finalPoint.y, ((self.view.bounds.size.height) - (imageView.bounds.size.height / 2)) + (imageView.image.size.height - imageScaleSizeY)),
                           (imageView.bounds.size.height / 2));
        NSLog(@"Image contentScaleFactor %f", imageView.contentScaleFactor);

      
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
        
//        if (translation.x > 0 && endImage.x == 0) {
//            
//            //
//        }
        
        endImage = imageView.frame.origin;
        
    }//end UIGestureRecognizerStateEnded
    
}// end recognizer



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
