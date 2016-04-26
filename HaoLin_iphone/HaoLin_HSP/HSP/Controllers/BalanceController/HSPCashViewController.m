//
//  HSPCashViewController.m
//  HaoLin
//
//  Created by PING on 14-8-23.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import "HSPCashViewController.h"

@interface HSPCashViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) HSPHttpRequest *request;

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *bankName;


@end

@implementation HSPCashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = HSPBgColor;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:_myTapCesture];
    self.title = @"提现";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:HSPFontColor,NSForegroundColorAttributeName, nil]];
    _IDCard.delegate = self;
    _scrollView.contentSize=CGSizeMake(_scrollView.width,_scrollView.height+50);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bankWithName:) name:@"setBankName" object:nil];
    if (!_code) {
        _code = @"1";
    }
    
}

- (void)bankWithName:(NSNotification *)note
{
//    _code = [note.userInfo objectForKey:@"code"];
    _bankName = [note.userInfo objectForKey:@"bankName"];
    
    [_bankBtn setTitle:[NSString stringWithFormat:@"%@ >",[note.userInfo objectForKey:@"bankName"]] forState:UIControlStateNormal];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([_IDCard isEqual:textField]) {
        _scrollView.contentSize=CGSizeMake(_scrollView.width,_scrollView.height+150);
        [UIView animateWithDuration:0.25f animations:^{
            _scrollView.contentOffset = CGPointMake(0, 50);
        }];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if ([_IDCard isEqual:textField]) {
        _scrollView.contentSize=CGSizeMake(_scrollView.width,_scrollView.height);
        [UIView animateWithDuration:0.25f animations:^{
            _scrollView.contentOffset = CGPointMake(0, -50);
        }];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


- (IBAction)chooseBank:(id)sender {
    HSPBankViewController *bank = [[HSPBankViewController alloc] initWithNibName:@"HSPBankViewController" bundle:nil];
    [self.navigationController pushViewController:bank animated:YES];
}
- (IBAction)tapResignFirstResponder:(id)sender {
    for(id obj in _accountNumberView.subviews){
        if ([obj isKindOfClass:[UITextField class]]||[obj isKindOfClass:[UITextView class]]) {
            [obj resignFirstResponder];
        }
    }
    for(id obj in _personView.subviews){
        if ([obj isKindOfClass:[UITextField class]]||[obj isKindOfClass:[UITextView class]]) {
            [obj resignFirstResponder];
        }
    }
}

- (IBAction)submit:(id)sender {
    if (!_accountNumber.text.length || !_accountName.text.length || !_money.text.length || !_IDCard.text.length) {
        return;
    }
    
    [self requestCash];
    
}

- (void)requestCash
{
    HSPAccount *account = [HSPAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"user_id"] = account.user_id;
    params[@"card"] = _accountNumber.text;
    params[@"card_name"] = _bankName;
    params[@"real_name"] =_accountName.text;
    params[@"amount"] = _money.text;
    params[@"identity"] =_IDCard.text;
    [self.request connectionREquesturl:[NSString stringWithFormat:@"http://t9.wxwork.cn/index.php?m=home&c=amount&a=postMemberAcquireMoney&tokenid=%@",account.userTokenid] withPostDatas:params withDelegate:nil withBackBlock:^(id backDictionary) {
        YYLog(@"backDictionary==%@",backDictionary);
        if ([[backDictionary objectForKey:@"code"] isEqualToString:@"0"]) {
            
            HSPCashStutasViewController *cashStutas = [[HSPCashStutasViewController alloc] init];
            [self.navigationController pushViewController:cashStutas animated:YES];
            return;
        }else{
            JZDCustomAlertView *alert = [JZDCustomAlertView sharedInstace];
            [alert popAlert:[backDictionary objectForKey:@"message"]];
            return;
        }
    }];
}

- (void)dealloc
{
    _myTapCesture = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark - 懒加载
- (HSPHttpRequest *)request
{
    if (!_request) {
        _request = [HSPHttpRequest Instace];
    }
    return _request;
}

@end