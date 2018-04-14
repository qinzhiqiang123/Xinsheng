//
//  LoginView.h
//  Xinsheng
//
//  Created by Simson on 2018/4/12.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^login_block)(id);
@interface LoginView : UIView

@property (nonatomic,copy) login_block loginBlock;
-(void)showLoginBlock:(login_block)logBlock;

@end
