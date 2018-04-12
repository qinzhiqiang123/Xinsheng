//
//  HospitalView.h
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^hospital_block)(id);
@interface HospitalView : UIView

@property (nonatomic,copy)hospital_block hospitalBlock;

-(void)showHosBlock:(hospital_block)hosBlock;

@end
