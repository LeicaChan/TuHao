//
//  SearchViewController.m
//  FanFan
//
//  Created by 陈世杰 on 17/9/3.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchItesViewController.h"

@interface SearchViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tiezitextfield;
@property (weak, nonatomic) IBOutlet UITextField *idtetfiled;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)backaction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)searchtiezi:(UIButton *)sender {
    NSLog(@"搜索帖子");
    [self.tiezitextfield resignFirstResponder];
    if(self.tiezitextfield.text.length>0){
        
        UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SearchItesViewController *searchvc = [stryBoard instantiateViewControllerWithIdentifier:@"SearchItesViewController"];
        [self presentViewController:searchvc animated:YES completion:^{
            
        }];

    }
}
- (IBAction)searchID:(UIButton *)sender {
    NSLog(@"搜索ID");
    [self.idtetfiled resignFirstResponder];
    if(self.idtetfiled.text.length>0){
        
        UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SearchItesViewController *searchvc = [stryBoard instantiateViewControllerWithIdentifier:@"SearchItesViewController"];
        [self presentViewController:searchvc animated:YES completion:^{
            
        }];
        
    }

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.tiezitextfield){
        [self.tiezitextfield resignFirstResponder];
           NSLog(@"搜索帖子");
        if(self.tiezitextfield.text.length>0){
            
            UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SearchItesViewController *searchvc = [stryBoard instantiateViewControllerWithIdentifier:@"SearchItesViewController"];
            [self presentViewController:searchvc animated:YES completion:^{
                
            }];
            
        }

    }
    else{
        [self.idtetfiled resignFirstResponder];
            NSLog(@"搜索id");
        if(self.idtetfiled.text.length>0){
            
            UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SearchItesViewController *searchvc = [stryBoard instantiateViewControllerWithIdentifier:@"SearchItesViewController"];
            [self presentViewController:searchvc animated:YES completion:^{
                
            }];
            
        }
        
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
