//
//  ZYPLoginAndRegisterManger.h
//  HaoLin
//
//  Created by mac on 14-8-22.
//  Copyright (c) 2014年 hlsd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYPLoginAndRegisterManger : NSObject
@property (nonatomic, copy)NSString *valueForKey;
//  管理单例
+ (ZYPLoginAndRegisterManger *)shareManger;
//  登陆
- (void)loginWithUserName:(NSString *)mobile password:(NSString *)password  userid:(NSString *)userid tokenid:(NSString *)token  withJSON:(void (^)(id responeObjects))responeObject;
//  修改密码
- (void)changePassword:(NSString *)password1 userid:(NSString *)user_id tokenid:(NSString *)tokenid withJSON:(void (^)(id responeObjects))responeObject;
//  注册
- (void)registerWithUserName:(NSString *)mobile password:(NSString *)password  nickName:(NSString *)nickname  withJSON:(void (^)(id responeObjects))responeObject;
@end
