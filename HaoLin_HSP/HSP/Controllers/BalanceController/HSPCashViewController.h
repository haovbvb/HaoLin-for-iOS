//
//  HSPCashViewController.h
//  HaoLin
//
//  Created by PING on 14-8-23.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSPCashViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *accountNumberView;
@property (weak, nonatomic) IBOutlet UIView *personView;

@property (weak, nonatomic) IBOutlet UITextField *accountNumber;
@property (weak, nonatomic) IBOutlet UITextField *accountName;
@property (weak, nonatomic) IBOutlet UITextField *money;
@property (weak, nonatomic) IBOutlet UITextField *IDCard;
- (IBAction)chooseBank:(id)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *myTapCesture;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)tapResignFirstResponder:(id)sender;
- (IBAction)submit:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *bankBtn;
@end
