//
//  DiaryTableViewCell.m
//  Xinsheng
//
//  Created by Simson on 2018/4/18.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "DiaryTableViewCell.h"

@implementation DiaryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"diaryCell";
    // 1.缓存中取
    DiaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[DiaryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
    
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        UIView *zsView =[[UIView alloc]init];
        [self.contentView addSubview:zsView];
        [zsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(self.top).mas_equalTo(0);
            make.width.mas_equalTo(MAIN_WIDTH-30);
            make.height.mas_equalTo(115+45+30);
        }];
        
        self.userImageView =[[UIImageView alloc]init];
        [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(zsView.mas_top).mas_equalTo(10);
            make.left.mas_equalTo(zsView.mas_left).mas_equalTo(10);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        self.userImageView.image=[UIImage imageNamed:@"头像"];
        [zsView addSubview:self.userImageView];
       
    }
    return self;
    
}


- (void)setShowModel:(DiaryModel *)showModel{
    
    _showModel = showModel;
//    self.productImageView.image=[UIImage imageNamed:_showModel.productImgUrl];
//    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
//    CGSize labelSize = [[NSString stringWithFormat:@"%@%@",_showModel.productName,_showModel.productDesc] boundingRectWithSize:CGSizeMake(200, 35) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
//
//    self.productNameLabel.frame=CGRectMake(CGRectGetMaxX(self.productImageView.frame)+15, 10, MAIN_WIDTH-145, labelSize.height);
//    self.productNameLabel.text=[NSString stringWithFormat:@"%@%@",_showModel.productName,_showModel.productDesc];
//    self.productPriceLabel.text=[NSString stringWithFormat:@"¥%@",_showModel.productPrice];
//    self.productOrPriceLabel.text=[NSString stringWithFormat:@"原价：%@",_showModel.productOrPrice];
//    self.productSoldLabel.text=[NSString stringWithFormat:@"已售出：%@",_showModel.productSold];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
