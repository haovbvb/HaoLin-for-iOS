//
//  MDLFailureView.m
//  HaoLin
//
//  Created by apple on 14-8-16.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import "MDLFailureView.h"

@implementation MDLFailureView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)awakeFromNib
{
    self.navbarv.backgroundColor=MDLBGColor;
    self.ANimage.backgroundColor=BGColor;
    self.JXqiangdanButton.backgroundColor=MDLBGColor;
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