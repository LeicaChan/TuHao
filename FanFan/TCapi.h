//
//  TCapi.h
//  FanFan
//
//  Created by 陈世杰 on 17/7/20.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TCUserinfo.h"
#import "AES128.h"
#import <Security/Security.h>
typedef void (^TCCallBack)(id obj);
@interface TCapi : NSObject

#pragma mark - 数据网络方法
@property(nonatomic,strong)TCUserinfo* userinfo;
//api单例
+(TCapi*)share;
//更换全局api设置
-(void)setItemsAdress:(NSString*)adress AndKey:(NSString*)key;
//更换token
-(void)setToken:(NSString*)token;
//登录
-(void)WujilianloadUsername:(NSString*)username AndPassWord:(NSString*)password AndDeviceInfo:(NSString*)deviceinfo AndDeviceName:(NSString*)devicename AndDevicetype:(NSString*)type AndCallback:(TCCallBack)callback;
//短信验证码
-(void)requstduanxin:(NSString*)smsname andcallback:(TCCallBack)callback;
//请求帖子列表
-(void)requstMetadata:(NSString*)is_recommend Andoffset:(NSString*)offset Andlimit:(NSString*)limit andcallback:(TCCallBack)callback;
//获取userinfo
-(void)requstUeserinfoandcallback:(TCCallBack)callback;
#define KEY_PASSWORD  @"com.wujilian"
#define KEY_USERNAME_PASSWORD  @"com.wujilian.usernamepassword"
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

#pragma mark - 界面类公开方法
//主线程显示视图
+(void)PushMainView:(UIViewController*)view WithVC:(UIViewController*)vc;


@end
