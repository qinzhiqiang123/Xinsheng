//
//  InvitedMeViewController.m
//  Xinsheng
//
//  Created by Simson on 2018/4/12.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "InvitedMeViewController.h"

@interface InvitedMeViewController ()

@end

@implementation InvitedMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *tsLabel =[[UILabel alloc]initWithFrame:self.view.bounds];
    tsLabel.text=@"您暂时没有邀请解答";
    tsLabel.textColor=[UIColor blackColor];
    tsLabel.font=[UIFont systemFontOfSize:15];
    tsLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:tsLabel];
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
