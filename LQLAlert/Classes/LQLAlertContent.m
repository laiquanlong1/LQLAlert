//
//  LQLAlertContent.m
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import "LQLAlertContent.h"

@implementation LQLAlertContent
/**
 默认的提示内容
 
 @return 返回内容对象
 */
+ (LQLAlertContent *)defaultAlerContent {
    LQLAlertContent *defaultAlerContent = [[LQLAlertContent alloc] init];
    defaultAlerContent.flag = 1000;
    defaultAlerContent.contentHeight = 106.;
    defaultAlerContent.bgEdge = UIEdgeInsetsZero;
    defaultAlerContent.bgColor = [UIColor clearColor];
    defaultAlerContent.contentAliment = LQLAlertContentIconPlainAlignment_Left;
    defaultAlerContent.contentEdge = UIEdgeInsetsMake(40, 48, 0, 10);
    return defaultAlerContent;
}
@end
