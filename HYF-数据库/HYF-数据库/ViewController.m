//
//  ViewController.m
//  HYF-数据库
//
//  Created by Bill on 12/6/16.
//  Copyright © 2016年 my xcode01. All rights reserved.
//

#import "ViewController.h"
#import ""
@interface ViewController ()

@property(nonatomic,strong)FMDatabase *db;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.db=[FMDatabase databaseWithPath:@"/Users/Eldred/Desktop/MySql"];
    [self.db open];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
