//
//  XSMainTabBarViewController.h
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSMainTabBarViewController : UITabBarController<UITabBarControllerDelegate>

+(XSMainTabBarViewController *)shareInstance;

@property (nonatomic,assign) NSUInteger selectedTabBarIndex;

@end
