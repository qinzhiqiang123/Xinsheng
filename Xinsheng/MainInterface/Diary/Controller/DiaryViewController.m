//
//  DiaryViewController.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "DiaryViewController.h"
#import "DiaryView.h"
#import "SecondayViewController.h"
@interface DiaryViewController ()

@end

@implementation DiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DiaryView *diarView =[[DiaryView alloc]initWithFrame:self.view.bounds];
    [diarView showDiaryBlock:^(NSString *sender) {
        SecondayViewController *secVc=[[SecondayViewController alloc]init];
        secVc.title=sender;
        [self.navigationController pushViewController:secVc animated:YES];
    }];
    [self.view addSubview:diarView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
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
