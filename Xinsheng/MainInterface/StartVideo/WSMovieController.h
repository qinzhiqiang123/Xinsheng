//
//  WSMovieController.h
//  NewOxygen
//
//  Created by 秦志强 on 2018/1/5.
//  Copyright © 2018年 秦志强. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^wsMoview_block)(id);
@interface WSMovieController : UIViewController
@property(nonatomic,strong)NSURL *movieURL;

@property (nonatomic,copy) wsMoview_block wsMoviewBlock;

-(void)showWsMoviewBlock:(wsMoview_block) wsMoBlock;

@end
