//
//  AppDelegate.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "AppDelegate.h"
#import "QKTabBarController.h"
#import "WSMovieController.h"
#define DEFAULTS [NSUserDefaults standardUserDefaults]

@interface AppDelegate ()<RCIMConnectionStatusDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.12312
   self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self RYIM:launchOptions];
    [self UM];
    
    /**
     * 推送处理1
     */
    if ([application
         respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        //注册推送, 用于iOS8以及iOS8之后的系统
        UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                                settingsForTypes:(UIUserNotificationTypeBadge |
                                                                  UIUserNotificationTypeSound |
                                                                  UIUserNotificationTypeAlert)
                                                categories:nil];
        [application registerUserNotificationSettings:settings];
    } else {
        //注册推送，用于iOS8之前的系统
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge |
        UIRemoteNotificationTypeAlert |
        UIRemoteNotificationTypeSound;
        [application registerForRemoteNotificationTypes:myTypes];
    }

    
    // 远程推送的内容
    NSDictionary *remoteNotificationUserInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    NSLog(@"asdsadsadsadsa:%@",remoteNotificationUserInfo);
    NSString *versionCache = [[NSUserDefaults standardUserDefaults] objectForKey:@"VersionCache"];//本地缓存的版本号  第一次启动的时候本地是没有缓存版本号的。
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];//当前应用版本号
    
    if (![versionCache isEqualToString:version]) //如果本地缓存的版本号和当前应用版本号不一样，则是第一次启动（更新版本也算第一次启动）
    {
        WSMovieController *wsCtrl = [[WSMovieController alloc]init];
        
        NSLog(@"dsadadsda:%@",[[NSBundle mainBundle]pathForResource:@"qidong"ofType:@"mp4"]);
        wsCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"qidong"ofType:@"mp4"]];//选择本地的视屏
        [wsCtrl showWsMoviewBlock:^(id sender) {
            QKTabBarController *tabBarVC = [[QKTabBarController alloc] init];
//            [ChatDemoHelper shareHelper];
//            [ChatDemoHelper shareHelper].mainVC =tabBarVC;
            self.window.rootViewController = tabBarVC;
            [self.window makeKeyAndVisible];
        }];
        self.window.rootViewController = wsCtrl;
        [self.window makeKeyAndVisible];
        //设置上下面这句话，将当前版本缓存到本地，下次对比一样，就不走启动视屏了。
        //也可以将这句话放在WSMovieController.m的进入应用方法里面
        //为了让每次都可以看到启动视屏，这句话先注释掉
        //[[NSUserDefaults standardUserDefaults] setObject:version forKey:@"VersionCache"];
        
    }else{
        //不是首次启动
        QKTabBarController *tabBarVC = [[QKTabBarController alloc] init];
//        [ChatDemoHelper shareHelper];
//        [ChatDemoHelper shareHelper].mainVC =tabBarVC;
        self.window.rootViewController = tabBarVC;
        [self.window makeKeyAndVisible];
    }
    
    
    return YES;
}



//友盟
-(void)UM
{
    [self confitUShareSettings];
    [self configUSharePlatforms];
}
-(void)confitUShareSettings
{
    /*
     * 打开图片水印
     */
    [UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}
- (void)configUSharePlatforms
{
//    [[UMSocialManager defaultManager]  umSocialAppkey:@"Your Appkey"];
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"5625a653e0f55ab6550052e6"];
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
    
    /*设置QQ平台的appID*/
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105821097"  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3921700954"  appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}

//融云
-(void)RYIM:(NSDictionary *)launchOptions{

    [[RCIM sharedRCIM] initWithAppKey:@"mgb7ka1nm4dhg"];

    //设置会话列表头像和会话页面头像

    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];

    [RCIM sharedRCIM].globalConversationPortraitSize = CGSizeMake(46, 46);
    //    [RCIM sharedRCIM].portraitImageViewCornerRadius = 10;
    //开启用户信息和群组信息的持久化
    [RCIM sharedRCIM].enablePersistentUserInfoCache = YES;
    
    /**
     * 统计推送打开率
     */
    [[RCIMClient sharedRCIMClient] recordLaunchOptionsEvent:launchOptions];

    NSDictionary *pushServiceData = [[RCIMClient sharedRCIMClient] getPushExtraFromLaunchOptions:launchOptions];
    if (pushServiceData) {
        NSLog(@"该启动事件包含来自融云的推送服务");
        for (id key in [pushServiceData allKeys]) {
            NSLog(@"%@", pushServiceData[key]);
        }
    } else {
        NSLog(@"该启动事件不包含来自融云的推送服务");
    }
    
    //设置群组内用户信息源。如果不使用群名片功能，可以不设置
    //  [RCIM sharedRCIM].groupUserInfoDataSource = RCDDataSource;
    //  [RCIM sharedRCIM].enableMessageAttachUserInfo = YES;
    //设置接收消息代理
//    [RCIM sharedRCIM].receiveMessageDelegate = self;
    //    [RCIM sharedRCIM].globalMessagePortraitSize = CGSizeMake(46, 46);
    //开启输入状态监听
    [RCIM sharedRCIM].enableTypingStatus = YES;

    //开启发送已读回执
    [RCIM sharedRCIM].enabledReadReceiptConversationTypeList =
    @[ @(ConversationType_PRIVATE), @(ConversationType_DISCUSSION), @(ConversationType_GROUP) ];

    //开启多端未读状态同步
    [RCIM sharedRCIM].enableSyncReadStatus = YES;

    //设置显示未注册的消息
    //如：新版本增加了某种自定义消息，但是老版本不能识别，开发者可以在旧版本中预先自定义这种未识别的消息的显示
    [RCIM sharedRCIM].showUnkownMessage = YES;
    [RCIM sharedRCIM].showUnkownMessageNotificaiton = YES;

    //开启消息@功能（只支持群聊和讨论组, App需要实现群成员数据源groupMemberDataSource）
    [RCIM sharedRCIM].enableMessageMentioned = YES;

    //开启消息撤回功能
    [RCIM sharedRCIM].enableMessageRecall = YES;

    //  设置头像为圆形
    //  [RCIM sharedRCIM].globalMessageAvatarStyle = RC_USER_AVATAR_CYCLE;
    //  [RCIM sharedRCIM].globalConversationAvatarStyle = RC_USER_AVATAR_CYCLE;
    //   设置优先使用WebView打开URL
    //  [RCIM sharedRCIM].embeddedWebViewPreferred = YES;

    //  设置通话视频分辨率
    //  [[RCCallClient sharedRCCallClient] setVideoProfile:RC_VIDEO_PROFILE_480P];

    //设置Log级别，开发阶段打印详细log
    [RCIMClient sharedRCIMClient].logLevel = RC_Log_Level_Info;


    

//    ZgBwoREn81wiHHrzCx1G7UiA8cB3nPio56mw4Lzd4hQvMmbarmVQLTWMJKyC9xE4EOD9+MCxSZgZTAPKLEl4Sjd9hGD2ho30
    [[RCIM sharedRCIM] connectWithToken:@"26nnqLmIh1tMZxy7OjvbDEiA8cB3nPio56mw4Lzd4hQvMmbarmVQLY5vA2mi4xHiMoLXuvHKRY6lnpWFwD3k0A=="     success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%d", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    
}

// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


/**
 * 推送处理2
 */
//注册用户通知设置
- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:
(UIUserNotificationSettings *)notificationSettings {
    // register to receive notifications
    [application registerForRemoteNotifications];
}


/**
 * 推送处理3
 */
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token =
    [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<"
                                                           withString:@""]
      stringByReplacingOccurrencesOfString:@">"
      withString:@""]
     stringByReplacingOccurrencesOfString:@" "
     withString:@""];
    
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
}



- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    /**
     * 统计推送打开率
     */
    [[RCIMClient sharedRCIMClient] recordRemoteNotificationEvent:userInfo];
    
    /**
     * 获取融云推送服务扩展字段
     * nil 表示该启动事件不包含来自融云的推送服务
     */
    NSDictionary *pushServiceData = [[RCIMClient sharedRCIMClient] getPushExtraFromRemoteNotification:userInfo];
    if (pushServiceData) {
        NSLog(@"该远程推送包含来自融云的推送服务");
        for (id key in [pushServiceData allKeys]) {
            NSLog(@"key = %@, value = %@", key, pushServiceData[key]);
        }
    } else {
        NSLog(@"该远程推送不包含来自融云的推送服务");
    }
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
