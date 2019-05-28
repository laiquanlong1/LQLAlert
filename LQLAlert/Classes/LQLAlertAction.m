//
//  LQLAlertAction.m
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import "LQLAlertAction.h"

@implementation LQLAlertAction


/**
 创建方法对象
 
 @param title 标题
 @param handler 处理的回调
 @return 返回方法对象
 */
+ (LQLAlertAction *)anctionWithTitle:(NSString *)title handler:(void (^)(UIButton * _Nonnull))handler {
    LQLAlertAction *actionModel = [[LQLAlertAction alloc] init];
    actionModel.title = title;
    actionModel.handler = handler;
    actionModel.foregroundColor = [UIColor colorWithRed:24/255.0 green:24/255.0 blue:24/255.0 alpha:1.0]; // #181818
    actionModel.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    actionModel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    return actionModel;
}




@end
