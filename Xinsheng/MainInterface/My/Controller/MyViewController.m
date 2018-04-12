//
//  MyViewController.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "MyViewController.h"
#import "MyView.h"
//登录
#import "LoginViewController.h"
//积分
#import "IntegralViewController.h"
//我的回答
#import "MyAnswerViewController.h"
//我的帖子
#import "MyPostsViewController.h"
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyView *myView =[[MyView alloc]initWithFrame:self.view.bounds];
    [myView showBlock:^(NSString *sender) {
        if ([sender isEqualToString:@"登录/注册"]) {
            LoginViewController *loginVc= [[LoginViewController alloc]init];
            [self.navigationController pushViewController:loginVc animated:YES];
        }else if ([sender isEqualToString:@"我的积分"])
        {
            IntegralViewController *interVc= [[IntegralViewController alloc]init];
            [self.navigationController pushViewController:interVc animated:YES];
        }else if ([sender isEqualToString:@"我的回答"])
        {
            MyAnswerViewController *myAnswerVc= [[MyAnswerViewController alloc]init];
            [self.navigationController pushViewController:myAnswerVc animated:YES];
        }else if ([sender isEqualToString:@"我的帖子"])
        {
            MyPostsViewController *myPostVc= [[MyPostsViewController alloc]init];
            [self.navigationController pushViewController:myPostVc animated:YES];
        }
        
        
    }];
    [self.view addSubview:myView];
    // Do any additional setup after loading the view.
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
