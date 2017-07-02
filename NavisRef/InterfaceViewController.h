//
//  InterfaceViewController.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 9/8/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface InterfaceViewController : UIViewController {
    IBOutlet UIButton   *okButton;
    IBOutlet UIButton   *appButton;
    IBOutlet UIButton   *quickButton;
    IBOutlet UIButton   *infoButton;
    IBOutlet UIButton   *ribbonButton;
    IBOutlet UIButton   *dockButton;
    IBOutlet UIButton   *sceneButton;
    IBOutlet UIButton   *navButton;
    IBOutlet UIButton   *statusButton;
    UITextView *textView;
   UIImageView *imageView;

   


}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, retain) UIButton *okButton;
@property (nonatomic, retain) UIButton *appButton;
@property (nonatomic, retain) UIButton *quickButton;
@property (nonatomic, retain) UIButton *infoButton;
@property (nonatomic, retain) UIButton *ribbonButton;
@property (nonatomic, retain) UIButton *dockButton;
@property (nonatomic, retain) UIButton *sceneButton;
@property (nonatomic, retain) UIButton *navButton;
@property (nonatomic, retain) UIButton *statusButton;
//@property (nonatomic, strong) UIPopoverController *popController;

@property (nonatomic, retain) IBOutlet UITextView *textView;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (nonatomic, retain) NSString *uiString;
@property (weak, nonatomic) NSString *photoFilename;

//-(IBAction)showPopover:(id)sender;
-(IBAction)okButtonPressed:(id)sender;
-(IBAction)appButtonPressed:(id)sender;
-(IBAction)quickButtonPressed:(id)sender;
-(IBAction)infoButtonPressed:(id)sender;
-(IBAction)ribbonButtonPressed:(id)sender;
-(IBAction)dockButtonPressed:(id)sender;
-(IBAction)sceneButtonPressed:(id)sender;
-(IBAction)navButtonPressed:(id)sender;
-(IBAction)statusButtonPressed:(id)sender;

//- (CGFloat)textViewHeightForText:(NSString *)text andWidth:(CGFloat)textWidth;
//#UPDATE 1.1
-(void)moveImageToQuadrant:(NSInteger)aQuadrant;
-(NSInteger)determineQuadrant:(CGPoint)aPointOrigin;
-(CGRect)setTextViewSizeAndOrigin:(CGFloat)thisButtonCenterY;

//#UPDATE 1.1

@end
