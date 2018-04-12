//
//  XSMainTabBarViewController.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "XSMainTabBarViewController.h"

#import "MyViewController.h"
#import "MallViewController.h"
#import "HospitalViewController.h"
#import "DiaryViewController.h"
#import "FirstViewController.h"

@interface XSMainTabBarViewController ()

@property NSUInteger previousIndex;

@end

@implementation XSMainTabBarViewController


+ (XSMainTabBarViewController *)shareInstance {
    static XSMainTabBarViewController *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setControllers];
    [self setTabBarItems];
    // Do any additional setup after loading the view.
}



- (void)setControllers {
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    
    DiaryViewController *diaVC = [[DiaryViewController alloc] init];
    
    HospitalViewController *hosVC = [[HospitalViewController alloc] init];
    
    MallViewController *mallVC = [[MallViewController alloc] init];
    
    MyViewController *myVC = [[MyViewController alloc] init];
    
    self.viewControllers = @[ firstVC, diaVC, hosVC,mallVC,myVC ];
}


- (void)setTabBarItems {
    [self.viewControllers
     enumerateObjectsUsingBlock:^(__kindof UIViewController *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
         if ([obj isKindOfClass:[FirstViewController class]]) {
     
              [self VcSet:@"首页" :@"icon_chat_hover" :@"icon_chat" :obj];
         } else if ([obj isKindOfClass:[DiaryViewController class]]) {

              [self VcSet:@"商城" :@"contact_icon_hover" :@"contact_icon" :obj];
             
         } else if ([obj isKindOfClass:[HospitalViewController class]]) {

              [self VcSet:@"医院" :@"square_hover" :@"square" :obj];
             
         } else if ([obj isKindOfClass:[MallViewController class]]) {

             [self VcSet:@"商城" :@"icon_group_hover" :@"icon_group" :obj];
             
         }else if ([obj isKindOfClass:[MyViewController class]]) {
             
             [self VcSet:@"我的" :@"icon_me_hover" :@"icon_me" :obj];
             
         } else {
             NSLog(@"Unknown TabBarController");
         }
     }];
}

-(void)VcSet:(NSString *)titleStr:(NSString *)selectImage:(NSString *)imageStr:(UIViewController *)obj
{
    obj.tabBarItem.title = titleStr;
    obj.tabBarItem.image =
    [[UIImage imageNamed:imageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    obj.tabBarItem.selectedImage =
    [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    obj.tabBarController.navigationItem.title = titleStr;
    obj.view.backgroundColor=[UIColor whiteColor];
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
