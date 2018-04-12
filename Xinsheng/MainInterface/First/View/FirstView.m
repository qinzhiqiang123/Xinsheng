//
//  FirstView.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "FirstView.h"


@interface FirstView()<UITableViewDelegate,UITableViewDataSource,CarouseViewDataSource, CarouseViewDelegate>
{
    UITableView *_tableView;
    UIView *headView;
    NSArray *tabArray;
    
    // 轮播图变量，其实作为局部变量也行
    CarouseView *carouseView;
    
    // 轮播图相关的数据
    NSArray *kvDataArray;
    
    NSArray *typeArray;
}

@end

@implementation FirstView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    
    return self;
}

-(void)createUI
{
    tabArray=[[NSArray alloc]initWithObjects:@"医院",@"专家", @"日记",@"签到",@"植发",@"眉毛",@"养护",@"更多",nil];

    _tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    headView =[[UIView alloc]init];
    _tableView.backgroundColor=[UIColor whiteColor];
    [self addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tabArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 500;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    headView.backgroundColor=[UIColor whiteColor];
    // 初始化一些数据
    kvDataArray = @[@"page 1", @"page 2", @"page3", @"page 4", @"page 5"];
    
    
    carouseView = [[CarouseView alloc] init];
    carouseView.frame = CGRectMake(0, 0, MAIN_WIDTH, 200);
    carouseView.datasource = self;
    carouseView.delegate = self;
    [headView addSubview:carouseView];
    
    for (int i=0; i<tabArray.count; i++) {
        UIImageView *tabImageView =[[UIImageView alloc]initWithFrame:CGRectMake(15+i*(40+(MAIN_WIDTH-40*4-30)/3), CGRectGetMaxY(carouseView.frame)+15, 40, 40)];
        tabImageView.backgroundColor=[UIColor redColor];
        [headView addSubview:tabImageView];
        
        UILabel *tabLabel =[[UILabel alloc]initWithFrame:CGRectMake(15+i*(40+(MAIN_WIDTH-40*4-30)/3), CGRectGetMaxY(tabImageView.frame)+10, 40, 14)];
        tabLabel.text=tabArray[i];
        tabLabel.font=[UIFont systemFontOfSize:14];
        tabLabel.textColor=[UIColor blackColor];
        tabLabel.textAlignment=NSTextAlignmentCenter;
        [headView addSubview:tabLabel];
        if (i>3) {
            tabImageView.frame=CGRectMake(15+(i-4)*(40+(MAIN_WIDTH-40*4-30)/3), CGRectGetMaxY(carouseView.frame)+15+70, 40, 40);
            tabLabel.frame=CGRectMake(15+(i-4)*(40+(MAIN_WIDTH-40*4-30)/3), CGRectGetMaxY(tabImageView.frame)+10, 40, 14);
        }
    }
    
    
    UIImageView *centerImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(carouseView.frame)+160, MAIN_WIDTH, 100)];
    centerImageView.backgroundColor=[UIColor redColor];
    [headView addSubview:centerImageView];
    
    UILabel *msLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(centerImageView.frame)+15, MAIN_WIDTH-30, 14)];
    msLabel.text=@"蜕变日记";
    msLabel.font=[UIFont systemFontOfSize:16];
    msLabel.textColor=[UIColor blackColor];
    [headView addSubview:msLabel];
    
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 115+45;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        for (int i=0; i<2; i++) {
            UIImageView *zsImageView =[[UIImageView alloc]initWithFrame:CGRectMake(15+i*((MAIN_WIDTH-45)/2+15), 0, (MAIN_WIDTH-45)/2, 100)];
            zsImageView.backgroundColor=[UIColor redColor];
            [cell.contentView addSubview:zsImageView];
        }
        
        UILabel *descLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, 110, MAIN_WIDTH-30, 35)];
        descLabel.text=@"这是术后第10天的照片，头发已经完完全全的长出来了，没有出现掉发等不良现象。新生植发值得信赖！这是术后第10天的照片，头发已经完完全全的长出来了，没有出现掉发等不良现象。新生植发值得信赖！";
        descLabel.font=[UIFont systemFontOfSize:13];
        descLabel.textColor=[UIColor grayColor];
        descLabel.numberOfLines=0;
        [cell.contentView addSubview:descLabel];
        
        UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(descLabel.frame)+5, MAIN_WIDTH-30, 1)];
        hxLabel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        [cell.contentView addSubview:hxLabel];
    }
    
    return cell;
}

-(void)showFirstBlock:(first_block)firBlock
{
    _firstBlock=firBlock;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_firstBlock!=nil) {
        _firstBlock(tabArray[indexPath.row]);
    }
    
}




#pragma mark - 轮播图代理
- (NSInteger)countOfCellForCarouseView:(CarouseView *)carouseView
{
    return kvDataArray.count;
}

- (UIView *)carouselView:(CarouseView *)carouselView cellAtIndex:(NSInteger)index
{
    // 先用空白页测试
    //    UIView *imageView = [[UIView alloc] init];
    //    int R = (arc4random() % 256) ;
    //    int G = (arc4random() % 256) ;
    //    int B = (arc4random() % 256) ;
    //    imageView.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    
    // 填充view，可以是任意view
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", (long)index + 1]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];

    
    return imageView;
}

- (void)carouseView:(CarouseView *)carouseView didSelectedAtIndex:(NSInteger)index
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"carouse1 msg"
                                                        message:kvDataArray[index]
                                                       delegate:nil
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
