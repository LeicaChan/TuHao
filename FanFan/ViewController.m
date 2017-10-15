//
//  ViewController.m
//  FanFan
//
//  Created by lewei on 17/6/23.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "ViewController.h"
#import "TCapi.h"
#import "SearchViewController.h"
#import "MessageViewController.h"
#import "UserViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
//关注
@property (weak, nonatomic) IBOutlet UIButton *guanzhubtn;
//推荐
@property (weak, nonatomic) IBOutlet UIButton *tuijianbtn;
@property (weak, nonatomic) IBOutlet UIImageView *indexview;

//主页
@property (weak, nonatomic) IBOutlet UIButton *homebtn;

@property (weak, nonatomic) IBOutlet UIButton *personbtn;
@property(nonatomic,strong) UserViewController *uservc;
//数据源数组
//关注数组
@property(nonatomic,strong)NSMutableArray *arr;
//推荐数组
@property(nonatomic,strong)NSMutableArray *tuijianarr;

//关注列表
@property(nonatomic,strong)UITableView *guanzhutablview;
//推荐列表
@property(nonatomic,strong)UITableView *tuijiantableview;
@end

@implementation ViewController
-(NSMutableArray *)arr{
    if(!_arr){
        _arr = [NSMutableArray array];
    }
    return _arr;
}
-(NSMutableArray *)tuijianarr{
    if(!_tuijianarr){
        _tuijianarr = [NSMutableArray array];
    }
    return _tuijianarr;
}


#pragma mark - 控制器初始化
-(void)UIalode{
 
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self requstserver];

    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = [UIScreen mainScreen].bounds;
    self.guanzhubtn.selected = YES;
    UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.uservc = [stryBoard instantiateViewControllerWithIdentifier:@"UserViewController"];

    self.uservc.view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height-84);
    [self.view addSubview:self.uservc.view];
    self.uservc.view.hidden = YES;
    

    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - NAVI
- (IBAction)searchaction:(UIButton *)sender {
    NSLog(@"打开搜索");
    UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SearchViewController *searchvc = [stryBoard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self presentViewController:searchvc animated:YES completion:^{
        
    }];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}
- (IBAction)messageaction:(UIButton *)sender {
    NSLog(@"打开消息");
    
    UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MessageViewController *searchvc = [stryBoard instantiateViewControllerWithIdentifier:@"MessageViewController"];
    [self presentViewController:searchvc animated:YES completion:^{
        
    }];

}

- (IBAction)homeaction:(id)sender {

    if(self.homebtn.selected == YES){
        return;
    }
        NSLog(@"打开主页");
    self.homebtn.selected = YES;
    self.personbtn.selected = NO;;
    self.uservc.view.hidden = YES;
    
}

- (IBAction)personaction:(UIButton *)sender {

    if(self.personbtn.selected == YES){
        return;
    }
      NSLog(@"打开用户");
    self.personbtn.selected = YES;
    self.homebtn.selected = NO;;
        self.uservc.view.hidden = NO;
    [self.uservc performSelector:@selector(requstuserinfo) withObject:nil afterDelay:0.5];
}
- (IBAction)guanzhuactin:(UIButton *)sender {

    if(self.guanzhubtn.selected == YES){
        return;
    }
    self.guanzhubtn.selected = YES;
    self.tuijianbtn.selected = NO;
        NSLog(@"关注");
    [UIView animateWithDuration:0.5 animations:^{
        self.indexview.frame = CGRectMake(self.guanzhubtn.frame.origin.x, self.indexview.frame.origin.y, 46, 2);
    }];
}
- (IBAction)tuiianaction:(UIButton *)sender {

    if(self.tuijianbtn.selected == YES){
        return;
    }
    self.tuijianbtn.selected = YES;
    self.guanzhubtn.selected = NO;
    NSLog(@"推荐");
    [UIView animateWithDuration:0.5 animations:^{
        self.indexview.frame = CGRectMake(self.tuijianbtn.frame.origin.x, self.indexview.frame.origin.y, 46, 2);
    }];
}

#pragma mark - 数据请求
-(void)requstserver{
                   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [[TCapi share] requstMetadata:@"1" Andoffset:@"0" Andlimit:@"1000" andcallback:^(id obj) {
        NSLog(@"%@",obj);
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
//                    //用户头像url
//                    @property(nonatomic,strong)NSString *touxiangurl;
//                    //用户昵称
//                    @property(nonatomic,strong)NSString *touxiangname;
//                    //豪气值
//                    @property(nonatomic,strong)NSString *haoqi;
//                    //vip类型
//                    @property(nonatomic,strong)NSString *viptype;
//                    //最近帖子
//                    @property(nonatomic,strong)NSString *zuijintie;
//                    //关注数
//                    @property(nonatomic,strong)NSString *guanzhunum;
//                    //粉丝数
//                    @property(nonatomic,strong)NSString *fensinum;
                    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
