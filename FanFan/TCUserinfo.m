//
//  TCUserinfo.m
//  FanFan
//
//  Created by 陈世杰 on 17/7/21.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "TCUserinfo.h"

@implementation TCUserinfo
-(instancetype)init{
  self =   [super init];
    if(self){
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        if([ud objectForKey:@"token"]){
            self.access_token = [ud objectForKey:@"token"];
        }
        else{
            self.access_token = @"";
        }
    }
    return self;
}

-(void)setdic:(NSDictionary*)dic{
//    //用户头像url
//    @property(nonatomic,strong)NSString *touxiangurl;
//    //用户昵称
//    @property(nonatomic,strong)NSString *touxiangname;
//    //豪气值
//    @property(nonatomic,strong)NSString *haoqi;
//    //vip类型
//    @property(nonatomic,strong)NSString *viptype;
//    //最近帖子
//    @property(nonatomic,strong)NSString *zuijintie;
//    //关注数
//    @property(nonatomic,strong)NSString *guanzhunum;
//    //粉丝数
//    @property(nonatomic,strong)NSString *fensinum;
    self.touxiangurl = [NSString stringWithFormat:@"%@",[dic objectForKey:@"head_image_url"]] ;
        self.touxiangname = [NSString stringWithFormat:@"%@",[dic objectForKey:@"nick"]] ;
       self.haoqi = [NSString stringWithFormat:@"%@",[dic objectForKey:@"pride_value"]] ;
    self.viptype = [NSString stringWithFormat:@"%@",[dic objectForKey:@"vip_type"]] ;
   self.zuijintie = [NSString stringWithFormat:@"%@",[dic objectForKey:@"last_post"]] ;
       self.guanzhunum = [NSString stringWithFormat:@"%@",[dic objectForKey:@"follow_count"]] ;
           self.fensinum = [NSString stringWithFormat:@"%@",[dic objectForKey:@"fans_count"]] ;
}
@end
