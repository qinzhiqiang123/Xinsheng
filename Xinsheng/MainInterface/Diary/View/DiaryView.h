//
//  DiaryView.h
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^diary_block)(id);

@interface DiaryView : UIView

@property (nonatomic,copy) diary_block diaryBlock;
-(void)showDiaryBlock:(diary_block) diaBlock;

@end
