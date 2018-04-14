//
//  MallView.m
//  Xinsheng
//
//  Created by Simson on 2018/4/11.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "MallView.h"
#import "ProductModel.h"
#import "ProduceTableViewCell.h"
@interface MallView()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIView *headView;
    NSMutableArray *_array;
    NSArray *typeArray;
}
@end
@implementation MallView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self showDate];
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    typeArray=[[NSArray alloc]initWithObjects:@"全国",@"推荐特惠", nil];
    _tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    headView=[[UIView alloc]init];
    [self addSubview:_tableView];
}

-(void)showDate
{
    _array=[[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        ProductModel *model =[[ProductModel alloc]init];
        model.productId=[NSString stringWithFormat:@"%i",i];
        model.productName=@"【新生植发】";
        model.productDesc=@"采用全国最新的技术，安全、无副作用！采用全国最新的技术，安全、无副作用！";
        model.productOrPrice=@"10000";
        model.productPrice=@"6666";
        model.productSold=@"44";
        [_array addObject:model];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 46;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    headView.backgroundColor=[UIColor whiteColor];
    for (int i =0; i<typeArray.count; i++) {
        UIButton *anButton =[[UIButton alloc]initWithFrame:CGRectMake(0+MAIN_WIDTH/2*i, 0, MAIN_WIDTH/2, 45)];
        [anButton setTitle:typeArray[i] forState:UIControlStateNormal];
        [anButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        anButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [headView addSubview:anButton];
        if (i==1) {
            UILabel *sxLabel =[[UILabel alloc]initWithFrame:CGRectMake(MAIN_WIDTH/2, 0, 1, 45)];
            sxLabel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
            [headView addSubview:sxLabel];
        }
    }
    UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 45, MAIN_WIDTH, 1)];
    hxLabel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    [headView addSubview:hxLabel];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProduceTableViewCell *cell = [ProduceTableViewCell cellWithTableView:tableView];
    cell.showModel=_array[indexPath.row];
    
    return cell;
}

-(void)showMallBlock:(mall_block)maBlock
{
    _mallBlock=maBlock;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_mallBlock!=nil){
        _mallBlock(_array[indexPath.row]);
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
