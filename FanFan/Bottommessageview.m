//
//  Bottommessageview.m
//  FanFan
//
//  Created by 陈世杰 on 17/7/21.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "Bottommessageview.h"
#define PI 3.14159265358979323846
@implementation Bottommessageview

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.tittletextfield = [[UITextField alloc]initWithFrame:CGRectMake(35, 7.5, self.frame.size.width-145, 35)];
        self.tittletextfield.placeholder = @"发布标题";
        self.tittletextfield.font = [UIFont systemFontOfSize:16];
        self.tittletextfield.textColor = [UIColor lightGrayColor];
        self.tittletextfield.delegate = self;
        self.tittletextfield.returnKeyType = UIReturnKeyNext;
        [self.tittletextfield addTarget:self.daleaget action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:self.tittletextfield];
        
        self.mestextfield = [[UITextField alloc]initWithFrame:CGRectMake(35, 50+7.5, self.frame.size.width-145, 35)];
        self.mestextfield.placeholder = @"简短的描述";
        self.mestextfield.font = [UIFont systemFontOfSize:16];
        self.mestextfield.textColor = [UIColor lightGrayColor];
        self.mestextfield.delegate = self;
        self.mestextfield.returnKeyType = UIReturnKeySend;
           [self.mestextfield addTarget:self.daleaget action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:self.mestextfield];
        
        CGFloat xwidth  = (self.frame.size.width-(35+(self.frame.size.width-145)));
        self.imgbtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-(xwidth/2)-20, 5, 40, 40)];
        [self.imgbtn setImage:[UIImage imageNamed:@"img_icon.png"] forState:UIControlStateNormal];
        [self.imgbtn addTarget:self action:@selector(openimagevc) forControlEvents:UIControlEventTouchUpInside];
        [self  addSubview:self.imgbtn];
        
        self.userpagbtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-(xwidth/2)-30, 65, 60, 20)];
        [self.userpagbtn setTitle:@"选择道具" forState:UIControlStateNormal];
        [self.userpagbtn setTitleColor:[UIColor colorWithRed:26.0/255.0 green:175.0/255.0 blue:79.0/255.0 alpha:1] forState:UIControlStateNormal];
        self.userpagbtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.userpagbtn addTarget:self action:@selector(openpagvc) forControlEvents:UIControlEventTouchUpInside];
        self.userpagbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self  addSubview:self.userpagbtn];
        
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor*aColor = [UIColor colorWithRed:26.0/255.0 green:175.0/255.0 blue:79.0/255.0 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
  
    CGContextAddArc(context, 15, self.frame.size.height/4, 4, 0, 2*PI, 0); //添加一个圆
    
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
     CGContextDrawPath(context, kCGPathFill);//绘制填充
    
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    
    UIColor*aColor1 = [UIColor colorWithRed:26.0/255.0 green:175.0/255.0 blue:79.0/255.0 alpha:1];
    CGContextSetFillColorWithColor(context1, aColor1.CGColor);//填充颜色
    
    CGContextAddArc(context1, 15, self.frame.size.height-(self.frame.size.height/4), 4, 0, 2*PI, 0); //添加一个圆
    
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context1, kCGPathFill);//绘制填充
    
    
    //绘制底部线条
    UIBezierPath *path = [UIBezierPath bezierPath];//初始化
    //确定起点
    [path moveToPoint:CGPointMake(35, self.frame.size.height/2)];
    //点到点之间连成直线
    [path addLineToPoint:CGPointMake(self.frame.size.width-110, self.frame.size.height/2)];
    
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


}
#pragma mark - textfiled代理
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.tittletextfield){
        [self.mestextfield becomeFirstResponder];
        //发送检查view通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"postcheckbottomview" object:nil userInfo:nil];
    }
    else{
        [self.mestextfield resignFirstResponder];
        //发送发布通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"postmessage" object:nil userInfo:@{@"title":self.tittletextfield.text,@"message":self.mestextfield.text}];
    }
    return YES;
}

#pragma mark - 系统相册
-(void)openimagevc{

     [[NSNotificationCenter defaultCenter]postNotificationName:@"postopenimgvc" object:nil userInfo:nil];
}
#pragma mark - 用户道具
-(void)openpagvc{
  [[NSNotificationCenter defaultCenter]postNotificationName:@"postopenpagvc" object:nil userInfo:nil];
}
@end
