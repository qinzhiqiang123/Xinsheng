//
//  ProductDetailView.m
//  Xinsheng
//
//  Created by Simson on 2018/4/13.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "ProductDetailView.h"


@interface ProductDetailView()
{
    NSArray *typeArray;
    NSArray *descArray;
    NSArray *hjArray;
}
@end


@implementation ProductDetailView


-(id)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    typeArray=[[NSArray alloc]initWithObjects:@"在线咨询",@"立即购买", nil];
    descArray=[[NSArray alloc]initWithObjects:@"美豆抵",@"正品保证",@"包邮", nil];
    hjArray=[[NSArray alloc]initWithObjects:@"环境:",@"服务:",@"专业:", nil];
    UIScrollView *zsScrollView= [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT-45)];
    zsScrollView.backgroundColor=[UIColor whiteColor];
    [self addSubview:zsScrollView];
    
    UIImageView *productImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, 150)];
    productImageView.backgroundColor=[UIColor redColor];
    [zsScrollView addSubview:productImageView];
    
    UIButton *backButton =[[UIButton alloc]initWithFrame:CGRectMake(15, 20, 40, 30)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    backButton.backgroundColor=[UIColor grayColor];
    [zsScrollView addSubview:backButton];
    
    UILabel *productNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(productImageView.frame)+15, MAIN_WIDTH-30, 40)];
    productNameLabel.textColor=[UIColor blackColor];
    productNameLabel.font=[UIFont systemFontOfSize:16];
    productNameLabel.textAlignment=NSTextAlignmentLeft;
    productNameLabel.numberOfLines = 0;// 值设定为0时，多行显示。
    productNameLabel.text=@"【新生植发】新生植发新生植发新生植发新生植发新生植发新生植发新生植发新生植发新生植发新生植发";
    productNameLabel.lineBreakMode = UILineBreakModeWordWrap; //自动换行
    [zsScrollView addSubview:productNameLabel];
    
    UILabel *priceLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(productNameLabel.frame)+15, MAIN_WIDTH, 16)];
    priceLabel.text=@"¥6666";
    priceLabel.textColor=[UIColor redColor];
    priceLabel.font=[UIFont systemFontOfSize:16];
    priceLabel.textAlignment=NSTextAlignmentCenter;
    [zsScrollView addSubview:priceLabel];
    
    UILabel *orPriceLabel =[[UILabel alloc]initWithFrame:CGRectMake((MAIN_WIDTH-180-15)/2, CGRectGetMaxY(priceLabel.frame)+15, 80, 20)];
    orPriceLabel.text=@"原价:¥10000";
    orPriceLabel.textColor=[UIColor grayColor];
    orPriceLabel.font=[UIFont systemFontOfSize:10];
    orPriceLabel.textAlignment=NSTextAlignmentCenter;
    orPriceLabel.layer.masksToBounds=YES;
    orPriceLabel.layer.cornerRadius=5.0;
    orPriceLabel.layer.borderWidth=1.0;
    orPriceLabel.layer.borderColor=[UIColor grayColor].CGColor;
    [zsScrollView addSubview:orPriceLabel];
    
    
    UILabel *dyPriceLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(orPriceLabel.frame)+10, CGRectGetMaxY(priceLabel.frame)+15, 100, 20)];
    dyPriceLabel.text=@"10000可抵3333元";
    dyPriceLabel.textColor=[UIColor grayColor];
    dyPriceLabel.font=[UIFont systemFontOfSize:10];
    dyPriceLabel.textAlignment=NSTextAlignmentCenter;
    dyPriceLabel.layer.masksToBounds=YES;
    dyPriceLabel.layer.cornerRadius=5.0;
    dyPriceLabel.layer.borderWidth=1.0;
    dyPriceLabel.layer.borderColor=[UIColor grayColor].CGColor;
    [zsScrollView addSubview:dyPriceLabel];
    
    UIView *zsView =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(dyPriceLabel.frame)+20, MAIN_WIDTH, 45)];
    zsView.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    [zsScrollView addSubview:zsView];
    
    for (int i =0; i<descArray.count; i++) {
        UIImageView *dhImageView= [[UIImageView alloc]initWithFrame:CGRectMake(15+i*100, 15, 15, 15)];
        dhImageView.backgroundColor=[UIColor redColor];
        [zsView addSubview:dhImageView];
        UILabel *descLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(dhImageView.frame)+10, 0, 80, 45)];
        descLabel.text=descArray[i];
        descLabel.textColor=[UIColor grayColor];
        descLabel.font=[UIFont systemFontOfSize:14];
        [zsView addSubview:descLabel];
    }
    
    UILabel *userPjLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(zsView.frame), 100, 45)];
    userPjLabel.text=@"用户评价";
    userPjLabel.font=[UIFont systemFontOfSize:17];
    userPjLabel.textColor=[UIColor blackColor];
    [zsScrollView addSubview:userPjLabel];
    
    UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(userPjLabel.frame), MAIN_WIDTH, 1)];
    hxLabel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    [zsScrollView addSubview:hxLabel];
    
    for (int i =0; i<hjArray.count; i++) {
        UILabel *descLabel =[[UILabel alloc]initWithFrame:CGRectMake(15+i*80, CGRectGetMaxY(hxLabel.frame), 80, 45)];
        descLabel.text=[NSString stringWithFormat:@"%@5",hjArray[i]];
        descLabel.textColor=[UIColor grayColor];
        descLabel.font=[UIFont systemFontOfSize:14];
        [zsScrollView addSubview:descLabel];
    }
    
    
    for (int i=0; i<typeArray.count; i++) {
        UIButton *typeButton =[[UIButton alloc]initWithFrame:CGRectMake(0+MAIN_WIDTH/2*i, MAIN_HEIGHT-45, MAIN_WIDTH/2, 45)];
        if (i==0) {
            typeButton.backgroundColor=[UIColor blueColor];
        }else{
            typeButton.backgroundColor=[UIColor redColor];
        }
        [typeButton setTitle:typeArray[i] forState:UIControlStateNormal];
        [typeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        typeButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [typeButton addTarget:self action:@selector(typeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:typeButton];
    }
    
}

-(void)showProductDetailBack:(product_detail_block)proDetailBack{
    _productDetailBlock=proDetailBack;
}
-(void)typeButtonClick:(UIButton *)sender{
    if (_productDetailBlock!=nil) {
        _productDetailBlock(sender.titleLabel.text);
    }
}
-(void)showProductBack:(product_back)proBack{
    _productBlock=proBack;
}
-(void)backButtonClick:(UIButton *)sender{
    if (_productBlock!=nil) {
        _productBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
