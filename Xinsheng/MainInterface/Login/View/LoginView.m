//
//  LoginView.m
//  Xinsheng
//
//  Created by Simson on 2018/4/12.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import "LoginView.h"

@interface LoginView()
{
    NSArray *typeArray;
}
@end
@implementation LoginView

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    
    if (self) {
        [self createUI];
    }
    
    return self;
}


-(void)createUI{
    typeArray=[[NSArray alloc]initWithObjects:@"请输入您的手机号",@"请输入验证码", nil];
//    int dd=/;
    UIImageView *topImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0,0, MAIN_WIDTH, 150)];
    topImageView.backgroundColor=[UIColor redColor];
    [self addSubview:topImageView];
    
    UIButton *backButton =[[UIButton alloc]initWithFrame:CGRectMake(20, 30, 50, 30)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backButton];
    
    for (int i=0; i<typeArray.count; i++) {
        UIImageView *xsImageView =[[UIImageView alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(topImageView.frame)+40+i*50, 25, 25)];
        xsImageView.backgroundColor=[UIColor redColor];
        [self addSubview:xsImageView];
        
        UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(xsImageView.frame)+5, CGRectGetMaxY(topImageView.frame)+30+i*50, MAIN_WIDTH-80, 45)];
        textField.placeholder=typeArray[i];
        [self addSubview:textField];
        if (i==0) {
            UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(textField.frame)+2.5, MAIN_WIDTH-50, 1)];
            hxLabel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
            [self addSubview:hxLabel];
        }
    }
    
    UIButton *loginButton =[[UIButton alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(topImageView.frame)+150, MAIN_WIDTH-50, 40)];
    [loginButton setTitle:@"立即登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font=[UIFont systemFontOfSize:14];
    loginButton.layer.masksToBounds=YES;
    loginButton.layer.cornerRadius=8.0;
    loginButton.backgroundColor=MAIN_COLOR;
    [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:loginButton];
}
-(void)loginButtonClick:(UIButton *)sender{
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"正在登录..." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

-(void)showLoginBlock:(login_block)logBlock{
    _loginBlock=logBlock;
}
-(void)backButtonClick:(UIButton *)sender{
    if (_loginBlock!=nil) {
        _loginBlock(sender);
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
