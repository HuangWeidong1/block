//
//  ViewController.m
//  block
//
//  Created by 中软mini025 on 15/10/28.
//  Copyright (c) 2015年 中软mini025. All rights reserved.
//

#import "ViewController.h"
#import "FristViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
-(void)initUI
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 60, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"狂点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 1000;
    [self.view addSubview:btn];
//    UITableView* tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    
//    [self.view addSubview:tableView];
}

-(void)btnClick:(id)sender
{
    FristViewController* frist = [[FristViewController alloc] init];
    frist.blk = ^(NSString* info){
        [self setBtnClick:info];
    };
    
    
    [self.navigationController pushViewController:frist animated:YES];
}

-(void)setBtnClick:(id)sender
{
    NSString* info = (NSString*)sender;
    
    UIButton* btn = (UIButton*)[self.view viewWithTag:1000];
    
    [btn setTitle:info forState:UIControlStateNormal];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellName = @"cellName";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    return cell;
}

-(void)testMyBlock:(Type_blk)myBlock
{
    if (myBlock) {
        myBlock(@"不会么？找我啊！");
    }
}
@end
