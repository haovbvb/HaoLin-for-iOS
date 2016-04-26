//
//  JZDPushSingl.m
//  HaoLin
//
//  Created by Zidon on 14-9-16.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import "JZDPushSingl.h"
static JZDPushSingl *singl=nil;
@implementation JZDPushSingl
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+(id)sharedInstance
{
    static dispatch_once_t t;
    dispatch_once(&t, ^{singl=[[JZDPushSingl alloc] init];});
    return singl;
}

-(id)init
{
    if (self==[super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushDic:) name:NotificationOfSendToBusiness object:nil];
    }
    return self;
}

-(void)pushDic:(NSNotification *)not
{
    id obj=not.object;
    NSString *pustStr=MDLCommit;
    if (_token_idStr&&![pustStr isEqualToString:(NSString *)obj]) {
        NSDictionary *dict=@{@"user_id": _userIdStr,@"tokenid":_token_idStr,@"talk_id":[not.userInfo objectForKey:@"talk_id"]};
        NSString *talk_id=[not.userInfo objectForKey:@"talk_id"];
        if (talk_id) {
            request =[JZDModuleHttpRequest sharedInstace];
            [request connectionREquesturl:PushSingl withPostDatas:dict withDelegate:nil withBackBlock:^(id backDictionary, NSError *error) {
                if (!error) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:BtainNotification object:@"can" userInfo:backDictionary];
                }
            }];
        }
    }
    if ([pustStr isEqualToString:(NSString *)obj]) {
        NSDictionary *dic=@{@"user_id": _userIdStr,@"tokenid":_token_idStr,@"talk_id":[not.userInfo objectForKey:@"talk_id"],@"goods_info":[[not.userInfo objectForKey:@"goods_info"] JSONString]};
        [request connectionREquesturl:CommitHanDan withPostDatas:dic withDelegate:nil withBackBlock:^(id backDictionary, NSError *error) {
            if (!error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:MesGeNotification object:nil userInfo:backDictionary];
            }
        }];
    }
}

@end


