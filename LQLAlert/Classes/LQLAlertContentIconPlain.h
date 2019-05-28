//
//  LQLAlertContentIconPlain.h
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import "LQLAlertContent.h"

NS_ASSUME_NONNULL_BEGIN


/**
 *  带图标的普通内容
 */
@interface LQLAlertContentIconPlain : LQLAlertContent
// 图片名字
@property (nonatomic, copy) NSString *iconName;
// 图片URL
@property (nonatomic, copy) NSString *imgURL;
// 图标大小
@property (nonatomic, assign) CGSize iconSize;
// 显示的信息
@property (nonatomic, copy) NSString *message;
// 信息显示的字体
@property (nonatomic, strong) UIFont *messageFont;
// 信息显示的字颜色
@property (nonatomic, strong) UIColor *messageTextColor;


/**
 默认的提示内容
 
 @return 返回内容对象
 */
+ (LQLAlertContentIconPlain *)defaultAlerContent;

@end

NS_ASSUME_NONNULL_END
