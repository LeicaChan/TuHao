//
//  TCUserinfo.h
//  FanFan
//
//  Created by 陈世杰 on 17/7/21.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCUserinfo : NSObject

//服务器地址
@property (nonatomic,strong)NSString *severadress;
//数据加密key
@property (nonatomic,strong)NSString *key;
//token
@property(nonatomic,strong)NSString *access_token;
//全局订单号
@property(nonatomic,strong)NSString *oderid;

//用户头像url
@property(nonatomic,strong)NSString *touxiangurl;
//用户昵称
@property(nonatomic,strong)NSString *touxiangname;
//豪气值
@property(nonatomic,strong)NSString *haoqi;
//vip类型
@property(nonatomic,strong)NSString *viptype;
//最近帖子
@property(nonatomic,strong)NSString *zuijintie;
//关注数
@property(nonatomic,strong)NSString *guanzhunum;
//粉丝数
@property(nonatomic,strong)NSString *fensinum;

-(void)setdic:(NSDictionary*)dic;
@end
