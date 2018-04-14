//
//  ProductModel.h
//  Xinsheng
//
//  Created by Simson on 2018/4/13.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

//商品ID
@property (nonatomic,copy) NSString *productId;

//商品名称
@property (nonatomic,copy) NSString *productName;

//商品图片
@property (nonatomic,copy) NSString *productImgUrl;

//商品描述
@property (nonatomic,copy) NSString *productDesc;

//商品现价格
@property (nonatomic,copy) NSString *productPrice;

//商品原价格
@property (nonatomic,copy) NSString *productOrPrice;

//商品已销售
@property (nonatomic,copy) NSString *productSold;


@end
