//
//  ViewController.m
//  Demo
//
//  Created by 123456 on 15/12/24.
//  Copyright © 2015年 123456. All rights reserved.
//

#import "ViewController.h"
#import "SMTimeToRemind.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    SMTimeToRemind *timeRemind = [[SMTimeToRemind alloc] init];

    [timeRemind startRemindWithDate:[[NSDate date] dateByAddingTimeInterval:10] didremind:^{
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提醒" message:@"您购买的电影票还有十分钟就开始了哦！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
    }];

}



@end
