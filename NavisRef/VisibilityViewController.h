//
//  VisibilityViewController.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 10/12/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface VisibilityViewController : UIViewController{
    IBOutlet UIButton   *rightClick;
    IBOutlet UIButton   *transparencySelect;
    IBOutlet UIButton   *transparencyDone;
    IBOutlet UIButton   *rightClickColor1;
    IBOutlet UIButton   *color1Select;
    IBOutlet UIButton   *color1Done;
    IBOutlet UIButton   *rightClickColor2;
    IBOutlet UIButton   *color2Done;
    
    UIImageView *imageView;
    UITextView *textView;
	NSArray *imageArray;
}

@property (nonatomic, retain) UIButton *rightClick;
@property (nonatomic, retain) UIButton *transparencySelect;
@property (nonatomic, retain) UIButton *transparencyDone;
@property (nonatomic, retain) UIButton *rightClickColor1;
@property (nonatomic, retain) UIButton *color1Select;
@property (nonatomic, retain) UIButton *color1Done;
@property (nonatomic, retain) UIButton *rightClickColor2;
@property (nonatomic, retain) UIButton *color2Done;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@property (nonatomic, retain) NSArray *imageArray;



-(IBAction)rightClickButtonPressed:(id)sender;
-(IBAction)transparencySelectButtonPressed:(id)sender;
-(IBAction)transparencyDoneButtonPressed:(id)sender;
-(IBAction)rightClickColor1ButtonPressed:(id)sender;
-(IBAction)color1SelectButtonPressed:(id)sender;
-(IBAction)color1DoneButtonPressed:(id)sender;
-(IBAction)rightClickColor2ButtonPressed:(id)sender;
-(IBAction)color2DoneButtonPressed:(id)sender;

//#UPDATE 1.1
-(void)moveImageToQuadrant:(NSInteger)aQuadrant;
-(NSInteger)determineQuadrant:(CGPoint)aPointOrigin;
-(CGRect)setTextViewSizeAndOrigin:(CGFloat)thisButtonCenterY;
//#UPDATE 1.1


@end
