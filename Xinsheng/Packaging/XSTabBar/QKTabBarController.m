//
//  QKTabBarController.m
//  NewOxygen
//
//  Created by 秦志强 on 2017/12/1.
//  Copyright © 2017年 秦志强. All rights reserved.
//

#import "QKTabBarController.h"
#import "QKNavigationController.h"
#import "FirstViewController.h"
#import "DiaryViewController.h"
#import "HospitalViewController.h"
#import "MallViewController.h"
#import "MyViewController.h"

@interface QKTabBarController ()<UITabBarControllerDelegate>
{
//    ReadWriteView *_readView;
}
@end

@implementation QKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVc:[[FirstViewController alloc] init] title:@"首页" image:@"tabBar_first" selectedImage:@"tabBar_first_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[DiaryViewController alloc] init] title:@"社区" image:@"tabBar_fx" selectedImage:@"tabBar_fx_click" isHiddenNavgationBar:NO];
//    [self setupChildVc:[[HospitalViewController alloc] init] title:@"" image:@"plus" selectedImage:@"" isHiddenNavgationBar:NO];
        [self setupChildVc:[[HospitalViewController alloc] init] title:@"咨询" image:@"tabBar_zx" selectedImage:@"tabBar_zx_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[MallViewController alloc] init] title:@"商城" image:@"tabBar_axg" selectedImage:@"tabBar_axg_click" isHiddenNavgationBar:NO];
//  个人
    [self setupChildVc:[[MyViewController alloc] init] title:@"我的" image:@"tabBar_my" selectedImage:@"tabBar_my_click" isHiddenNavgationBar:NO];

    
    self.delegate = self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
//    if (self.indexFlag != index) {
        [self animationWithIndex:index];
//    }
    NSLog(@"点击的item:%ld title:%@", item.tag, item.title);
    if (item.tag ==2) {
        
    }
}


// 动画
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
//    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pulse.duration = 0.08;
//    pulse.repeatCount= 1;
//    pulse.autoreverses= YES;
//    pulse.fromValue= [NSNumber numberWithFloat:0.7];
//    pulse.toValue= [NSNumber numberWithFloat:1.3];
//    [[tabbarbuttonArray[index] layer]
//     addAnimation:pulse forKey:nil];
    
    
    //需要实现的帧动画,这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.calculationMode = kCAAnimationCubic;
    //把动画添加上去就OK了
    [[tabbarbuttonArray[index] layer]
     addAnimation:animation forKey:nil];
    
//    self.indexFlag = index;
    
}


//
//for (UIView *imageView in tabBarController.view.subviews) {
//    if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
//
//    }
//}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSLog(@"%s",__FUNCTION__);


//    if (viewController ==self.viewControllers[2]) {
//         [self show];
////        if (_readView==nil) {
//////            _readView=[[ReadWriteView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//////            [_readView showReadBlock:^(id sender) {
//////                _readView.hidden=YES;
//////            }];
//////            [self.view addSubview:_readView];
////
//////            viewController.edgesForExtendedLayout = UIRectEdgeNone;
//////            viewController.extendedLayoutIncludesOpaqueBars = YES;
//////            viewController=viewController.presentedViewController;
//////            viewController.tabBarItem
//////            [self.view bringSubviewToFront:viewController.view];
////        }else{
////            _readView.hidden=NO;
////        }
////         viewController.tabBarItem.image = [[UIImage imageNamed:@"tabBar_axg_click"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
//        return NO;
//
//    }
    return YES;
}



-(void)show{
//    BHBItem * item0 = [[BHBItem alloc]initWithTitle:@"Text" Icon:@"images.bundle/tabbar_compose_idea"];
//    BHBItem * item1 = [[BHBItem alloc]initWithTitle:@"Albums" Icon:@"images.bundle/tabbar_compose_photo"];
//    BHBItem * item2 = [[BHBItem alloc]initWithTitle:@"Camera" Icon:@"images.bundle/tabbar_compose_camera"];
    //第4个按钮内部有一组
//    BHBGroup * item3 = [[BHBGroup alloc]initWithTitle:@"Check in" Icon:@"images.bundle/tabbar_compose_lbs"];
//    BHBItem * item31 = [[BHBItem alloc]initWithTitle:@"Friend Circle" Icon:@"images.bundle/tabbar_compose_friend"];
//    BHBItem * item32 = [[BHBItem alloc]initWithTitle:@"Weibo Camera" Icon:@"images.bundle/tabbar_compose_wbcamera"];
//    BHBItem * item33 = [[BHBItem alloc]initWithTitle:@"Music" Icon:@"images.bundle/tabbar_compose_music"];
//    item3.items = @[item31,item32,item33];
//
//    BHBItem * item4 = [[BHBItem alloc]initWithTitle:@"Review" Icon:@"images.bundle/tabbar_compose_review"];
//
//    //第六个按钮内部有一组
//    BHBGroup * item5 = [[BHBGroup alloc]initWithTitle:@"More" Icon:@"images.bundle/tabbar_compose_more"];
//    BHBItem * item51 = [[BHBItem alloc]initWithTitle:@"Friend Circle" Icon:@"images.bundle/tabbar_compose_friend"];
//    BHBItem * item52 = [[BHBItem alloc]initWithTitle:@"Weibo Camera" Icon:@"images.bundle/tabbar_compose_wbcamera"];
//    BHBItem * item53 = [[BHBItem alloc]initWithTitle:@"Music" Icon:@"images.bundle/tabbar_compose_music"];
//    BHBItem * item54 = [[BHBItem alloc]initWithTitle:@"Blog" Icon:@"images.bundle/tabbar_compose_weibo"];
//    BHBItem * item55 = [[BHBItem alloc]initWithTitle:@"Collection" Icon:@"images.bundle/tabbar_compose_transfer"];
//    BHBItem * item56 = [[BHBItem alloc]initWithTitle:@"Voice" Icon:@"images.bundle/tabbar_compose_voice"];
//    item5.items = @[item51,item52,item53,item54,item55,item56];
    
    
    //添加popview
//    [BHBPopView showToView:self.view.window withItems:@[item0,item1,item2]andSelectBlock:^(BHBItem *item) {
//        if ([item isKindOfClass:[BHBGroup class]]) {
//            NSLog(@"选中%@分组",item.title);
//        }else{
//            NSLog(@"选中%@项",item.title);
//        }
//    }];
}


- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage isHiddenNavgationBar:(BOOL)isHidden
{
    static NSInteger index = 0;
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    if(index==2){
//        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
//        vc.tabBarItem.selectedImage.imageAsset=UIEdgeInsetsMake(8, 5, 2, 5);
//    }
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    vc.tabBarItem.tag = index;
    index++;
    
    QKNavigationController *nav;
//    = [[QKNavigationController alloc] initWithRootViewController:vc];
//    if ([title isEqualToString:@""]) {
//        nav= [[QKNavigationController alloc] init];
//    }else{
        nav= [[QKNavigationController alloc] initWithRootViewController:vc];
//    }
    if (isHidden) {
        nav.navigationBar.hidden = YES;
    }
    
    [self addChildViewController:nav];
}



// 支持设备自动旋转
- (BOOL)shouldAutorotate
{
    return NO;
}

+ (void)initialize
{
    //设置未选中的TabBarItem的字体颜色、大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] =[UIColor colorWithHexString:@"#333333"];
    
    
    //设置选中了的TabBarItem的字体颜色、大小
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#ce7667"];
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
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
