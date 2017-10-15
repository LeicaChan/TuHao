//
//  Bottomclassview.h
//  FanFan
//
//  Created by 陈世杰 on 17/7/20.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bottomclassview : UIView
//售卖视图组
@property(nonatomic,strong)UIButton *sellbtn;
@property(nonatomic,strong)UIImageView *sellimg;
@property(nonatomic,strong)UILabel *selllabel;
//服务视图组
@property(nonatomic,strong)UIButton *serverbtn;
@property(nonatomic,strong)UIImageView *serverimg;
@property(nonatomic,strong)UILabel *serverabel;

//帮助视图组
@property(nonatomic,strong)UIButton *helpbtn;
@property(nonatomic,strong)UIImageView *helpimg;
@property(nonatomic,strong)UILabel *helpabel;

//娱乐视图组
@property(nonatomic,strong)UIButton *gamenbtn;
@property(nonatomic,strong)UIImageView *gameimg;
@property(nonatomic,strong)UILabel *gameabel;

//分享按钮
@property(nonatomic,strong)UIButton  *sharebtn;
@property(nonatomic,strong)UIImageView *shareimg;


//滑动线
@property(nonatomic,strong)UIView *indexview;
//动画全局开关
@property(nonatomic,assign)BOOL anmimotion;
//唯一选中标志符
@property(nonatomic,assign)int index;
@end
