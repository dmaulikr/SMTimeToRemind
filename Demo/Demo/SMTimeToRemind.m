//  到期提醒
//  SMScanQRCoreController.h
//
//  Email : white_screen@163.com
//  QQ : 404401637
//  Created by 陈沈明 on 15/6/18.
//  Copyright © 2015年 . All rights reserved.
//

#import "SMTimeToRemind.h"
#define TerminateTime @"TerminateTime"

@implementation SMTimeToRemind
- (void)startRemindWithDate:(NSDate *)RemindTime
{
    //开启子线程监听时间改变
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (1) {//循环对比当前时间
            NSDate *currentDate = [NSDate date];
            
            if ([RemindTime isEqualToDate:currentDate]) {
                break;
            }
            
        }
        
        //返回主线程执行到时提醒
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            if ([self.delegate respondsToSelector:@selector(timeToRemindDidStopMonitoring:)]) {
                [self.delegate timeToRemindDidStopMonitoring:self];
            }
        });
    });

}

- (void)startRemindWithDate:(NSDate *)RemindTime didremind:(remind)remind
{
    //开启子线程监听时间改变
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (1) {//循环对比当前时间
            NSDate *currentDate = [NSDate date];
            
            if ([RemindTime isEqualToDate:currentDate]) {
                break;
            }
            
        }
        //返回主线程执行到时提醒
        dispatch_sync(dispatch_get_main_queue(), ^{
            remind();
        });
    });
}

/**
 *  记录程序被关闭的时间点,请在“applicationWillTerminate”方法中调用
 */
+ (void)recordTerminateTime
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:TerminateTime];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
