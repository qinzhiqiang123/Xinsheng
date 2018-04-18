//
//  UIColor+XSColor.h
//  Xinsheng
//
//  Created by Simson on 2018/4/18.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XSColor)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString: (NSString *)color;


@end
