//
//  ProductDetailView.h
//  Xinsheng
//
//  Created by Simson on 2018/4/13.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^product_back)();

typedef void(^product_detail_block)(id);
@interface ProductDetailView : UIView

@property (nonatomic,copy) product_back productBlock;
-(void)showProductBack:(product_back)proBack;


@property (nonatomic,copy) product_detail_block productDetailBlock;
-(void)showProductDetailBack:(product_detail_block)proDetailBack;



@end
