//
//  MyAnnotationView.m
//  Day16Map
//
//  Created by tarena on 15-4-1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyAnnotationView.h"

@implementation MyAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
//        
        self.image = [UIImage imageNamed:@"nilpng.png"];
        self.touxiang = [[UIImageView alloc]initWithFrame:CGRectMake(21, 6, 28, 28)];
        self.touxiang.layer.cornerRadius = self.touxiang.frame.size.width/2;
        self.touxiang.layer.masksToBounds = YES;
        self.touxiang.userInteractionEnabled = YES;
        [self addSubview:self.touxiang];
        
              UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 5, 30, 35)];
        imageview.image = [UIImage imageNamed:@"map_usertouxiang.png"];
        imageview.userInteractionEnabled = YES;
        [self addSubview:imageview];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionpost)];
        [imageview addGestureRecognizer:tap];
        
    }
    return self;
}
-(void)actionpost{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"postclose" object:nil userInfo:nil];
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
