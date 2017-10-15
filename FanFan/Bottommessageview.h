//
//  Bottommessageview.h
//  FanFan
//
//  Created by 陈世杰 on 17/7/21.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bottommessageview : UIView<UITextFieldDelegate>
//标题输入框
@property(nonatomic,strong)UITextField *tittletextfield;
//描述输入框
@property(nonatomic,strong)UITextField *mestextfield;
//选择图片
@property(nonatomic,strong)UIButton *imgbtn;
//选择道具
@property(nonatomic,strong)UIButton *userpagbtn;
//编辑状态代理
@property(nonatomic,strong)id  daleaget;
@end
