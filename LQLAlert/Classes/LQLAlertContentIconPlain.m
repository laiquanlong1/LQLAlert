//
//  LQLAlertContentIconPlain.m
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import "LQLAlertContentIconPlain.h"

@implementation LQLAlertContentIconPlain
/**
 默认的提示内容
 
 @return 返回内容对象
 */
+ (LQLAlertContentIconPlain *)defaultAlerContent {
    LQLAlertContentIconPlain *defaultAlerContent = [[LQLAlertContentIconPlain alloc] init];
    defaultAlerContent.message = @"这是内容";
    defaultAlerContent.messageFont = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    defaultAlerContent.messageTextColor = [UIColor colorWithRed:24/255.0 green:24/255.0 blue:24/255.0 alpha:1.0];
    defaultAlerContent.iconSize = CGSizeMake(24., 24.);
    defaultAlerContent.iconName = @"icon_001";
    defaultAlerContent.flag = 1000;
    defaultAlerContent.contentHeight = 106.;
    defaultAlerContent.bgEdge = UIEdgeInsetsZero;
    defaultAlerContent.bgColor = [UIColor clearColor];
    defaultAlerContent.contentAliment = LQLAlertContentIconPlainAlignment_Left;
    defaultAlerContent.contentEdge = UIEdgeInsetsMake(40, 48, 0, 10);
    return defaultAlerContent;
}
@end
