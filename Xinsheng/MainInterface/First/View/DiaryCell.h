//
//  DiaryCell.h
//  Xinsheng
//
//  Created by Simson on 2018/4/18.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaryModel.h"
@interface DiaryCell : UITableViewCell

@property (nonatomic,strong) UIImageView *userImageView;

@property (nonatomic,strong) UILabel *userNameLabel;

@property (nonatomic,strong) UIImageView *preoperativeImageView;

@property (nonatomic,strong) UIImageView *postoperativeImageView;

@property (nonatomic,strong) UILabel *diaryDescLabel;

@property (nonatomic,strong) UILabel *diaryTimeLabel;

@property (nonatomic,strong) UILabel *diaryTypeLabel;

@property (nonatomic,strong) UILabel *pageCountLabel;

@property (nonatomic,strong) UILabel *commentCountLabel;

@property (nonatomic,strong) UILabel *likeCountLabel;


@property (nonatomic, strong) DiaryModel *showModel;



+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
