//
//  UploadParam.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "UploadParam.h"

@implementation UploadParam



// Do any additional setup after loading the view, typically from a nib.
//get请求
/*
 [HttpRequest getWithURLString:@"http://1000phone.net:8088/app/iAppFree/api/limited.php?page=1&number=20" parameters:nil success:^(id responseObject) {
 id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
 NSLog(@"%@",json);
 } failure:^(NSError *error) {
 NSLog(@"请求失败");
 }];
 */


//post请求
/*
 NSMutableDictionary *params = [NSMutableDictionary dictionary];
 params[@"page"] = @"1";
 params[@"number"] = @"20";
 [HttpRequest postWithURLString:@"http://1000phone.net:8088/app/iAppFree/api/limited.php" parameters:params success:^(id responseObject) {
 id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
 NSLog(@"--------------------%@",json);
 } failure:^(NSError *error) {
 NSLog(@"--------------------请求失败");
 }];
 */

//2合1
//UIImageView *iamgeV = [[UIImageView alloc] init];
//iamgeV.frame = [UIScreen mainScreen].bounds;
//[self.view addSubview:iamgeV];
//[[HttpRequest sharedInstance] requestWithURLString:@"http://httpbin.org/get" parameters:nil type:HttpRequestTypeGet success:^(id responseObject) {
//    //        iamgeV.image = [UIImage imageWithData:responseObject];
//    NSLog(@"sadasdas:%@",responseObject);
//} failure:^(NSError *error) {
//    NSLog(@"请求错误");
//}];


@end
