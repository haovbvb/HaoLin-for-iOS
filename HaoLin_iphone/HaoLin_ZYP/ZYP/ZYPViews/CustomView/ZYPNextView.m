//
//  ZYPNextView.m
//  Business
//
//  Created by mac on 14-8-21.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import "ZYPNextView.h"
#define MLelf 20
#define MTop 5
#define MWidth 60
#define MHeight 30
@implementation ZYPNextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  配送费label
        self.deliveryLabel = [[UILabel alloc] initWithFrame:CGRectMake(MLelf, MTop, MWidth, MHeight)];
        self.deliveryLabel.text = @"配送费";
        [self addSubview:self.deliveryLabel];
        //  配送费
        self.deliveryPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(MLelf + 230 + 35, MTop, MWidth, MHeight)];
        self.deliveryPriceLabel.text = @"￥5";
        self.deliveryPriceLabel.textColor = [UIColor orangeColor];
        self.deliveryPriceLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.deliveryPriceLabel];
        // 分割线
        self.lineTwoLabel = [[UILabel alloc] initWithFrame:CGRectMake(MLelf, MTop + MHeight + 5, MWidth + 240, 1)];
        self.lineTwoLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.lineTwoLabel];
        // 声音图片
        self.soundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MLelf, MTop + MHeight  + 10, MWidth - 30, MHeight)];
        self.soundImageView.image = [UIImage imageNamed:@"ZYPSoundP@2x.png"];
        [self addSubview:self.soundImageView];
        self.totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(MLelf + 190, MTop + MHeight  + 10, MWidth - 15 , MHeight)];
        self.totalPriceLabel.text = @"总计:";
        self.totalPriceLabel.textColor = [UIColor orangeColor];
        [self addSubview:self.totalLabel];
        //  总计价格
        self.totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(MLelf + 200 + 35, MTop + MHeight  + 10, MWidth , MHeight)];
        self.totalPriceLabel.text = @"￥15";
        self.totalPriceLabel.textColor = [UIColor orangeColor];

        [self addSubview:self.totalPriceLabel];
        //  分割线
        self.lineThreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(MLelf , MTop + MHeight*2 + 15, MWidth + 240, 1)];
        self.lineThreeLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.lineThreeLabel];
        
        
        
        //  配送状态label
        self.deliveryStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(MLelf, MTop + MHeight *2 + 20, MWidth + 30, MHeight)];
        self.deliveryStateLabel.text = @"配送状态:";
        [self addSubview:self.deliveryStateLabel];
        //  配送状态
        self.deliveryState = [[UILabel alloc] initWithFrame:CGRectMake(MLelf + 100, MTop + MHeight *2 + 20, MWidth + 80, MHeight)];
        self.deliveryState.textColor = [UIColor orangeColor];
        self.deliveryStateLabel.text = @"待发货";
        [self addSubview:self.deliveryState];
        
        //  state按钮
        self.stateBtn = [[UIButton alloc] initWithFrame:CGRectMake(MLelf + 200, MTop + MHeight *2 + 20, MWidth + 20, MHeight - 3)];
        self.stateBtn.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.stateBtn];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
