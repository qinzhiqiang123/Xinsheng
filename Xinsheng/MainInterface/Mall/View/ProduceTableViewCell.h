//
//  ProduceTableViewCell.h
//  Xinsheng
//
//  Created by Simson on 2018/4/13.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@interface ProduceTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *productImageView;

@property (nonatomic,strong) UILabel *productNameLabel;

@property (nonatomic,strong) UILabel *productPriceLabel;

@property (nonatomic,strong) UILabel *productOrPriceLabel;

@property (nonatomic,strong) UILabel *productSoldLabel;

@property (nonatomic, strong) ProductModel *showModel;



+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
