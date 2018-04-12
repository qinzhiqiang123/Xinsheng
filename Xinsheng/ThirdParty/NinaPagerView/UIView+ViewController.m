// The MIT License (MIT)
//
//  Xinsheng
//
//  Created by Simson on 2018/4/12.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController {
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    }while (next != nil);    
    return nil;
}

@end
