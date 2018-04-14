//
//  MyPostsViewController.m
//  Xinsheng
//
//  Created by Simson on 2018/4/12.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "MyPostsViewController.h"
//我发布的
#import "MyPostedViewController.h"
//我评论的
#import "MyCommentedViewController.h"
@interface MyPostsViewController ()

@property (nonatomic, strong) NinaPagerView *ninaPagerView;

@end

@implementation MyPostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的帖子";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ninaPagerView];
    
    // Do any additional setup after loading the view.
}

- (NSArray *)ninaTitleArray {
    return @[
             @"我发布的",
             @"我评论的"
             ];
}

- (NSArray *)ninaVCsArray {
    return @[
             @"MyPostedViewController",
             @"MyCommentedViewController"
             ];
}


#pragma mark - LazyLoad
- (NinaPagerView *)ninaPagerView {
    if (!_ninaPagerView) {
        NSArray *titleArray = [self ninaTitleArray];
        NSArray *vcsArray = [self ninaVCsArray];
        /**
         *  创建ninaPagerView，控制器第一次是根据您划的位置进行相应的添加的，类似网易新闻虎扑看球等的效果，后面再滑动到相应位置时不再重新添加，如果想刷新数据，您可以在相应的控制器里加入刷新功能。需要注意的是，在创建您的控制器时，设置的frame为FUll_CONTENT_HEIGHT，即全屏高减去导航栏高度，如果这个高度不是您想要的，您可以去在下面的frame自定义设置。
         *  A tip you should know is that when init the VCs frames,the default frame i set is FUll_CONTENT_HEIGHT,it means fullscreen height - NavigationHeight - TabbarHeight.If the frame is not what you want,just set frame as you wish.
         */
        CGRect pagerRect = CGRectMake(0, getRectNavAndStatusHight, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        _ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithObjects:vcsArray];
        
        _ninaPagerView.selectTitleColor=[UIColor redColor];
        _ninaPagerView.ninaPagerStyles = NinaPagerStyleBottomLine;
    }
    return _ninaPagerView;
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
