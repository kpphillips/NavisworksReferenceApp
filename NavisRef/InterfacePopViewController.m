//
//  InterfacePopViewController.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 9/28/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import "InterfacePopViewController.h"

@interface InterfacePopViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation InterfacePopViewController

- (void)setText:(NSAttributedString *)text
{
    //text height?
    [_textView setFont:[UIFont fontWithName:@"Arial" size:14]];
    _textView.textColor = [UIColor whiteColor];

    _text = text;
    self.textView.attributedText = text;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //UIFont *font = [UIFont fontWithName:@"Avenir-Roman" size:24.0];
    //text.font = [UIFont boldSystemFontOfSize:16.0f]

    // = [UIFont boldSystemFontOfSize:18.0f];
    //NSFont *font = [NSFont fontWithName:@"Helvetica" size:16.0];
    [_textView setFont:[UIFont fontWithName:@"Arial" size:14]];
    _textView.textColor = [UIColor whiteColor];


    self.textView.attributedText = self.text;
    
	// Do any additional setup after loading the view.
    
    
    
    
    
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 */

@end
