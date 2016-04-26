//
//  MQLPetsViewController.m
//  HaoLin
//
//  Created by mac on 14-8-7.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import "MQLPetsViewController.h"

@interface MQLPetsViewController ()

@property (nonatomic, weak) IBOutlet UIView *adjustView;    //适配视图（0，-20，0，69），因为app start form ios7, 所以该引用备用
@property (nonatomic, assign)BOOL A;
@property (nonatomic, assign)BOOL P;

/**
 *  自定义初始化
 */
-(void)customInitialization;

/**
 *  添加订单视图
 */
-(void)addOrderFormView;




@end

@implementation MQLPetsViewController

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
    // Do any additional setup after loading the view from its nib.
    /**
     *  给属性A赋初始值
     */
    self.A = NO;
    /**
     *  添加观察者，添加观察者（退出登录时触发，登录界面点击返回按钮时触发，将A的状态改为YES）
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(push:) name:@"log" object:nil];
    /**
     *  添加观察者（退出登录时触发，登录界面点击返回按钮时触发，将A的状态改为YES）
     *
     *  @param state: 观察者出发的方法
     *
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(state:) name:@"A" object:nil];
    
    /**
     *  登录时发送的一个通知
     *
     *  @param pp: 通知方法
     *
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pp:) name:@"你好" object:nil];
    //自定义初始化
    [self customInitialization];
    
}
/**
 *  通知方法
 *
 *  @param no 传递过来的通知实例
 */
- (void)pp:(NSNotification *)no
{
    self.P = YES;
}
- (void)state:(NSNotification *)no
{
    self.A = YES;
}
- (void)push:(NSNotification *)no
{
    HSPAccount *account = [HSPAccountTool account];
    if ([account.user_id length] > 0)
    {
        self.A = YES;
    }else if ([account.user_id length] == 0)
    {
        self.A = NO;
    }
}





-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //添加订单视图
    [self addOrderFormView];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- MQLPetsViewController函数扩展
/**
 *  自定义初始化
 */
-(void)customInitialization
{
    self.view.backgroundColor = MQLBGColor;
}

/**
 *  添加订单视图
 */
-(void)addOrderFormView
{
    MQLAppDelegate *appDelegate = (MQLAppDelegate*)[UIApplication sharedApplication].delegate;
    int lastTabBarItemIndex = appDelegate.rootViewController.lastTabBarItemIndex;
    
    switch (lastTabBarItemIndex) {
        case 0://从个人切过来的
        {
            //添加你的代码
            [self goTo:lastTabBarItemIndex];
        }
            break;
        case 1://从商家切过来的
        {
            //添加你的代码
            [self goTo:lastTabBarItemIndex];
        }
            break;
        default:
            break;
    }
    
}
- (void)goTo:(NSInteger)tag
{
    //添加你的代码
    ZYPObjectManger *manger = [ZYPObjectManger shareInstance];
    HSPAccount *account = [HSPAccountTool account];
    /**
     *  添加标示，判断
     */
    manger.barTitle = @"pet";
    if ([account.user_id length] > 0)
    {
        [self tapInto:tag];
    }else if([account.user_id length] == 0)
    {
        [self logout];
        if (self.A == YES)
        {
            return;
        }else if (self.A == NO)
        {
            HSPLoginViewController *loginVC = [[HSPLoginViewController alloc] initWithNibName:@"HSPLoginViewController" bundle:nil];
            [self presentViewController:loginVC animated:YES completion:nil];
            self.A = YES;
        }
    }
}
//  跳入商家订单界面
- (void)tapInto:(NSInteger)tag
{
    HSPAccount *account = [HSPAccountTool account];
    if ([account.user_mark isEqualToString:@"2"])
    {
        if (tag == 0)
        {
            /**
             *  判断，返回的时候不加载
             */
            NSInteger count = 0;
            if ([account.range_type intValue] == 1)
            {
                for (UIView *view in _adjustView.subviews) {
                    if ([view isKindOfClass:[ZYPEntityOrderView class]]) {
                        [view removeFromSuperview];
                    }
                }
            }else if ([account.range_type intValue] == 2)
            {
                for (UIView *view in _adjustView.subviews) {
                    if ([view isKindOfClass:[ZYPServeOrderView class]]) {
                        [view removeFromSuperview];
                    }
                }
            }
            for (UIView *v  in _adjustView.subviews) {
                if ([v isKindOfClass:[HSPOrderView class]])
                {
                    count ++;
                }
            }
            /**
             *  如果count为0，说明是没有界面加上，否则有界面，不作操作
             */
            
            if (self.P == NO)
            {
                if (count == 0) {
                    HSPOrderView  *orderView = [[[NSBundle mainBundle] loadNibNamed:@"HSPOrderView" owner:self options:nil] lastObject];
                    orderView.HSPOrderViewController = self;
                    [self.adjustView addSubview:orderView];
                }
            }else if(self.P == YES)
            {
                HSPOrderView  *orderView = [[[NSBundle mainBundle] loadNibNamed:@"HSPOrderView" owner:self options:nil] lastObject];
                orderView.HSPOrderViewController = self;
                [self.adjustView addSubview:orderView];
                self.P = NO;
            }
            
        }else if (tag == 1)
        {
            for (UIView *orderV in _adjustView.subviews) {
                if ([orderV isKindOfClass:[HSPOrderView class]]) {
                    [orderV removeFromSuperview];
                }
            }
           
            /**
             *  实物
             */
            if ([account.range_type intValue] == 1)
            {
                for (UIView *view in _adjustView.subviews)
                {
                    if ([view isKindOfClass:[ZYPServeOrderView class]]) {
                        [view removeFromSuperview];
                    }
                }
                 NSInteger count1 = 0;
                for (UIView *view in _adjustView.subviews)
                {
                    if ([view isKindOfClass:[ZYPEntityOrderView class]]) {
                        count1 ++;
                    }
                }
                if (self.P == NO)
                {
                    if (count1 == 0) {
                        ZYPEntityOrderView *entityView = [[[NSBundle mainBundle] loadNibNamed:@"ZYPEntityOrderView" owner:self options:nil] lastObject];
                        entityView.petVC = self;
                        [self.adjustView addSubview:entityView];
                        ZYPorderTopView *topView = [[[NSBundle mainBundle] loadNibNamed:@"ZYPorderTopView" owner:self options:nil] lastObject];
                        topView.orderV = entityView;
                        topView.backBtn.hidden = YES;
                        topView.frame = CGRectMake(0, 0, 320, 102);
                        [entityView addSubview:topView];
                    }
                }else if(self.P == YES)
                {
                    ZYPEntityOrderView *entityView = [[[NSBundle mainBundle] loadNibNamed:@"ZYPEntityOrderView" owner:self options:nil] lastObject];
                    entityView.petVC = self;
                    [self.adjustView addSubview:entityView];
                    ZYPorderTopView *topView = [[[NSBundle mainBundle] loadNibNamed:@"ZYPorderTopView" owner:self options:nil] lastObject];
                    topView.orderV = entityView;
                    topView.backBtn.hidden = YES;
                    topView.frame = CGRectMake(0, 0, 320, 102);
                    [entityView addSubview:topView];
                    self.P = NO;
                }
                /**
                 *  服务
                 */
            }else if ([account.range_type intValue] == 2)
            {
                for (UIView *view in _adjustView.subviews)
                {
                    if ([view isKindOfClass:[ZYPEntityOrderView class]]) {
                        [view removeFromSuperview];
                    }
                }
                 NSInteger count2 = 0;
                for (UIView *view in _adjustView.subviews) {
                    if ([view isKindOfClass:[ZYPServeOrderView class]]) {
                        count2 ++;
                    }
                }
                if (self.P == NO)
                {
                    if (count2 == 0) {
                        ZYPServeOrderView *orderView = [[[NSBundle mainBundle] loadNibNamed:@"ZYPServeOrderView" owner:self options:nil] lastObject];
                        orderView.petVC = self;
                        [self.adjustView addSubview:orderView];
                        ZYPServeOrderTopView *TOPvIEW = [[[NSBundle mainBundle] loadNibNamed:@"ZYPServeOrderTopView" owner:self options:nil] lastObject];
                        TOPvIEW.frame = CGRectMake(0, 0, 320, 102);
                        TOPvIEW.orderView = orderView;
                        TOPvIEW.backBtn.hidden = YES;
                        [orderView addSubview:TOPvIEW];
                    }
                }else if (self.P == YES)
                {
                    ZYPServeOrderView *orderView = [[[NSBundle mainBundle] loadNibNamed:@"ZYPServeOrderView" owner:self options:nil] lastObject];
                    orderView.petVC = self;
                    [self.adjustView addSubview:orderView];
                    ZYPServeOrderTopView *TOPvIEW = [[[NSBundle mainBundle] loadNibNamed:@"ZYPServeOrderTopView" owner:self options:nil] lastObject];
                    TOPvIEW.frame = CGRectMake(0, 0, 320, 102);
                    TOPvIEW.orderView = orderView;
                    TOPvIEW.backBtn.hidden = YES;
                    [orderView addSubview:TOPvIEW];
                    self.P = NO;
                }
            }
        }
    }else if ([account.user_mark isEqualToString:@"0"] || [account.user_mark isEqualToString:@"1"] || [account.user_mark isEqualToString:@"3"])
    {
        HSPOrderView  *orderView = [[[NSBundle mainBundle] loadNibNamed:@"HSPOrderView" owner:self options:nil] lastObject];
        orderView.HSPOrderViewController = self;
        [self.adjustView addSubview:orderView];
    }
}
/**
 *当没有登录时，从登陆界面返回显示的界面
 */
- (void)logout
{
    for (UIView *view in _adjustView.subviews) {
        [view removeFromSuperview];
    }
    ZYPOrderLogoutView *logoutView = [[[NSBundle mainBundle] loadNibNamed:@"ZYPOrderLogoutView" owner:self options:nil] lastObject];
    logoutView.petVC = self;
    [self.adjustView addSubview:logoutView];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"log" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"A" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"你好" object:nil];

}
@end