//
//  NavigationViewController.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 11/10/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationViewController : UIViewController {

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


UIImageView *imageView;
UITextView *textView;
NSArray *imageArray;
NSArray *imageArrayAnimation;
NSArray *imageArrayAnimation2;


    
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


@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextView *textView;


@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) NSArray *imageArrayAnimation;
@property (nonatomic, retain) NSArray *imageArrayAnimation2;





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


//#UPDATE 1.1
-(void)moveImageToQuadrant:(NSInteger)aQuadrant;
-(NSInteger)determineQuadrant:(CGPoint)aPointOrigin;
-(CGRect)setTextViewSizeAndOrigin:(CGFloat)thisButtonCenterY;
//#UPDATE 1.1

@end


