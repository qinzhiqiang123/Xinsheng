//
//  IntegralView.m
//  Xinsheng
//
//  Created by Simson on 2018/4/12.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "IntegralView.h"


@interface IntegralView()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIView *headView;
}
@end
@implementation IntegralView


-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    
    return self;
}

-(void)createUI{
    _tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    _tableView.tableHeaderView=headView;
    headView=[[UIView alloc]init];
    [self addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    headView.backgroundColor=[UIColor whiteColor];
    UIImageView *headImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, 151)];
    headImageView.backgroundColor=[UIColor redColor];
    [headView addSubview:headImageView];
    
    UIButton *szButton =[[UIButton alloc]initWithFrame:CGRectMake(MAIN_WIDTH-80, 15, 65, 20)];
    [szButton setTitle:@"积分规则" forState:UIControlStateNormal];
    [szButton setTitleColor:[UIColor colorWithRed:201.0/255.0 green:164.0/255.0 blue:126.0/255.0 alpha:1] forState:UIControlStateNormal];
    szButton.titleLabel.font=[UIFont systemFontOfSize:14];
    [headView addSubview:szButton];
    
    UIImageView *moImageView =[[UIImageView alloc]initWithFrame:CGRectMake((MAIN_WIDTH-60-15-15)/2, CGRectGetMaxY(szButton.frame)+15, 15, 15)];
    moImageView.backgroundColor=[UIColor yellowColor];
    [headView addSubview:moImageView];
    
    UILabel *tsLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moImageView.frame)+5, CGRectGetMaxY(szButton.frame)+13, 60, 18)];
    tsLabel.font=[UIFont systemFontOfSize:18];
    tsLabel.textAlignment=NSTextAlignmentCenter;
    tsLabel.text=@"5826";
    tsLabel.textColor=[UIColor colorWithRed:201.0/255.0 green:164.0/255.0 blue:126.0/255.0 alpha:1];
    [headView addSubview:tsLabel];
    
    UIView *dbView =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tsLabel.frame)+15+25, MAIN_WIDTH, 45)];
    dbView.backgroundColor=[UIColor colorWithRed:201.0/255.0 green:164.0/255.0 blue:126.0/255.0 alpha:1];
    [headView addSubview:dbView];
    
    UIImageView *lbImageView =[[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 5, 5)];
    lbImageView.backgroundColor=[UIColor redColor];
    [dbView addSubview:lbImageView];
    UILabel *tzLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lbImageView.frame)+5, 0, MAIN_WIDTH-40, 45)];
    tzLabel.font=[UIFont systemFontOfSize:13];
    tzLabel.textColor=[UIColor whiteColor];
    tzLabel.text=@"2017年过期192积分,花掉别浪费～";
    [dbView addSubview:tzLabel];

    UILabel *integLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(dbView.frame)+13+8, MAIN_WIDTH-30, 17)];
    integLabel.font=[UIFont systemFontOfSize:17];
    integLabel.textColor=[UIColor blackColor];
    integLabel.text=@"积分明细";
    [headView addSubview:integLabel];
    return headView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 151+30+8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;

        
        UILabel *zsLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, 0, MAIN_WIDTH-30, 45)];
        zsLabel.font=MAIN_FONT;
        zsLabel.text=[NSString stringWithFormat:@"2018-4-5 签到成功 +2分"];
        zsLabel.textColor=[UIColor blackColor];
        [cell.contentView addSubview:zsLabel];
    }
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
