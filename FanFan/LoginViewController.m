//
//  LoginViewController.m
//  FanFan
//
//  Created by 陈世杰 on 17/7/23.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "LoginViewController.h"
#import "TCapi.h"
#import "ViewController.h"
@interface LoginViewController ()
//logo
@property (weak, nonatomic) IBOutlet UIImageView *logoimage;
//手机号码
@property (weak, nonatomic) IBOutlet UITextField *iphonetextfield;
//密码
@property (weak, nonatomic) IBOutlet UITextField *passwordtextfeild;
//短信
@property (weak, nonatomic) IBOutlet UIButton *smsbtn;
@property (weak, nonatomic) IBOutlet UILabel *marklabel;
@property (weak, nonatomic) IBOutlet UILabel *copylabel;
@property (weak, nonatomic) IBOutlet UILabel *comlabel;
//状态文本
@property (weak, nonatomic) IBOutlet UILabel *typelabel;

//短信计时器
@property(nonatomic,assign)int smsnnumber;
@property(nonatomic,strong)NSTimer *timer;

//设备唯一表示
@property(nonatomic,strong)NSString *uuid;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //准备一组帧动画对象
//    UIImage *image = [UIImage animatedImageNamed:@"face" duration:1*21/16];
//    self.logoimage.image=image;
 

    //初始化设备数据
    self.smsnnumber = 61;

//    if let uid = WujilianApi.load(KEY_USERNAME_PASSWORD)  {
//        
//        self.uuid = uid.objectForKey(KEY_PASSWORD) as! String
//        
//    }
//    else{
//        let uuid = NSUUID().UUIDString;
//        
//        self.uuid = uuid
//        let usernamepasswordKVPairs = [KEY_PASSWORD:uuid]
//        WujilianApi.save(KEY_USERNAME_PASSWORD, data: usernamepasswordKVPairs)
//    }
    if([TCapi load:KEY_USERNAME_PASSWORD]){
        self.uuid = [[TCapi load:KEY_USERNAME_PASSWORD] objectForKey:KEY_PASSWORD];
    }
    else{
        self.uuid = [[NSUUID alloc]init].UUIDString;
        [TCapi save:KEY_USERNAME_PASSWORD data:@{KEY_PASSWORD:self.uuid}];
    }

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //监听键盘
    [self registerForKeyboardNotifications];
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    if([UIScreen mainScreen].bounds.size.height == 568){
        //5s
        self.iphonetextfield.font = [UIFont systemFontOfSize:15];
        self.passwordtextfeild.font =  [UIFont systemFontOfSize:15];
        self.passwordtextfeild.placeholder = @"";
        self.smsbtn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.marklabel.font = [UIFont systemFontOfSize:10];
        self.copylabel.hidden = YES;
        self.comlabel.hidden = YES;
    }
    else if([UIScreen mainScreen].bounds.size.height == 667){
        //7
        self.iphonetextfield.font = [UIFont systemFontOfSize:15];
        self.passwordtextfeild.font =  [UIFont systemFontOfSize:12];
        self.smsbtn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.marklabel.font = [UIFont systemFontOfSize:13];
        self.comlabel.hidden = YES;
        self.copylabel.hidden = YES;
    }
    else if([UIScreen mainScreen].bounds.size.height == 480){
        //4s
        self.iphonetextfield.font = [UIFont systemFontOfSize:15];
        self.passwordtextfeild.font =  [UIFont systemFontOfSize:12];
        self.smsbtn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.marklabel.font = [UIFont systemFontOfSize:10];
        self.passwordtextfeild.font =  [UIFont systemFontOfSize:15];
        self.passwordtextfeild.placeholder = @"";
        self.comlabel.hidden = YES;
        self.copylabel.hidden = YES;
    }
    else{
        //puls以上
    }
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //注销键盘通知
    [self relseskeyboti];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 数据检查
//手机号码判定
-(BOOL)checkprefixhaoma{
    NSArray *arr = @[@"134",@"135",@"136",@"137",@"138",@"139",@"150",@"151",@"152",@"157",@"158",@"159",@"187",@"188",@"130",@"131",@"132",@"155",@"156",@"185",@"186",@"133",@"153",@"180",@"189",@"183",@"181"];
    
    for(NSString *item in arr){
        if  ([self.iphonetextfield.text hasPrefix:item]&&self.iphonetextfield.text.length == 11){
            return YES;
        }
        
    }
    return NO;
    
    
}

#pragma mark - 控件响应事件
//获取验证码
- (IBAction)smsaction:(UIButton *)sender {
    
    if([self.smsbtn.titleLabel.text isEqualToString:@"获取验证码"]){
        if([self   checkprefixhaoma]&&[UIApplication sharedApplication].isNetworkActivityIndicatorVisible == NO){
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            self.typelabel.text = @"";
            [[TCapi share]requstduanxin:self.iphonetextfield.text andcallback:^(id obj) {
                NSLog(@"%@",obj);
                if([obj objectForKey:@"errorload"]){
                    NSLog(@"获取短信失败");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                        self.typelabel.text = @"系统异常,请稍后再试";
                        
                    });
                }
                else{
                    int code = [[obj objectForKey:@"code"] intValue];
                    if(code == 1){
                        
                        
                        NSLog(@"获取短信成功");
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                            self.typelabel.text = [obj objectForKey:@"msg"];
                            //开启60秒计时
                            if(!self.timer){
                                self.timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checksms) userInfo:nil repeats:YES];
                            }
                            
                        });
                        
                
                        
                        
                        
                    }
                    
                    else{
                        printf("失败");
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                            self.typelabel.text = [obj objectForKey:@"msg"];
                            
                        });
                        
                        
                    }
                    
                }
                
            }];
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.typelabel.text = @"请输入正确的手机号码";
                
            });
        }

        
    }
    else{
        dispatch_async(dispatch_get_main_queue(), ^{
         
            self.typelabel.text = @"请等待一分钟后重发验证码";
            
        });

    }
   
}
//短信检测
-(void)checksms{
    self.smsnnumber = self.smsnnumber - 1;
    if(self.smsnnumber>0){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.smsbtn setTitle:[NSString stringWithFormat:@"%d秒后重发",self.smsnnumber] forState:UIControlStateNormal];
        });
        
    }
    else{
        [self.timer invalidate];
        self.timer = nil;
        self.smsnnumber = 61;
        [self.smsbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }

}
//登录
- (IBAction)loading:(UIButton *)sender {
    if([self   checkprefixhaoma]){
        self.typelabel.text = @"";
        if([UIApplication sharedApplication].networkActivityIndicatorVisible == NO){
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            [self.iphonetextfield  resignFirstResponder];
            [self.passwordtextfeild  resignFirstResponder];
            if([self.iphonetextfield.text isEqualToString:@""]||[self.passwordtextfeild.text isEqualToString:@""]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.typelabel.text = @"请输入完整用户名和密码";
                             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    return ;
                    
                });
                
                          }
            NSRange range = [self.iphonetextfield.text rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~#￥&*（）——+|《》$_€!"]];
            if(range.length >0){
                dispatch_async(dispatch_get_main_queue(), ^{
                       [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    self.typelabel.text = @"请勿输入特殊字符";
                    return ;
                    
                });
            }
            NSString *userPhoneName = [UIDevice currentDevice].name;
            dispatch_async(dispatch_get_main_queue(), ^{
            
                self.typelabel.text = @"登录中";
         
                
            });
            [[TCapi share]WujilianloadUsername:self.iphonetextfield.text AndPassWord:self.passwordtextfeild.text AndDeviceInfo:self.uuid AndDeviceName:userPhoneName AndDevicetype:@"3" AndCallback:^(id obj) {
                NSLog(@"%@",obj);
                if([obj objectForKey:@"errorload"]){
                    NSLog(@"登录失败");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                        self.typelabel.text = @"系统异常,请稍后再试";
                        
                    });
                }
                else{
                    int code = [[obj objectForKey:@"code"] intValue];
                    if(code == 1){
                        
                        
                        NSLog(@"登录成功");
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                            self.typelabel.text = [obj objectForKey:@"msg"];
                                                        //保存token
                            [TCapi share].userinfo.access_token = [[obj objectForKey:@"data"] objectForKey:@"access_token"];
                            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                            [ud setObject:[[obj objectForKey:@"data"] objectForKey:@"access_token"] forKey:@"token"];
                            [ud synchronize];
                                                        //显示主界面
                            [self performSelector:@selector(pushindexVC) withObject:nil afterDelay:0.5];
                        });
                        
                        
                        
                        
                        
                    }
                    
                    else{
                        printf("失败");
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                            self.typelabel.text = [obj objectForKey:@"msg"];
                            
                        });
                        
                        
                    }
                    
                }
                
            }];

        }


       
    }
    else{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.typelabel.text = @"请输入正确的手机号码";
            
        });
    }
}
//打开主界面
-(void)pushindexVC{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *homevc = [stryBoard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self presentViewController:homevc animated:YES completion:^{
            
        }];

        
        
    });
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //取消键盘响应
    if(self.iphonetextfield.isFirstResponder == YES){
        [self.iphonetextfield resignFirstResponder];
    }
    if(self.passwordtextfeild.isFirstResponder == YES){
        [self.passwordtextfeild resignFirstResponder];
    }
    CGRect frame = self.view.frame;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame =  CGRectMake(0, 0, frame.size.width, frame.size.height);
        
    }];

}

#pragma mark - 键盘通知

- (void)registerForKeyboardNotifications
{
    //使用NSNotificationCenter 鍵盤出現時
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShown:)
                                                 name:UIKeyboardWillChangeFrameNotification object:nil];
    //使用NSNotificationCenter 鍵盤隐藏時
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}
//注销键盘通知
-(void)relseskeyboti{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
     [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
//实现当键盘出现的时候计算键盘的高度大小。用于输入框显示位置
- (void)keyboardWillShown:(NSNotification*)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    
    //输入框位置动画加载
    CGRect frame = self.view.frame;
    [UIView animateWithDuration:duration animations:^{
        self.view.frame =  CGRectMake(0, -keyboardSize.height/2, frame.size.width, frame.size.height);
    }];
}
- (void)keyboardWillBeHidden:(NSNotification*)aNotification{
    NSDictionary *info = [aNotification userInfo];
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect frame = self.view.frame;
    [UIView animateWithDuration:duration animations:^{
        self.view.frame =  CGRectMake(0, 0, frame.size.width, frame.size.height);

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
