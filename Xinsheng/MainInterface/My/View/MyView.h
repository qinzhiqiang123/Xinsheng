//
//  MyView.h
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^my_block)(id);
@interface MyView : UIView


@property (nonatomic,copy)my_block myBlock;
-(void)showBlock:(my_block)mBlock;
@end
