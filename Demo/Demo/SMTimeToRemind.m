//  到期提醒
//  SMScanQRCoreController.h
//
//  Email : white_screen@163.com
//  QQ : 404401637
//  Created by 陈沈明 on 15/6/18.
//  Copyright © 2015年 . All rights reserved.
//

#import "SMTimeToRemind.h"

@implementation SMTimeToRemind
- (void)startRemindWithDate:(NSDate *)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compt =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth) fromDate:date];
    
    //开启子线程监听时间改变
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        while (1) {
            NSDate *currentDate = [NSDate date];

            NSDateComponents *currentCompt =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth) fromDate:currentDate];
            
            //这里我就不对比年了，时间太长了吧。。。。
            if (compt.hour == currentCompt.hour && compt.minute == currentCompt.minute && compt.second == currentCompt.second && compt.day == currentCompt.day && compt.month == currentCompt.month) {
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

- (void)startRemindWithDate:(NSDate *)date didremind:(remind)remind
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compt =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth) fromDate:date];
    
    //开启子线程监听时间改变
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        while (1) {
            NSDate *currentDate = [NSDate date];
            
            NSDateComponents *currentCompt =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth) fromDate:currentDate];
            
            //这里我只对比了时、分、秒
            if (compt.hour == currentCompt.hour && compt.minute == currentCompt.minute && compt.second == currentCompt.second && compt.day == currentCompt.day && compt.month == currentCompt.month) {
                break;
            }
            
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            remind();
        });
    });
}
@end
