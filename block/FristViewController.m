//
//  FristViewController.m
//  block
//
//  Created by 中软mini025 on 15/10/28.
//  Copyright (c) 2015年 中软mini025. All rights reserved.
///Users/zhongruanmini025/Desktop/block/block.xcodeproj

#import "FristViewController.h"
#import "ViewController.h"

@interface FristViewController ()
{
    int a;
}
@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (_blk) {
        UITextField* textField = (UITextField*)[self.view viewWithTag:1002];
        if (textField&&textField.text.length>0) {
            _blk(textField.text);
        }
    }
}

-(void)initUI
{
    UITextField* edit = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20, 50)];
    edit.backgroundColor = [UIColor grayColor];
    edit.tag = 1002;
    [self.view addSubview:edit];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 60, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"狂点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 1010;
    [self.view addSubview:btn];
    a = 0;
}

-(void)btnClick:(id)sender
{
    a++;
    
    ViewController* viewCtr = [[ViewController alloc] init];
    if (a>5) {
         UITextField* textField = (UITextField*)[self.view viewWithTag:1002];
        textField.text =@"点两下就得了呗！再不会我也没办法";
        return;
    }
    [viewCtr testMyBlock:^(NSString* info){
        UITextField* textField = (UITextField*)[self.view viewWithTag:1002];
        textField.text = info;
    }];
}

@end
