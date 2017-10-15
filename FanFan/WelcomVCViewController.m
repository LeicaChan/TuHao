//
//  WelcomVCViewController.m
//  FanFan
//
//  Created by lewei on 17/6/23.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "WelcomVCViewController.h"
#import "ViewController.h"
#import "TCapi.h"
#import "LoginViewController.h"
@interface WelcomVCViewController ()


//动画开关
@property(nonatomic,assign)BOOL anmi;
@end

@implementation WelcomVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.anmi = NO;
    //应用初始化
    [[TCapi share]setItemsAdress:@"192.168.2.107" AndKey:@""];
      // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(self.anmi==NO){
        //免登录
        if([[TCapi share].userinfo.access_token isEqualToString:@""]){
            LoginViewController *vc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
        else{
            UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *homevc = [stryBoard instantiateViewControllerWithIdentifier:@"ViewController"];
            [self presentViewController:homevc animated:YES completion:^{
                
            }];
        }
    }

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)moveaction{
    self.anmi = YES;
//    self.fanfanlabel.layer.anchorPoint = CGPointMake(0.5, 0);
//    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    //角度转弧度（这里用1，-1简单处理一下）
//    rotationAnimation.toValue = [NSNumber numberWithFloat:1];
//    rotationAnimation.fromValue = [NSNumber numberWithFloat:-1];
//    rotationAnimation.duration = 1.0f;
//    rotationAnimation.repeatCount = MAXFLOAT;
//    rotationAnimation.removedOnCompletion = NO;
//    rotationAnimation.autoreverses = YES;
//    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    rotationAnimation.fillMode = kCAFillModeForwards;
//    [self.fanfanlabel.layer addAnimation:rotationAnimation forKey:@"revItUpAnimation"];
//    
//        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(movediss) userInfo:nil repeats:NO];
}
//-(void)movediss{
//    CGRect frame = self.movelabel.frame;
//    [UIView animateWithDuration:0.5 animations:^{
//        self.movelabel.frame = CGRectMake(frame.origin.x-45, frame.origin.y, frame.size.width, frame.size.height);
//        self.movelabel.text = @"没想好广告语";
//            CGRect frame1 = self.movelabel.frame;
//    } completion:^(BOOL finished) {
//       [UIView animateWithDuration:0.5 animations:^{
//           self.movelabel.frame = CGRectMake(frame.origin.x-45, frame.origin.y, frame.size.width, frame.size.height);
//           self.movelabel.text = @"没想好广告语-创始人陈世杰 513054106@qq.com";
//       } completion:^(BOOL finished) {
//           self.anmi = NO;
//       }];
//    }];
//}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.anmi==NO){
        //免登录
        if([[TCapi share].userinfo.access_token isEqualToString:@""]){
            LoginViewController *vc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
        else{
         UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *homevc = [stryBoard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self presentViewController:homevc animated:YES completion:^{
            
        }];
        }
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
