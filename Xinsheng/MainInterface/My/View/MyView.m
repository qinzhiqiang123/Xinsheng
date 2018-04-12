//
//  MyView.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "MyView.h"


@interface MyView()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *myArray;
    UIView *headView;
    
}
@end
@implementation MyView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    
    return self;
}

-(void)createUI{
    myArray=[[NSArray alloc]initWithObjects:@"我的积分",@"我的回答",@"我的帖子",@"好友邀请", nil];
    _tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
 
//    _tableView.tableHeaderView=headView;
       headView=[[UIView alloc]init];
    [self addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return myArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *headImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, 170)];
    headImageView.backgroundColor=[UIColor redColor];
    [headView addSubview:headImageView];
    
    UIButton *szButton =[[UIButton alloc]initWithFrame:CGRectMake(MAIN_WIDTH-50, 15, 30, 20)];
    [szButton setTitle:@"设置" forState:UIControlStateNormal];
    [szButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    szButton.titleLabel.font=[UIFont systemFontOfSize:14];
    [headView addSubview:szButton];
    
    UILabel *tsLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(szButton.frame)+15, MAIN_WIDTH, 14)];
    tsLabel.font=[UIFont systemFontOfSize:15];
    tsLabel.textAlignment=NSTextAlignmentCenter;
    tsLabel.text=@"快来登录把～";
    [headView addSubview:tsLabel];
    
    UIButton *loginButton =[[UIButton alloc]initWithFrame:CGRectMake((MAIN_WIDTH-100)/2, CGRectGetMaxY(tsLabel.frame)+15, 100, 30)];
    loginButton.layer.masksToBounds=YES;
    loginButton.layer.cornerRadius=15.0;
    loginButton.backgroundColor=[UIColor grayColor];
    [loginButton setTitle:@"登录/注册" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    loginButton.titleLabel.font=[UIFont systemFontOfSize:13];
    [headView addSubview:loginButton];
    
    UIButton *qdButton =[[UIButton alloc]initWithFrame:CGRectMake(MAIN_WIDTH-85, CGRectGetMaxY(loginButton.frame)+15, 100, 30)];
    [qdButton setImage:[UIImage imageNamed:@"icon_shouye"] forState:UIControlStateNormal];
    [qdButton setTitle:@"签到" forState:UIControlStateNormal];
    [qdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    qdButton.layer.masksToBounds=YES;
    qdButton.layer.cornerRadius=15.0;
    qdButton.backgroundColor=[UIColor colorWithRed:233.0/255.0 green:163.0/255.0 blue:195.0/255.0 alpha:1];
    qdButton.imageEdgeInsets = UIEdgeInsetsMake(0, qdButton.frame.size.width - qdButton.imageView.frame.origin.x - qdButton.imageView.frame.size.width, 0, 0);
    [headView addSubview:qdButton];
    
    return headView;
}

-(void)loginButtonClick:(UIButton *)sender{
    if (_myBlock!=nil) {
        _myBlock(sender.titleLabel.text);
    }
}

-(void)showBlock:(my_block)mBlock
{
    _myBlock=mBlock;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 170;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        UIImageView *zsImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 17.5, 20, 20)];
        zsImageView.image=[UIImage imageNamed:myArray[indexPath.row]];
        zsImageView.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:zsImageView];
        
       
        UILabel *zsLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(zsImageView.frame)+15, 0, MAIN_WIDTH-100, 45)];
        zsLabel.font=MAIN_FONT;
        zsLabel.text=myArray[indexPath.row];
        zsLabel.textColor=[UIColor blackColor];
        [cell.contentView addSubview:zsLabel];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_myBlock!=nil) {
        _myBlock(myArray[indexPath.row]);
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
