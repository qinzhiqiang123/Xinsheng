//
//  FirstViewController.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstView.h"
#import "SecondayViewController.h"
#import "JFCityViewController.h"
@interface FirstViewController ()<JFCityViewControllerDelegate>

@property (nonatomic,strong)FirstView *firstView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBarController.navigationItem.title=@"首页";
    self.firstView =[[FirstView alloc]initWithFrame:self.view.bounds];
    [self.firstView showFirstBlock:^(NSString *sender) {
        NSLog(@"sadasdasd:%@",sender);
        if ([sender isEqualToString:@"城市"]) {
            JFCityViewController *cityViewController = [[JFCityViewController alloc] init];
            //  设置代理
            cityViewController.delegate = self;
            cityViewController.title = sender;
            //  给JFCityViewController添加一个导航控制器
            cityViewController.navigationController.navigationBarHidden=NO;
            [self.navigationController pushViewController:cityViewController animated:YES];
        }else{
            SecondayViewController *secVc=[[SecondayViewController alloc]init];
            secVc.title=sender;
            [self.navigationController pushViewController:secVc animated:YES];
        }
    }];
    [self.view addSubview:self.firstView];

    // Do any additional setup after loading the view.
}

- (void)cityName:(NSString *)name {
    //code...
    NSLog(@"dsasda:%@",name);
    [self.firstView.addressButton setTitle:name forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
}

//-(void)viewWillDisappear:(BOOL)animated{
//     self.navigationController.navigationBarHidden=NO;
//}


-(void)anButtonClick:(UIButton *)sender{
   
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
