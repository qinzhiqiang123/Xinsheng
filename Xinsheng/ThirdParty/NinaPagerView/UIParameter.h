// The MIT License (MIT)
//
//  Xinsheng
//
//  Created by Simson on 2018/4/12.
//  Copyright © 2018年 Simson. All rights reserved.
//


#ifndef UIParameter_h
#define UIParameter_h

//是否需要打印调试(Print log or not)
#define isDebugging NO
//十六进制颜色值(hex ColorRGB)
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//全屏宽和高大小(Full screen width and height)
#define FUll_VIEW_WIDTH     ([[UIScreen mainScreen] bounds].size.width)
#define FUll_VIEW_HEIGHT    ([[UIScreen mainScreen] bounds].size.height)
#define FUll_CONTENT_HEIGHT     FUll_VIEW_HEIGHT - NavigationBarHeight
#define TabbarHeight    49
#define NavigationBarHeight 64
#define PageBtn     40
#define More5LineWidth      FUll_VIEW_WIDTH / 5.0 //超过5个标题的宽度(Width of more than five titles)

#endif /* UIParameter_h */


