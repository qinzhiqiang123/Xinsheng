//
//  DiaryView.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "DiaryView.h"

@interface DiaryView()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIView *headView;
    NSArray *tabArray;
    
    NSArray *typeArray;
}

@end
@implementation DiaryView


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
    tabArray=[[NSArray alloc]initWithObjects:@"蜕变日记",@"专家问答", @"科普知识",nil];
    
    _tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    headView =[[UIView alloc]init];
    [self addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tabArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 230;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    headView.backgroundColor=[UIColor whiteColor];
  
    UIImageView *topImageVidew =[[UIImageView alloc]initWithFrame:CGRectMake(15, 15, MAIN_WIDTH-30, 100)];
    topImageVidew.backgroundColor=[UIColor redColor];
    [headView addSubview:topImageVidew];
    
    for (int i=0; i<tabArray.count; i++) {
        UIImageView *tabImageView =[[UIImageView alloc]initWithFrame:CGRectMake(15+i*(80+(MAIN_WIDTH-80*3-30)/2),CGRectGetMaxY(topImageVidew.frame)+15, 80, 80)];
        tabImageView.backgroundColor=[UIColor redColor];
        tabImageView.layer.masksToBounds=YES;
        tabImageView.layer.cornerRadius=40.0;
        [headView addSubview:tabImageView];
        
        UILabel *tabLabel =[[UILabel alloc]initWithFrame:CGRectMake(15+i*(80+(MAIN_WIDTH-80*3-30)/2),CGRectGetMaxY(tabImageView.frame)+10, 80, 14)];
        tabLabel.text=tabArray[i];
        tabLabel.font=[UIFont systemFontOfSize:14];
        tabLabel.textColor=[UIColor blackColor];
        tabLabel.textAlignment=NSTextAlignmentCenter;
        [headView addSubview:tabLabel];
        
        UIButton *tabButton =[[UIButton alloc]initWithFrame:CGRectMake(15+i*(80+(MAIN_WIDTH-80*3-30)/2),CGRectGetMaxY(topImageVidew.frame)+15, 80, 100)];
        [tabButton addTarget:self action:@selector(tabButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [tabButton setTitle:tabArray[i] forState:UIControlStateNormal];
        [tabButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [headView addSubview:tabButton];
      
    }
    

    
    return headView;
}

-(void)tabButtonClick:(UIButton *)sender{
    if (_diaryBlock!=nil) {
        _diaryBlock(sender.titleLabel.text);
    }
}

-(void)showDiaryBlock:(diary_block) diaBlock{
    _diaryBlock=diaBlock;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 270;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIImageView *userImageView =[[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 60, 60)];
        userImageView.backgroundColor=[UIColor redColor];
        userImageView.layer.masksToBounds=kCGImagePropertyExifFocalPlaneYResolution;
        userImageView.layer.cornerRadius=30.0;
        [cell.contentView addSubview:userImageView];
        
        UILabel *userNameLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(userImageView.frame)+15, 15, 100, 60)];
        userNameLabel.text=@"新生测试用户名";
        userNameLabel.font=[UIFont systemFontOfSize:14];
        userNameLabel.textColor=[UIColor blackColor];
        [cell.contentView addSubview:userNameLabel];
        
        UILabel *descLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(userNameLabel.frame)+15, MAIN_WIDTH-30, 35)];
        descLabel.text=@"这是术后第10天的照片，头发已经完完全全的长出来了，没有出现掉发等不良现象。新生植发值得信赖！这是术后第10天的照片，头发已经完完全全的长出来了，没有出现掉发等不良现象。新生植发值得信赖！";
        descLabel.font=[UIFont systemFontOfSize:13];
        descLabel.textColor=[UIColor grayColor];
        descLabel.numberOfLines=0;
        [cell.contentView addSubview:descLabel];
        
        for (int i=0; i<2; i++) {
            UIImageView *zsImageView =[[UIImageView alloc]initWithFrame:CGRectMake(15+i*((MAIN_WIDTH-45)/2+15), CGRectGetMaxY(descLabel.frame)+15, (MAIN_WIDTH-45)/2, 100)];
            zsImageView.backgroundColor=[UIColor redColor];
            [cell.contentView addSubview:zsImageView];
        }
        

        
        UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(descLabel.frame)+130, MAIN_WIDTH, 10)];
        hxLabel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        [cell.contentView addSubview:hxLabel];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
