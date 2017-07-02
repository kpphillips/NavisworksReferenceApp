//
//  MainViewController.h
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 9/8/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductsTableViewController.h"

//
@interface MainViewController : UIViewController{
    IBOutlet UIButton   *iapButton;
    IBOutlet UIButton   *upgradeButton;
    IBOutlet UIButton   *restoreButton;
    IBOutlet UIButton   *purchaseButton;
    IBOutlet UIButton   *maybeLaterButton;
    IBOutlet UIButton   *sendFeedbackButton;

    IBOutlet UIImageView   *directionView1;
    IBOutlet UIImageView   *directionView2;



    IBOutlet UIActivityIndicatorView   *upgradeActivity;
    IBOutlet UIActivityIndicatorView   *restoreActivity;
    IBOutlet UIActivityIndicatorView   *buyActivity;


    
    
    IBOutlet UILabel    *slideTutorialText;
    UITextView *textView;
    UIImageView *imageView;
    NSArray *imageArrayAnimation;

    
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, retain) UIButton *iapButton;
@property (nonatomic, retain) UIButton *upgradeButton;
@property (nonatomic, retain) UIButton *restoreButton;
@property (nonatomic, retain) UIButton *purchaseButton;
@property (nonatomic, retain) UIButton *maybeLaterButton;
@property (nonatomic, retain) UIButton *sendFeedback;

@property (nonatomic, retain) UIImageView *directionView1;
@property (nonatomic, retain) UIImageView *directionView2;





@property (nonatomic, strong) UIPopoverController *popController;
@property (nonatomic, strong) UILabel *slideTutorialText;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) NSArray *imageArrayAnimation;



-(IBAction)showPopover:(id)sender;

-(IBAction)iapButtonPressed:(id)sender;
-(IBAction)upgradeButtonPressed:(id)sender;
-(IBAction)restoreButtonPressed:(id)sender;
-(IBAction)purchaseButtonPressed:(id)sender;
-(IBAction)maybeLaterButtonPressed:(id)sender;
-(IBAction)sendFeedbackButtonPressed:(id)sender;




//- (void)productsPurchased;




@end
