//
//  ClashViewController.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 2/8/14.
//  Copyright (c) 2014 KP Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClashViewController : UIViewController{
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
    IBOutlet UIButton   *button15;
    IBOutlet UIButton   *button16;
    IBOutlet UIButton   *button17;
    IBOutlet UIButton   *button18;
    IBOutlet UIButton   *button19;
    IBOutlet UIButton   *button20;
    IBOutlet UIButton   *button21;
    IBOutlet UIButton   *button22;
    IBOutlet UIButton   *button23;
    IBOutlet UIButton   *button24;
    IBOutlet UIButton   *button25;
    IBOutlet UIButton   *button26;
    IBOutlet UIButton   *button27;
    IBOutlet UIButton   *button28;
    IBOutlet UIButton   *button29;
    IBOutlet UIButton   *button30;
    IBOutlet UIButton   *button31;
    IBOutlet UIButton   *button32;
    IBOutlet UIButton   *button33;
    IBOutlet UIButton   *button34;
    IBOutlet UIButton   *button35;
    IBOutlet UIButton   *button36;
    IBOutlet UIButton   *button37;
    IBOutlet UIButton   *button38;


    
    UIImageView *imageView;
    UITextView *textView;
	NSArray *imageArray;
//    NSArray *imageArrayAnimation;
    
    
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
@property (nonatomic, retain) UIButton *button15;
@property (nonatomic, retain) UIButton *button16;
@property (nonatomic, retain) UIButton *button17;
@property (nonatomic, retain) UIButton *button18;
@property (nonatomic, retain) UIButton *button19;
@property (nonatomic, retain) UIButton *button20;
@property (nonatomic, retain) UIButton *button21;
@property (nonatomic, retain) UIButton *button22;
@property (nonatomic, retain) UIButton *button23;
@property (nonatomic, retain) UIButton *button24;
@property (nonatomic, retain) UIButton *button25;
@property (nonatomic, retain) UIButton *button26;
@property (nonatomic, retain) UIButton *button27;
@property (nonatomic, retain) UIButton *button28;
@property (nonatomic, retain) UIButton *button29;
@property (nonatomic, retain) UIButton *button30;
@property (nonatomic, retain) UIButton *button31;
@property (nonatomic, retain) UIButton *button32;
@property (nonatomic, retain) UIButton *button33;
@property (nonatomic, retain) UIButton *button34;
@property (nonatomic, retain) UIButton *button35;
@property (nonatomic, retain) UIButton *button36;
@property (nonatomic, retain) UIButton *button37;
@property (nonatomic, retain) UIButton *button38;








@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) NSArray *imageArrayAnimation;



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
-(IBAction)button15Pressed:(id)sender;
-(IBAction)button16Pressed:(id)sender;
-(IBAction)button17Pressed:(id)sender;
-(IBAction)button18Pressed:(id)sender;
-(IBAction)button19Pressed:(id)sender;
-(IBAction)button20Pressed:(id)sender;
-(IBAction)button21Pressed:(id)sender;
-(IBAction)button22Pressed:(id)sender;
-(IBAction)button23Pressed:(id)sender;
-(IBAction)button24Pressed:(id)sender;
-(IBAction)button25Pressed:(id)sender;
-(IBAction)button26Pressed:(id)sender;
-(IBAction)button27Pressed:(id)sender;
-(IBAction)button28Pressed:(id)sender;
-(IBAction)button29Pressed:(id)sender;
-(IBAction)button30Pressed:(id)sender;
-(IBAction)button31Pressed:(id)sender;
-(IBAction)button32Pressed:(id)sender;
-(IBAction)button33Pressed:(id)sender;
-(IBAction)button34Pressed:(id)sender;
-(IBAction)button35Pressed:(id)sender;
-(IBAction)button36Pressed:(id)sender;
-(IBAction)button37Pressed:(id)sender;
-(IBAction)button38Pressed:(id)sender;

//#UPDATE 1.1
-(void)moveImageToQuadrant:(NSInteger)aQuadrant;
-(NSInteger)determineQuadrant:(CGPoint)aPointOrigin;
-(CGRect)setTextViewSizeAndOrigin:(CGFloat)thisButtonCenterY;
//#UPDATE 1.1

@end
