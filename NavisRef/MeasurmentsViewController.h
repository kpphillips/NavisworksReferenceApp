//
//  MeasurmentsViewController.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 1/16/14.
//  Copyright (c) 2014 KP Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeasurmentsViewController : UIViewController{
    IBOutlet UIButton   *button1;
    IBOutlet UIButton   *button2;
    IBOutlet UIButton   *button3;
    IBOutlet UIButton   *button4;
    IBOutlet UIButton   *button5;
    IBOutlet UIButton   *button6;
    IBOutlet UIButton   *button7;
    IBOutlet UIButton   *button8;
    IBOutlet UIButton   *button9;
    IBOutlet UIButton   *button10;
    IBOutlet UIButton   *button11;
    IBOutlet UIButton   *button12;
    IBOutlet UIButton   *button13;
    IBOutlet UIButton   *button14;

    
    
    
    UIImageView *imageView;
    UITextView *textView;
	NSArray *imageArray;
    
}

@property (nonatomic, retain) UIButton *button1;
@property (nonatomic, retain) UIButton *button2;
@property (nonatomic, retain) UIButton *button3;
@property (nonatomic, retain) UIButton *button4;
@property (nonatomic, retain) UIButton *button5;
@property (nonatomic, retain) UIButton *button6;
@property (nonatomic, retain) UIButton *button7;
@property (nonatomic, retain) UIButton *button8;
@property (nonatomic, retain) UIButton *button9;
@property (nonatomic, retain) UIButton *button10;
@property (nonatomic, retain) UIButton *button11;
@property (nonatomic, retain) UIButton *button12;
@property (nonatomic, retain) UIButton *button13;
@property (nonatomic, retain) UIButton *button14;




@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@property (nonatomic, retain) NSArray *imageArray;



-(IBAction)button1Pressed:(id)sender;
-(IBAction)button2Pressed:(id)sender;
-(IBAction)button3Pressed:(id)sender;
-(IBAction)button4Pressed:(id)sender;
-(IBAction)button5Pressed:(id)sender;
-(IBAction)button6Pressed:(id)sender;
-(IBAction)button7Pressed:(id)sender;
-(IBAction)button8Pressed:(id)sender;
-(IBAction)button9Pressed:(id)sender;
-(IBAction)button10Pressed:(id)sender;
-(IBAction)button11Pressed:(id)sender;
-(IBAction)button12Pressed:(id)sender;
-(IBAction)button13Pressed:(id)sender;
-(IBAction)button14Pressed:(id)sender;

//#UPDATE 1.1
-(void)moveImageToQuadrant:(NSInteger)aQuadrant;
-(NSInteger)determineQuadrant:(CGPoint)aPointOrigin;
-(CGRect)setTextViewSizeAndOrigin:(CGFloat)thisButtonCenterY;
//#UPDATE 1.1



@end
