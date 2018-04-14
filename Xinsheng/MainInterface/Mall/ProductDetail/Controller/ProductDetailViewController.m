//
//  ProductDetailViewController.m
//  Xinsheng
//
//  Created by Simson on 2018/4/13.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductDetailView.h"
@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    ProductDetailView *productView =[[ProductDetailView alloc]initWithFrame:self.view.bounds];
    [productView showProductBack:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [productView showProductDetailBack:^(NSString *sender) {
        if ([sender isEqualToString:@"在线咨询"]) {
            RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
            conversationVC.conversationType = 1;
            conversationVC.targetId =@"1234567";
            conversationVC.title = @"官方客服";
            [self.navigationController pushViewController:conversationVC animated:YES];
        }else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"正在生成订单" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    }];
    [self.view addSubview:productView];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated{
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
