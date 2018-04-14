//
//  MallView.h
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^mall_block)(id);
@interface MallView : UIView

@property (nonatomic,copy) mall_block mallBlock;

-(void)showMallBlock:(mall_block)maBlock;

@end
