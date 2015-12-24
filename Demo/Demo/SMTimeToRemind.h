//  到期提醒
//  SMScanQRCoreController.h
//
//  Email : white_screen@163.com
//  QQ : 404401637
//  Created by 陈沈明 on 15/6/18.
//  Copyright © 2015年 . All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^remind) ();

@class SMTimeToRemind;
@protocol SMtimeToRemindDelegate <NSObject>
@required
/**
 *  当到达需要提醒的时间，结束监听时间，来到该方法 （可以在该方法中自行实现一些到时需要提醒的事件）
 */
- (void)timeToRemindDidStopMonitoring:(SMTimeToRemind *)Remind;

@end

@interface SMTimeToRemind : NSObject
/**
 *  开始监听时间，到时回调代理方法
 *
 *  @param date 需要什么时间提醒
 */
- (void)startRemindWithDate:(NSDate *)date;

/**
 *  开始监听时间，到时回调代理方法
 *
 *  @param date 需要什么时间提醒
 */
- (void)startRemindWithDate:(NSDate *)date didremind:(remind)remind;


@property (nonatomic, assign) id<SMtimeToRemindDelegate> delegate;
@end
