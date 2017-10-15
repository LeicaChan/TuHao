//
//  UserViewController.m
//  FanFan
//
//  Created by 陈世杰 on 17/9/3.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "UserViewController.h"
#import "TCapi.h"
#import "UIKit+AFNetworking.h"
@interface UserViewController ()
@property (weak, nonatomic) IBOutlet UIButton *touxiangbtn;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *haoqilabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipimageview;
@property (weak, nonatomic) IBOutlet UILabel *zuijinlabel;
@property (weak, nonatomic) IBOutlet UILabel *guanzhulabel;
@property (weak, nonatomic) IBOutlet UILabel *fensilabel;
@property (weak, nonatomic) IBOutlet UIScrollView *userscrolleview;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadLine];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
-(void)viewDidAppear:(BOOL)animated{
    self.touxiangbtn.layer.masksToBounds = YES;
    self.touxiangbtn.layer.cornerRadius = self.touxiangbtn.frame.size.width/2;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeID:(UITapGestureRecognizer *)sender {
    NSLog(@"改变id");
}
- (IBAction)chagetoux:(UIButton *)sender {
        NSLog(@"改变头像");
}
-(void)reloadLine{
    CGRect frame = [UIScreen mainScreen].bounds;
    self.userscrolleview.contentSize = CGSizeMake(frame.size.width, 300);
    NSArray *namearr = @[@"购买会员",@"我的帖子",@"我的粉丝",@"我的关注",@"退出登陆"];
    for(int i = 0 ;i<5;i++){
        UIButton *button =  [[UIButton alloc]initWithFrame:CGRectMake(0, i*54, frame.size.width, 54)];
        [button setTitle:namearr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        button.tag = i;
        
        [button addTarget:self action:@selector(actionbutton:) forControlEvents:UIControlEventTouchUpInside];
        UIView *line  = [[UIView alloc]initWithFrame:CGRectMake(10, 53, frame.size.width-20, 1)];
        line.backgroundColor = [UIColor lightGrayColor];
        [button addSubview:line];
        [self.userscrolleview addSubview:button];
        
    }
}
-(void)actionbutton:(UIButton*)btn{
    switch (btn.tag) {
        case 0:
            NSLog(@"购买会员");
            break;
        case 1:
                      NSLog(@"我的帖子");
            break;
        case 2:
                      NSLog(@"我的粉丝");
            break;
        case 3:
                      NSLog(@"我的关注");
            break;
        default:
                      NSLog(@"退出登陆");
            break;
    }
}
#pragma mark - 获取 userinfo
-(void)requstuserinfo{
    
    if(   [UIApplication sharedApplication].networkActivityIndicatorVisible == YES){
        return;
    }
       [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [[TCapi share]requstUeserinfoandcallback:^(id obj) {

        if([obj objectForKey:@"errorload"]){
            NSLog(@"数据请求失败");
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"服务器异常，请稍后尝试" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action1  = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alert addAction:action1];
                
                [self presentViewController:alert animated:YES completion:^{
                    
                }];
                
            });
        }
        else{
            int code = [[obj objectForKey:@"code"] intValue];
            if(code == 1){
                
                
                NSLog(@"请求成功");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    NSDictionary *dic = [obj objectForKey:@"data"];
                    [[TCapi share].userinfo setdic:dic];
                    [self.touxiangbtn setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:[TCapi share].userinfo.touxiangurl] placeholderImage:[UIImage imageNamed:@"tuhao_touxiang.png"]];
                    self.namelabel.text = [TCapi share].userinfo.touxiangname;
                    self.haoqilabel.text = [TCapi share].userinfo.haoqi;
                    switch ([[TCapi share].userinfo.viptype intValue]) {
                        case 0:
                            self.vipimageview.hidden = YES;
                            self.namelabel.textColor = [UIColor whiteColor];
                            break;
                        case 1:
                            self.vipimageview.hidden = NO;
                            self.vipimageview.image = [UIImage imageNamed:@"tuhao_user_zijun.png"];
                            self.namelabel.textColor = [UIColor colorWithRed:241.0/255.0 green:107.0/255.0 blue:109.0/255.0 alpha:1.0];
                            break;
                        case 2:
                            self.vipimageview.hidden = NO;
                            self.vipimageview.image = [UIImage imageNamed:@"tuhao_vip_bojue.png"];
                                        self.namelabel.textColor = [UIColor colorWithRed:241.0/255.0 green:107.0/255.0 blue:109.0/255.0 alpha:1.0];
                            break;
                        case 3:
                            self.vipimageview.hidden = NO;
                            self.vipimageview.image = [UIImage imageNamed:@"tuhao_user_houjue.png"];
                                        self.namelabel.textColor = [UIColor colorWithRed:241.0/255.0 green:107.0/255.0 blue:109.0/255.0 alpha:1.0];
                            break;
                        case 4:
                            self.vipimageview.hidden = NO;
                            self.vipimageview.image = [UIImage imageNamed:@"tuhao_user_gongjue.png"];
                             self.namelabel.textColor = [UIColor colorWithRed:241.0/255.0 green:107.0/255.0 blue:109.0/255.0 alpha:1.0];
                            break;
                        case 5:
                            self.vipimageview.hidden = NO;
                            self.vipimageview.image = [UIImage imageNamed:@"tuhao_user_wangjue.png"];
                                        self.namelabel.textColor = [UIColor colorWithRed:241.0/255.0 green:107.0/255.0 blue:109.0/255.0 alpha:1.0];
                            break;

                        default:
                            self.vipimageview.hidden = NO;
                            self.vipimageview.image = [UIImage imageNamed:@"tuhao_user_zhizun.png"];
                                        self.namelabel.textColor = [UIColor colorWithRed:241.0/255.0 green:107.0/255.0 blue:109.0/255.0 alpha:1.0];
                            break;
                    }
                    self.zuijinlabel.text = [TCapi share].userinfo.zuijintie;
                     self.guanzhulabel.text = [TCapi share].userinfo.guanzhunum;
                     self.fensilabel.text = [TCapi share].userinfo.fensinum;
                });
                
                
                
                
                
            }
            
            else{
                printf("失败");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"服务器异常，请稍后尝试" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *action1  = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                        
                    }];
                    [alert addAction:action1];
                    
                    [self presentViewController:alert animated:YES completion:^{
                        
                    }];
                    
                    
                });
                
                
            }
            
        }
        
    }];

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
