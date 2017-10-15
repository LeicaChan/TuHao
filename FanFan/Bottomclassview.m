//
//  Bottomclassview.m
//  FanFan
//
//  Created by 陈世杰 on 17/7/20.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "Bottomclassview.h"

@implementation Bottomclassview
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //初始化各控件参数
        self.anmimotion  = NO;
        self.index = 1;
        //视图组初始化
        self.sellimg = [[UIImageView alloc]init];
        self.sellimg.image = [UIImage imageNamed:@"tab_icon1.png"];
        [self addSubview:self.sellimg];
        self.selllabel = [[UILabel alloc]init];
        self.selllabel.text = @"售卖";
        self.selllabel.textColor = [UIColor lightGrayColor];
        self.selllabel.textAlignment =  NSTextAlignmentLeft;
        self.selllabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.selllabel];
        
        self.serverimg = [[UIImageView alloc]init];
        self.serverimg.image = [UIImage imageNamed:@"tab_icon2.png"];
        [self addSubview:self.serverimg];
        self.serverabel = [[UILabel alloc]init];
        self.serverabel.text = @"服务";
        self.serverabel.textColor = [UIColor lightGrayColor];
        self.serverabel.textAlignment =  NSTextAlignmentLeft;
        self.serverabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.serverabel];
        
        self.helpimg = [[UIImageView alloc]init];
        self.helpimg.image = [UIImage imageNamed:@"tab_icon3.png"];
        [self addSubview:self.helpimg];
        self.helpabel = [[UILabel alloc]init];
        self.helpabel.text = @"求助";
        self.helpabel.textColor = [UIColor lightGrayColor];
        self.helpabel.textAlignment =  NSTextAlignmentLeft;
        self.helpabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.helpabel];
        
        self.gameimg = [[UIImageView alloc]init];
        self.gameimg.image = [UIImage imageNamed:@"tab_icon4.png"];
        [self addSubview:self.gameimg];
        self.gameabel = [[UILabel alloc]init];
        self.gameabel.text = @"娱乐";
        self.gameabel.textColor = [UIColor lightGrayColor];
        self.gameabel.textAlignment =  NSTextAlignmentLeft;
        self.gameabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.gameabel];
        
        self.shareimg = [[UIImageView alloc]init];
        self.shareimg.image = [UIImage imageNamed:@"tab_icon5.png"];
        [self addSubview:self.shareimg];
        
        
        //按钮组初始化
        self.sellbtn = [[UIButton alloc]init];
        [self.sellbtn addTarget:self action:@selector(seletesell) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.sellbtn];
        
        self.serverbtn = [[UIButton alloc]init];
        [self.serverbtn addTarget:self action:@selector(seleteserver) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.serverbtn];
        
        self.helpbtn = [[UIButton alloc]init];
        [self.helpbtn addTarget:self action:@selector(seletehelp) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.helpbtn];
        
        self.gamenbtn = [[UIButton alloc]init];
        [self.gamenbtn addTarget:self action:@selector(seletegame) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.gamenbtn];
        
        self.sharebtn = [[UIButton alloc]init];
        [self.sharebtn addTarget:self action:@selector(seleteshare) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.sharebtn];
        
        //滑动线
        self.indexview =  [[UIView alloc]initWithFrame:CGRectMake(10, self.frame.size.height-3, frame.size.width/5-20, 2)];
        self.indexview.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:160.0/255.0 blue:51.0/255.0 alpha:1.0];
        [self addSubview:self.indexview];
        
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if([UIScreen mainScreen].bounds.size.height==568){
        //5布局
        CGRect frame  = [self bounds];
        CGFloat width = frame.size.width/5;
        self.sellbtn.frame = CGRectMake(0*width, 0, width, self.frame.size.height);
        self.serverbtn.frame =CGRectMake(2*width, 0, width, self.frame.size.height);
        self.helpbtn.frame = CGRectMake(1*width, 0, width, self.frame.size.height);
        self.gamenbtn.frame = CGRectMake(3*width, 0, width, self.frame.size.height);
        self.sharebtn.frame = CGRectMake(4*width, 0, width, self.frame.size.height);
     

        
        self.sellimg.frame = CGRectMake(width/2-26, 11, 21, 21);
        self.selllabel.frame = CGRectMake(width/2-5, 5, 54, 34);
        
        self.helpimg.frame = CGRectMake(width/2*3-26, 11, 21, 21);
        self.helpabel.frame = CGRectMake(width/2*3-5, 5, 54, 34);
        
        self.serverimg.frame = CGRectMake(width/2*5-26, 11, 21, 21);
        self.serverabel.frame = CGRectMake(width/2*5-5, 5, 54, 34);
        
        self.gameimg.frame = CGRectMake(width/2*7-26, 11, 21, 21);
        self.gameabel.frame = CGRectMake(width/2*7-5, 5, 54, 34);
        
        self.shareimg.frame = CGRectMake(width/2*9-10.5, 11, 21, 21);
        
    }
    else{
        // 5s以上 布局
    CGRect frame  = [self bounds];
    CGFloat width = frame.size.width/5;
    self.sellbtn.frame = CGRectMake(0*width, 0, width, self.frame.size.height);
    self.serverbtn.frame = CGRectMake(2*width, 0, width, self.frame.size.height);
    self.helpbtn.frame = CGRectMake(1*width, 0, width, self.frame.size.height);
    self.gamenbtn.frame = CGRectMake(3*width, 0, width, self.frame.size.height);
    self.sharebtn.frame = CGRectMake(4*width, 0, width, self.frame.size.height);
    
    self.sellimg.frame = CGRectMake(width/2-31, 11, 21, 21);
    self.selllabel.frame = CGRectMake(width/2-5, 5, 54, 34);
    
    self.helpimg.frame = CGRectMake(width/2*3-31, 11, 21, 21);
    self.helpabel.frame = CGRectMake(width/2*3-5, 5, 54, 34);
    
    self.serverimg.frame = CGRectMake(width/2*5-31, 11, 21, 21);
    self.serverabel.frame = CGRectMake(width/2*5-5, 5, 54, 34);
    
    self.gameimg.frame = CGRectMake(width/2*7-31, 11, 21, 21);
    self.gameabel.frame = CGRectMake(width/2*7-5, 5, 54, 34);
    
    self.shareimg.frame = CGRectMake(width/2*9-10.5, 11, 21, 21);
    }

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    //绘制底部线条
    UIBezierPath *path = [UIBezierPath bezierPath];//初始化
    //确定起点
    [path moveToPoint:CGPointMake(0, self.frame.size.height-1)];
    //点到点之间连成直线
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height-1)];

    //    [path addLineToPoint:CGPointMake(50, 50)]; //三角形
    //设置曲线的常用风格参数
    path.lineWidth=1;
    //设置线头的样式
    path.lineCapStyle=kCGLineCapRound;
    //设置交叉点的样式
    path.lineJoinStyle=kCGLineJoinRound;
    
    //设置描边颜色
    [[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:238.0/255.0 alpha:1.0]setStroke];

    
    //绘制方法有两种 一：只绘制线条 二：封闭图形 如果需要把线连起来形成一个整体的图像
    [path stroke];
    
    //绘制分割线
    int fiwidth = self.frame.size.width/5;
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];//初始化
    //确定起点
    [path1 moveToPoint:CGPointMake(fiwidth, 10)];
    //点到点之间连成直线
    [path1 addLineToPoint:CGPointMake(fiwidth, self.frame.size.height-10)];
    
    //    [path addLineToPoint:CGPointMake(50, 50)]; //三角形
    //设置曲线的常用风格参数
    path1.lineWidth=1;
    //设置线头的样式
    path1.lineCapStyle=kCGLineCapRound;
    //设置交叉点的样式
    path1.lineJoinStyle=kCGLineJoinRound;
    
    //设置描边颜色
    [[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:238.0/255.0 alpha:1.0]setStroke];
    
    
    //绘制方法有两种 一：只绘制线条 二：封闭图形 如果需要把线连起来形成一个整体的图像
    [path1 stroke];

    UIBezierPath *path2 = [UIBezierPath bezierPath];//初始化
    //确定起点
    [path2 moveToPoint:CGPointMake(fiwidth*2, 10)];
    //点到点之间连成直线
    [path2 addLineToPoint:CGPointMake(fiwidth*2, self.frame.size.height-10)];
    
    //    [path addLineToPoint:CGPointMake(50, 50)]; //三角形
    //设置曲线的常用风格参数
    path2.lineWidth=1;
    //设置线头的样式
    path2.lineCapStyle=kCGLineCapRound;
    //设置交叉点的样式
    path2.lineJoinStyle=kCGLineJoinRound;
    
    //设置描边颜色
    [[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:238.0/255.0 alpha:1.0]setStroke];
    
    
    //绘制方法有两种 一：只绘制线条 二：封闭图形 如果需要把线连起来形成一个整体的图像
    [path2 stroke];
    
    
    UIBezierPath *path3 = [UIBezierPath bezierPath];//初始化
    //确定起点
    [path3 moveToPoint:CGPointMake(fiwidth*3, 10)];
    //点到点之间连成直线
    [path3 addLineToPoint:CGPointMake(fiwidth*3, self.frame.size.height-10)];
    
    //    [path addLineToPoint:CGPointMake(50, 50)]; //三角形
    //设置曲线的常用风格参数
    path3.lineWidth=1;
    //设置线头的样式
    path3.lineCapStyle=kCGLineCapRound;
    //设置交叉点的样式
    path3.lineJoinStyle=kCGLineJoinRound;
    
    //设置描边颜色
    [[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:238.0/255.0 alpha:1.0]setStroke];
    
    
    //绘制方法有两种 一：只绘制线条 二：封闭图形 如果需要把线连起来形成一个整体的图像
    [path3 stroke];

    UIBezierPath *path4 = [UIBezierPath bezierPath];//初始化
    //确定起点
    [path4 moveToPoint:CGPointMake(fiwidth*4, 10)];
    //点到点之间连成直线
    [path4 addLineToPoint:CGPointMake(fiwidth*4, self.frame.size.height-10)];
    
    //    [path addLineToPoint:CGPointMake(50, 50)]; //三角形
    //设置曲线的常用风格参数
    path4.lineWidth=1;
    //设置线头的样式
    path4.lineCapStyle=kCGLineCapRound;
    //设置交叉点的样式
    path4.lineJoinStyle=kCGLineJoinRound;
    
    //设置描边颜色
    [[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:238.0/255.0 alpha:1.0]setStroke];
    
    
    //绘制方法有两种 一：只绘制线条 二：封闭图形 如果需要把线连起来形成一个整体的图像
    [path4 stroke];

}
#pragma mark - 选中事件
//售卖行为
-(void)seletesell{
    NSLog(@"售卖");
    if(self.anmimotion == NO && self.index != 1){
        //开启动画全局开关
        self.anmimotion = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.indexview.frame = CGRectMake(self.sellbtn.frame.origin.x+10, self.frame.size.height-3, self.frame.size.width/5-20, 2);
              self.indexview.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:160.0/255.0 blue:51.0/255.0 alpha:1.0];
        } completion:^(BOOL finished) {
            self.index = 1;
            self.anmimotion  = NO;
        }];
        
    }
 
    
}
//服务行为
-(void)seleteserver{
       NSLog(@"服务");
    if(self.anmimotion == NO && self.index != 2){
        //开启动画全局开关
        self.anmimotion = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.indexview.frame = CGRectMake(self.serverbtn.frame.origin.x+10, self.frame.size.height-3, self.frame.size.width/5-20, 2);
                    self.indexview.backgroundColor = [UIColor colorWithRed:39.0/255.0 green:143.0/255.0 blue:230.0/255.0 alpha:1.0];
        } completion:^(BOOL finished) {
            self.index = 2;
            self.anmimotion  = NO;
        }];
        
    }
}
//帮助行为
-(void)seletehelp{
    NSLog(@"帮助");
    if(self.anmimotion == NO && self.index != 3){
        //开启动画全局开关
        self.anmimotion = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.indexview.frame = CGRectMake(self.helpbtn.frame.origin.x+10, self.frame.size.height-3, self.frame.size.width/5-20, 2);
              self.indexview.backgroundColor = [UIColor colorWithRed:0/255.0 green:164.0/255.0 blue:40.0/255.0 alpha:1.0];
        } completion:^(BOOL finished) {
            self.index = 3;
            self.anmimotion  = NO;
        }];
        
    }
}
//娱乐行为
-(void)seletegame{
    NSLog(@"娱乐");
    if(self.anmimotion == NO && self.index != 4){
        //开启动画全局开关
        self.anmimotion = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.indexview.frame = CGRectMake(self.gamenbtn.frame.origin.x+10, self.frame.size.height-3, self.frame.size.width/5-20, 2);
                                self.indexview.backgroundColor = [UIColor colorWithRed:219.0/254.0 green:63.0/255.0 blue:92.0/255.0 alpha:1.0];
        } completion:^(BOOL finished) {
            self.index = 4;
            self.anmimotion  = NO;
        }];
        
    }
}
//分享行为
-(void)seleteshare{
        NSLog(@"分享 ");
}

@end
