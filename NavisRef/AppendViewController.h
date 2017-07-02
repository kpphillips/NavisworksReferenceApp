//
//  AppendViewController.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 9/29/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SWRevealViewController.h"

@interface AppendViewController : UIViewController <UIGestureRecognizerDelegate> {
    IBOutlet UIButton   *appendButton;
    IBOutlet UIButton   *openButton;
    IBOutlet UIButton   *rightClick;
    IBOutlet UIButton   *transformSelect;
    IBOutlet UIButton   *changeZinfo;
    IBOutlet UIButton   *okZinfo;
    IBOutlet UIButton   *doneAnimation;

    UIImageView *imageView;
    UITextView *textView;
	NSArray *imageArray;
    NSArray *imageArrayAnimation;

}


@property (nonatomic, retain) UIButton *appendButton;
@property (nonatomic, retain) UIButton *openButton;
@property (nonatomic, retain) UIButton *rightClick;
@property (nonatomic, retain) UIButton *transformSelect;
@property (nonatomic, retain) UIButton *changeZinfo;
@property (nonatomic, retain) UIButton *okZinfo;
@property (nonatomic, retain) UIButton *doneAnimation;


@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) NSArray *imageArrayAnimation;




-(IBAction)appendButtonPressed:(id)sender;
-(IBAction)openButtonPressed:(id)sender;
-(IBAction)rightClickPressed:(id)sender;
-(IBAction)transformSelectButtonPressed:(id)sender;
-(IBAction)changeZinfoButtonPressed:(id)sender;
-(IBAction)okZinfoButtonPressed:(id)sender;
-(IBAction)doneAnimationbuttonPressed:(id)sender;

//#UPDATE 1.1
-(void)moveImageToQuadrant:(NSInteger)aQuadrant;
-(NSInteger)determineQuadrant:(CGPoint)aPointOrigin;
-(CGRect)setTextViewSizeAndOrigin:(CGFloat)thisButtonCenterY;

//#UPDATE 1.1


@end
