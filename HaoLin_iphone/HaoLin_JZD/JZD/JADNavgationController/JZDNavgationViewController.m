//
//  JZDNavgationViewController.m
//  HaoLin
//
//  Created by 姜泽东 on 14-8-29.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import "JZDNavgationViewController.h"

@interface JZDNavgationViewController ()

@end

@implementation JZDNavgationViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor blackColor], UITextAttributeTextColor, [UIFont fontWithName:@\"ArialMT\" size:16.0], UITextAttributeFont,nil]];
    self.navigationBar.barTintColor=HSPBarBgColor;
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:20],NSFontAttributeName,nil]];
}

@end
