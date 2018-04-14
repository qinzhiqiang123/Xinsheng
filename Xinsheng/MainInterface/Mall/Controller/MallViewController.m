//
//  MallViewController.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "MallViewController.h"
#import "MallView.h"
#import "ProductDetailViewController.h"
@interface MallViewController ()
@end

@implementation MallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    MallView *mallView =[[MallView alloc]initWithFrame:self.view.bounds];
    [mallView showMallBlock:^(id sender) {
        ProductDetailViewController *proVc =[[ProductDetailViewController alloc]init];
        [self.navigationController pushViewController:proVc animated:YES];
    }];
    [self.view addSubview:mallView];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
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
