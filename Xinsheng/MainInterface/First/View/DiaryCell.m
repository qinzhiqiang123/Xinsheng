//
//  DiaryCell.m
//  Xinsheng
//
//  Created by Simson on 2018/4/18.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "DiaryCell.h"

@implementation DiaryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"diaryCell";
    // 1.缓存中取
    DiaryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[DiaryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
    
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
        UIView *zsView =[[UIView alloc]init];
        zsView.backgroundColor=[UIColor whiteColor];
        zsView.layer.masksToBounds=YES;
        zsView.layer.cornerRadius=10.0;
        [self.contentView addSubview:zsView];
        [zsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.width.mas_equalTo(MAIN_WIDTH-30);
            make.height.mas_equalTo(115+60+(MAIN_WIDTH-70)/2-10);
        }];
        
        self.userImageView =[[UIImageView alloc]init];
         [zsView addSubview:self.userImageView];
        [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(zsView.mas_top).mas_equalTo(10);
            make.left.mas_equalTo(zsView.mas_left).mas_equalTo(10);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        self.userImageView.image=[UIImage imageNamed:@"头像"];
        
        self.userNameLabel =[[UILabel alloc]init];
        [self.contentView addSubview:self.userNameLabel];
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userImageView.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(zsView.mas_top).mas_equalTo(10);
            make.width.lessThanOrEqualTo(@200);
            make.width.greaterThanOrEqualTo(@80);
            make.height.mas_equalTo(30);
        }];
        self.userNameLabel.font=[UIFont systemFontOfSize:16];
        self.userNameLabel.textColor=[UIColor colorWithRed:161.0/255.0 green:161.0/255.0 blue:161.0/255.0 alpha:1];
        self.userNameLabel.text=@"曹若瑜";
        
        self.diaryTimeLabel =[[UILabel alloc]init];
        [self.contentView addSubview:self.diaryTimeLabel];
        [self.diaryTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(zsView.mas_right).mas_equalTo(-15);
            make.top.mas_equalTo(zsView.mas_top).mas_equalTo(10);
            make.width.lessThanOrEqualTo(@150);
            make.width.greaterThanOrEqualTo(@80);
            make.height.mas_equalTo(30);
        }];
        self.diaryTimeLabel.font=[UIFont systemFontOfSize:14];
        self.diaryTimeLabel.textColor=[UIColor colorWithRed:161.0/255.0 green:161.0/255.0 blue:161.0/255.0 alpha:1];
        self.diaryTimeLabel.text=@"4月19日";
        self.diaryTimeLabel.textAlignment=NSTextAlignmentRight;
        
        self.preoperativeImageView =[[UIImageView alloc]init];
        [zsView addSubview:self.preoperativeImageView];
        [self.preoperativeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(zsView.mas_left).mas_equalTo(15);
            make.top.mas_equalTo(self.userNameLabel.mas_bottom).mas_equalTo(15);
            make.width.mas_equalTo((MAIN_WIDTH-70)/2);
            make.height.mas_equalTo((MAIN_WIDTH-70)/2);
        }];
        self.preoperativeImageView.image=[UIImage imageNamed:@"术前"];
       
        
        self.postoperativeImageView =[[UIImageView alloc]init];
        [zsView addSubview:self.postoperativeImageView];
        [self.postoperativeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.preoperativeImageView.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.userNameLabel.mas_bottom).mas_equalTo(15);
            make.width.mas_equalTo((MAIN_WIDTH-70)/2);
            make.height.mas_equalTo((MAIN_WIDTH-70)/2);
        }];
        self.postoperativeImageView.image=[UIImage imageNamed:@"术后"];
        
        self.diaryDescLabel =[[UILabel alloc]init];
        [zsView addSubview:self.diaryDescLabel];
        [self.diaryDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.postoperativeImageView.mas_bottom).mas_equalTo(8);
            make.left.mas_equalTo(zsView.mas_left).mas_equalTo(15);
            make.width.mas_equalTo(MAIN_WIDTH-60);
            make.height.greaterThanOrEqualTo(@20);
            make.height.lessThanOrEqualTo(@40);
        }];
        self.diaryDescLabel.text=@"这是术后第10天的照片，头发已经完完全全的长出来了，没有出现掉发等不良现象。新生植发值得信赖！这是术后第10天的照片，头发已经完完全全的长出来了，没有出现掉发等不良现象。新生植发值得信赖！";
        self.diaryDescLabel.font=[UIFont systemFontOfSize:14];
        self.diaryDescLabel.textColor=[UIColor blackColor];
        self.diaryDescLabel.numberOfLines=0;
        
        UIImageView *typeImageView =[[UIImageView alloc]init];
        [zsView addSubview:typeImageView];
        [typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(zsView.mas_left).mas_equalTo(15);
            make.top.mas_equalTo(self.diaryDescLabel.mas_bottom).mas_equalTo(8);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
        typeImageView.image=[UIImage imageNamed:@"标签"];
        
        self.diaryTypeLabel=[[UILabel alloc]init];
        [zsView addSubview:self.diaryTypeLabel];
        [self.diaryTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(typeImageView.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.diaryDescLabel.mas_bottom).mas_equalTo(8);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(15);
        }];
        self.diaryTypeLabel.text=@"发际线种植 植发";
        self.diaryTypeLabel.font=[UIFont systemFontOfSize:14];
        self.diaryTypeLabel.textColor=MAIN_COLOR;
        
        UIImageView *pageImageView =[[UIImageView alloc]init];
        [zsView addSubview:pageImageView];
        [pageImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(zsView.mas_left).mas_equalTo(15);
            make.top.mas_equalTo(self.diaryTypeLabel.mas_bottom).mas_equalTo(8+(15-15/(30.0/20.0))/2);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15/(30.0/20.0));
        }];
        pageImageView.image=[UIImage imageNamed:@"浏览"];
        
        self.pageCountLabel=[[UILabel alloc]init];
        [zsView addSubview:self.pageCountLabel];
        [self.pageCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(typeImageView.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.diaryTypeLabel.mas_bottom).mas_equalTo(8);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(15);
        }];
        self.pageCountLabel.text=@"浏览 1254";
        self.pageCountLabel.font=[UIFont systemFontOfSize:14];
        self.pageCountLabel.textColor=[UIColor grayColor];
        
        
        
        
        UIImageView *commentImageView =[[UIImageView alloc]init];
        [zsView addSubview:commentImageView];
        [commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(zsView.mas_right).mas_equalTo(-140);
            make.top.mas_equalTo(self.diaryTypeLabel.mas_bottom).mas_equalTo(8);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
        commentImageView.image=[UIImage imageNamed:@"评论"];
        
        self.commentCountLabel=[[UILabel alloc]init];
        [zsView addSubview:self.commentCountLabel];
        [self.commentCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(commentImageView.mas_right).mas_equalTo(6);
            make.top.mas_equalTo(self.diaryTypeLabel.mas_bottom).mas_equalTo(8);
            make.width.greaterThanOrEqualTo(@30);
            make.width.lessThanOrEqualTo(@50);
            make.height.mas_equalTo(15);
        }];
        self.commentCountLabel.text=@"698";
        self.commentCountLabel.font=[UIFont systemFontOfSize:14];
        self.commentCountLabel.textColor=[UIColor grayColor];
        
        
        
        self.likeCountLabel=[[UILabel alloc]init];
        [zsView addSubview:self.likeCountLabel];
        [self.likeCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(zsView.mas_right).mas_equalTo(-15);
            make.top.mas_equalTo(self.diaryTypeLabel.mas_bottom).mas_equalTo(8);
            make.width.greaterThanOrEqualTo(@30);
            make.width.lessThanOrEqualTo(@50);
            make.height.mas_equalTo(15);
        }];
        self.likeCountLabel.text=@"698";
        self.likeCountLabel.font=[UIFont systemFontOfSize:14];
        self.likeCountLabel.textAlignment=NSTextAlignmentRight;
        self.likeCountLabel.textColor=[UIColor grayColor];
        
        UIImageView *likeCounImageView =[[UIImageView alloc]init];
        [zsView addSubview:likeCounImageView];
        [likeCounImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.likeCountLabel.mas_left).mas_equalTo(-15);
            make.top.mas_equalTo(self.diaryTypeLabel.mas_bottom).mas_equalTo(8);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
        likeCounImageView.image=[UIImage imageNamed:@"评论"];
        

//        UILabel *hxLabel =[[UILabel alloc]init];
//        [self.contentView addSubview:hxLabel];
//        [hxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.contentView.mas_bottom).mas_equalTo(10);
//            make.height.mas_equalTo(10);
//        }];
//        hxLabel.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];;
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
