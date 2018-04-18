//
//  FirstView.h
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^first_block)(id);
@interface FirstView : UIView


@property (nonatomic,copy) first_block firstBlock;
-(void)showFirstBlock:(first_block)firBlock;
@property (nonatomic,strong) UIButton *addressButton;
@end
