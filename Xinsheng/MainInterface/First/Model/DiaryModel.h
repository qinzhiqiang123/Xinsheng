//
//  DiaryModel.h
//  Xinsheng
//
//  Created by Simson on 2018/4/18.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiaryModel : NSObject

//用户头像
@property (nonatomic,copy) NSString *userImgUrl;

//用户手术前照片
@property (nonatomic,copy) NSString *preoperativeImgUrl;

//用户手术后照片
@property (nonatomic,copy) NSString *postoperativeImgUrl;

//用户昵称
@property (nonatomic,copy) NSString *userName;

//日记描述
@property (nonatomic,copy) NSString *userDiarDesc;

//发帖时间
@property (nonatomic,copy) NSString *time;

//浏览量
@property (nonatomic,copy) NSString *pageCount;

//评论数
@property (nonatomic,copy) NSString *commentCount;

//点赞数量
@property (nonatomic,copy) NSString *likeCount;

//分类
@property (nonatomic,copy) NSString *type;
@end
