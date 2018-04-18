//
//  FirstView.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "FirstView.h"
#import "DiaryCell.h"
#import "DiaryModel.h"

@interface FirstView()<UITableViewDelegate,UITableViewDataSource,CarouseViewDataSource, CarouseViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    UIView *headView;
    NSArray *tabArray;
    
    // 轮播图变量，其实作为局部变量也行
    CarouseView *carouseView;
    
    // 轮播图相关的数据
    NSArray *kvDataArray;
//    UIButton *addressButton;
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
    tabArray=[[NSArray alloc]initWithObjects:@"医院",@"专家", @"日记",@"植发",@"眉毛",@"签到",nil];

    _tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
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
    return 580-145+9+(MAIN_WIDTH-30)/3;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    headView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
    // 初始化一些数据
    kvDataArray = @[@"page 1", @"page 2", @"page3", @"page 4", @"page 5"];
    
    
    carouseView = [[CarouseView alloc] init];
    carouseView.frame = CGRectMake(0, 0, MAIN_WIDTH, 200);
    carouseView.datasource = self;
    carouseView.delegate = self;
    [headView addSubview:carouseView];
    
    UIView *topView =[[UIView alloc]initWithFrame:CGRectMake(25, 25, MAIN_WIDTH-50, 35)];
    topView.backgroundColor=[UIColor whiteColor];
//    topView.alpha=0.5;
    topView.layer.masksToBounds=YES;
    topView.layer.cornerRadius=17.5;
    [headView addSubview:topView];
    
    self.addressButton =[[UIButton alloc]init];
    [topView addSubview:self.addressButton];
    [self.addressButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topView.mas_left).mas_offset(15);
        make.top.mas_equalTo(topView.mas_top).mas_offset(0);
//        make.width.mas_equalTo(40);
        make.height.mas_equalTo(35);
        make.width.greaterThanOrEqualTo(@40);
        make.width.lessThanOrEqualTo(@100);
        
    }];
//    addressButton.backgroundColor=[UIColor redColor];
    [self.addressButton setTitle:@"南京" forState:UIControlStateNormal];
    [self.addressButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addressButton addTarget:self action:@selector(addressButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.addressButton.titleLabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *jtImageView =[[UIImageView alloc]init];
    [topView addSubview:jtImageView];
    [jtImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressButton.mas_right).mas_offset(5);
        make.top.mas_equalTo(topView.mas_top).mas_offset((35-10/1.3)/2);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(10/1.3);
    }];
    

    jtImageView.image=[UIImage imageNamed:@"定位三角形"];
//
    UIImageView *searImageView =[[UIImageView alloc]init];
    [topView addSubview:searImageView];
    [searImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(jtImageView.mas_right).mas_offset(20);
        make.top.mas_equalTo(topView.mas_top).mas_offset(10);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
    }];
    searImageView.image=[UIImage imageNamed:@"搜索"];
    
    UILabel *searLabel =[[UILabel alloc]init];
    [topView addSubview:searLabel];
    [searLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(searImageView.mas_right).mas_offset(10);
        make.top.mas_equalTo(topView.mas_top).mas_offset(0);
        make.width.greaterThanOrEqualTo(@100);
        make.width.lessThanOrEqualTo(@200);
        make.height.mas_equalTo(35);
    }];
    searLabel.text=@"大家都在搜:发际线种植";
    searLabel.font=[UIFont systemFontOfSize:14];
    searLabel.textColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    
    UIView *yyView =[[UIView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(carouseView.frame)-15, MAIN_WIDTH-30, 200)];
    yyView.layer.cornerRadius = 10;
    yyView.layer.shadowColor = [UIColor blackColor].CGColor;
    yyView.layer.shadowOffset = CGSizeMake(0, 0);
    yyView.backgroundColor=[UIColor whiteColor];
    yyView.layer.shadowOpacity = 0.5;
    yyView.layer.shadowRadius = 5;
    [headView addSubview:yyView];
    int wigth=50;
    for (int i=0; i<tabArray.count; i++) {
        UIImageView *tabImageView =[[UIImageView alloc]initWithFrame:CGRectMake((yyView.frame.size.width-wigth*3)/4+i*(wigth+(yyView.frame.size.width-wigth*3)/4), 15, wigth, wigth)];
        tabImageView.image=[UIImage imageNamed:tabArray[i]];
        [yyView addSubview:tabImageView];

        UILabel *tabLabel =[[UILabel alloc]initWithFrame:CGRectMake((yyView.frame.size.width-wigth*3)/4+i*(wigth+(yyView.frame.size.width-wigth*3)/4), CGRectGetMaxY(tabImageView.frame)+10, wigth, 14)];
        tabLabel.text=tabArray[i];
        tabLabel.font=[UIFont systemFontOfSize:14];
        tabLabel.textColor=[UIColor blackColor];
        tabLabel.textAlignment=NSTextAlignmentCenter;
        [yyView addSubview:tabLabel];
        UIButton *tabButton =[[UIButton alloc]initWithFrame:CGRectMake((yyView.frame.size.width-wigth*3)/4+i*(wigth+(yyView.frame.size.width-wigth*3)/4), 15, wigth, 60)];
        [tabButton addTarget:self action:@selector(tabButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [tabButton setTitle:tabArray[i] forState:UIControlStateNormal];
        [tabButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [yyView addSubview:tabButton];
        if (i>2) {
            tabImageView.frame=CGRectMake((yyView.frame.size.width-wigth*3)/4+(i-3)*(wigth+(yyView.frame.size.width-wigth*3)/4),110, wigth, wigth);
            tabLabel.frame=CGRectMake((yyView.frame.size.width-wigth*3)/4+(i-3)*(wigth+(yyView.frame.size.width-wigth*3)/4), CGRectGetMaxY(tabImageView.frame)+10, wigth, 14);
            tabButton.frame=CGRectMake((yyView.frame.size.width-wigth*3)/4+(i-3)*(wigth+(yyView.frame.size.width-wigth*3)/4), 110, wigth, 60);
        }


    }
    
//    130
    UIView *centerView =[[UIView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(yyView.frame)+15, MAIN_WIDTH-30, (MAIN_WIDTH-30)/3)];
    
    [headView addSubview:centerView];
    
    UIButton *xsButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, centerView.frame.size.width/3, centerView.frame.size.height)];
    [xsButton setImage:[UIImage imageNamed:@"限时特惠"] forState:UIControlStateNormal];
//    xsButton.backgroundColor=[UIColor blackColor];
    [xsButton setTitle:@"限时特惠" forState:UIControlStateNormal];
    [xsButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [xsButton addTarget:self action:@selector(zxButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:xsButton];

    for (int i=0; i<2; i++) {
        UIButton *zxButton =[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(xsButton.frame)+10, 0+i*((centerView.frame.size.height-5)/2+5), (centerView.frame.size.width/3-10)*2, (centerView.frame.size.height-5)/2)];
        [zxButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [zxButton addTarget:self action:@selector(zxButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [centerView addSubview:xsButton];
//        zxButton.backgroundColor=[UIColor redColor];
        if (i==0) {
             [zxButton setImage:[UIImage imageNamed:@"在线商城"] forState:UIControlStateNormal];
            [zxButton setTitle:@"在线商城" forState:UIControlStateNormal];
    
        }else{
             [zxButton setImage:[UIImage imageNamed:@"脱发检测"] forState:UIControlStateNormal];
            [zxButton setTitle:@"脱发检测" forState:UIControlStateNormal];
       
        }
        [centerView addSubview:zxButton];
    }
    
    UIView *dbView =[[UIView alloc]init];
    dbView.layer.masksToBounds=YES;
    dbView.layer.cornerRadius=8.0;
    dbView.backgroundColor=[UIColor whiteColor];
    [headView addSubview:dbView];
    [dbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(centerView.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(MAIN_WIDTH-30);
        make.height.mas_equalTo(45);
    }];
    
    UILabel *hxLabel =[[UILabel alloc]init];
    [dbView addSubview:hxLabel];
    [hxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dbView.mas_top).mas_offset(22);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(1);
        make.left.mas_equalTo((MAIN_WIDTH-30-80-60-20-70)/2);
    }];
    hxLabel.backgroundColor=[UIColor blackColor];


    UIImageView *tbImageView =[[UIImageView alloc]init];
    [dbView addSubview:tbImageView];
    [tbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dbView.mas_top).mas_offset((45-20/(26.0/33.0))/2);
        make.left.mas_equalTo(hxLabel.mas_right).mas_offset(30);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20/(26.0/33.0));
    }];
    tbImageView.image=[UIImage imageNamed:@"矢量智能对象"];

    UILabel *msLabel =[[UILabel alloc]init];
    [dbView addSubview:msLabel];
    [msLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dbView.mas_top).mas_equalTo(15);
        make.left.mas_equalTo(tbImageView.mas_right).mas_equalTo(10);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(16);
    }];
    msLabel.text=@"蜕变日记";
    msLabel.font=[UIFont systemFontOfSize:16];
    msLabel.textColor=[UIColor blackColor];


    UILabel *hxTwoLabel =[[UILabel alloc]init];
    [dbView addSubview:hxTwoLabel];
    [hxTwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dbView.mas_top).mas_offset(22);
        make.left.mas_equalTo(msLabel.mas_right).mas_offset(30);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(1);
    }];
    hxTwoLabel.backgroundColor=[UIColor blackColor];
//
//    UILabel *msLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(centerView.frame)+15, MAIN_WIDTH-30, 14)];
//    msLabel.text=@"蜕变日记";
//    msLabel.font=[UIFont systemFontOfSize:16];
//    msLabel.textColor=[UIColor blackColor];
//    [headView addSubview:msLabel];
//
    return headView;
}
-(void)zxButtonClick:(UIButton *)sender{
    if (_firstBlock!=nil) {
            _firstBlock(sender.titleLabel.text);
    }
 }

-(void)addressButtonClick:(UIButton *)sender
{
    if (_firstBlock!=nil) {
        _firstBlock(@"城市");
    }
}




-(void)tabButtonClick:(UIButton *)sender{
    if (_firstBlock!=nil) {
        _firstBlock(sender.titleLabel.text);
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 115+60+(MAIN_WIDTH-70)/2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DiaryCell *cell = [DiaryCell cellWithTableView:tableView];
//    cell.showModel=_array[indexPath.row];
    return cell;
//    static NSString *cellId=@"cell";
//    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
//        cell.selectionStyle=UITableViewCellSelectionStyleNone;
//        for (int i=0; i<2; i++) {
//            UIImageView *zsImageView =[[UIImageView alloc]initWithFrame:CGRectMake(15+i*((MAIN_WIDTH-45)/2+15), 0, (MAIN_WIDTH-45)/2, 100)];
//            zsImageView.backgroundColor=[UIColor redColor];
//            [cell.contentView addSubview:zsImageView];
//        }
//
//        UILabel *descLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, 110, MAIN_WIDTH-30, 35)];
//        descLabel.text=@"这是术后第10天的照片，头发已经完完全全的长出来了，没有出现掉发等不良现象。新生植发值得信赖！这是术后第10天的照片，头发已经完完全全的长出来了，没有出现掉发等不良现象。新生植发值得信赖！";
//        descLabel.font=[UIFont systemFontOfSize:13];
//        descLabel.textColor=[UIColor grayColor];
//        descLabel.numberOfLines=0;
//        [cell.contentView addSubview:descLabel];
//
//        UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(descLabel.frame)+5, MAIN_WIDTH-30, 1)];
//        hxLabel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
//        [cell.contentView addSubview:hxLabel];
//    }
//
//    return cell;
}

-(void)showFirstBlock:(first_block)firBlock
{
    _firstBlock=firBlock;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_firstBlock!=nil) {
        _firstBlock(@"日记详情");
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
