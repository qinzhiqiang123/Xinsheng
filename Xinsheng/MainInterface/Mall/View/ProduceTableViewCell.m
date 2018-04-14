//
//  ProduceTableViewCell.m
//  Xinsheng
//
//  Created by Simson on 2018/4/13.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "ProduceTableViewCell.h"

@implementation ProduceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"productCell";
    // 1.缓存中取
    ProduceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ProduceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
    
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.productImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 100, 100)];
        self.productImageView.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:self.productImageView];
        
        self.productNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.productImageView.frame)+15, 10, MAIN_WIDTH-145, 35)];
        self.productNameLabel.textColor=[UIColor blackColor];
        self.productNameLabel.font=[UIFont systemFontOfSize:14];
        self.productNameLabel.textAlignment=NSTextAlignmentLeft;
        self.productNameLabel.numberOfLines = 0;// 值设定为0时，多行显示。
        self.productNameLabel.lineBreakMode = UILineBreakModeWordWrap; //自动换行
        [self.contentView addSubview:self.productNameLabel];
        
        self.productPriceLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.productImageView.frame)+15, CGRectGetMaxY(self.productNameLabel.frame)+15, 50, 14)];
        self.productPriceLabel.font=[UIFont systemFontOfSize:13];
        self.productPriceLabel.textColor=[UIColor redColor];
        [self.contentView addSubview:self.productPriceLabel];
        
        self.productOrPriceLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.productPriceLabel.frame)+15, CGRectGetMaxY(self.productNameLabel.frame)+15, 100, 14)];
        self.productOrPriceLabel.font=[UIFont systemFontOfSize:13];
        self.productOrPriceLabel.textColor=[UIColor grayColor];
        [self.contentView addSubview:self.productOrPriceLabel];
        
        self.productSoldLabel=[[UILabel alloc]initWithFrame:CGRectMake(MAIN_WIDTH-115, CGRectGetMaxY(self.productOrPriceLabel.frame)+15, 100, 14)];
        self.productSoldLabel.font=[UIFont systemFontOfSize:13];
        self.productSoldLabel.textColor=[UIColor grayColor];
        self.productSoldLabel.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:self.productSoldLabel];
        
        UILabel *yhqLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.productImageView.frame)+15, CGRectGetMaxY(self.productOrPriceLabel.frame)+10, 80, 20)];
        yhqLabel.font=[UIFont systemFontOfSize:10];
        yhqLabel.layer.masksToBounds=YES;
        yhqLabel.layer.cornerRadius=5.0;
        yhqLabel.textAlignment=NSTextAlignmentCenter;
        yhqLabel.backgroundColor=[UIColor grayColor];
        yhqLabel.text=@"满1000可抵231";
        yhqLabel.textColor=[UIColor whiteColor];
        [self.contentView addSubview:yhqLabel];
    }
    return self;
    
}


- (void)setShowModel:(ProductModel *)showModel{
    
    _showModel = showModel;
    self.productImageView.image=[UIImage imageNamed:_showModel.productImgUrl];
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    CGSize labelSize = [[NSString stringWithFormat:@"%@%@",_showModel.productName,_showModel.productDesc] boundingRectWithSize:CGSizeMake(200, 35) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;

    self.productNameLabel.frame=CGRectMake(CGRectGetMaxX(self.productImageView.frame)+15, 10, MAIN_WIDTH-145, labelSize.height);
    self.productNameLabel.text=[NSString stringWithFormat:@"%@%@",_showModel.productName,_showModel.productDesc];
    self.productPriceLabel.text=[NSString stringWithFormat:@"¥%@",_showModel.productPrice];
    self.productOrPriceLabel.text=[NSString stringWithFormat:@"原价：%@",_showModel.productOrPrice];
    self.productSoldLabel.text=[NSString stringWithFormat:@"已售出：%@",_showModel.productSold];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
