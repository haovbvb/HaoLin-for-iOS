//
//  ZYPLastCell.h
//  HaoLin
//
//  Created by mac on 14-9-5.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPLastCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;//  状态label
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;//  总金额label
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;//  金额

@property (weak, nonatomic) IBOutlet UIButton *palyBtn;

@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end