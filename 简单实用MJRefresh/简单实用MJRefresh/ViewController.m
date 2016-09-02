//
//  ViewController.m
//  简单实用MJRefresh
//
//  Created by czbk on 16/9/2.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加刷新控件
    [self setupRefresh];
}

-(void)setupRefresh{
    //MARK: -下拉
    //添加刷新控件
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(download)];
    
    //自动改变透明度
    [self.tableView.mj_header setAutomaticallyChangeAlpha:YES];
    
    //进入控制器后就刷新
    [self.tableView.mj_header beginRefreshing];
    
    //MARK: -上拉
    //
    //self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(downMore)];
    
    //这个样式跟下拉很类似
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(downMore)];
    
    //先隐藏
//    self.tableView.mj_footer.hidden = YES;
}

-(void)downMore{
    NSLog(@"456");
    
    //延时
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //结束刷新
        [self.tableView.mj_footer endRefreshing];
    });
}

-(void)download{
    NSLog(@"123");
    
    //延时
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //结束刷新
        [self.tableView.mj_header endRefreshing];
    });
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = @"13455";
    
    return cell;
}

@end
