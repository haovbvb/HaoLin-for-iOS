//
//  ZYPServerViewController.m
//  HaoLin
//
//  Created by mac on 14-9-5.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import "ZYPServerViewController.h"

@interface ZYPServerViewController ()

@end

@implementation ZYPServerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        /**
         *  隐藏tabbar
         */
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IS_IPHONE_5) {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }else
    {
        self.view.frame = CGRectMake(0, 0, 320, 480);
    }
    
    ZYPServeOrderView *orderView = [[[NSBundle mainBundle] loadNibNamed:@"ZYPServeOrderView" owner:self options:nil] lastObject];
    orderView.serveVC = self;
    [self.view addSubview:orderView];
    
    
    ZYPServeOrderTopView *topVIEW = [[[NSBundle mainBundle] loadNibNamed:@"ZYPServeOrderTopView" owner:self options:nil] lastObject];
    topVIEW.serveVC = self;
    topVIEW.orderView = orderView;
    topVIEW.frame = CGRectMake(0, 0, 320, 102);
    [orderView addSubview:topVIEW];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end