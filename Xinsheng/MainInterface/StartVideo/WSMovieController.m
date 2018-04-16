//
//  WSMovieController.m
//  NewOxygen
//
//  Created by 秦志强 on 2018/1/5.
//  Copyright © 2018年 秦志强. All rights reserved.
//

#import "WSMovieController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface WSMovieController ()
@property (strong, nonatomic) MPMoviePlayerController *player;
@end

@implementation WSMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self SetupVideoPlayer];
}


- (void)SetupVideoPlayer
{
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:_movieURL];
    [self.view addSubview:self.player.view];
    self.player.shouldAutoplay = YES;
    [self.player setControlStyle:MPMovieControlStyleNone];
    self.player.repeatMode = MPMovieRepeatModeOne;
    [self.player.view setFrame:[UIScreen mainScreen].bounds];
    self.player.view.alpha = 0;
    [UIView animateWithDuration:3 animations:^{
        self.player.view.alpha = 1;
        [self.player prepareToPlay];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    
    [self setupLoginView];
}

- (void)setupLoginView
{
    //进入按钮
    UIButton *enterMainButton = [[UIButton alloc] init];
    enterMainButton.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    enterMainButton.layer.borderWidth = 1;
    enterMainButton.layer.cornerRadius = 24;
    enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    enterMainButton.alpha = 0;
    [self.player.view addSubview:enterMainButton];
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [UIView animateWithDuration:3.0 animations:^{
        enterMainButton.alpha = 1.0;
    }];
}

#pragma mark - NSNotificationCenter
- (void)playbackStateChanged
{
    MPMoviePlaybackState playbackState = [self.player playbackState];
    if (playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused) {
        [self.player play];
    }
}

-(void)showWsMoviewBlock:(wsMoview_block) wsMoBlock{
    _wsMoviewBlock=wsMoBlock;
}

- (void)enterMainAction:(UIButton *)btn {
    NSLog(@"进入应用");
    if (_wsMoviewBlock!=nil) {
        _wsMoviewBlock(@"进入首页");
    }
//    RootTabBarController *rootTabCtrl = [[RootTabBarController alloc]init];
//    self.view.window.rootViewController = rootTabCtrl;
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
