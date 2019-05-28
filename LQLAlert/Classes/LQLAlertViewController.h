//
//  LQLAlertViewController.h
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQLAlertContent.h"
#import "LQLAlertContentIconPlain.h"
#import "LQLAlertTitleConfigModel.h"
#import "LQLAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface LQLAlertViewController : UIViewController
// 标题
@property (nonatomic, copy) NSString *titString;
// 线的宽度
@property (nonatomic, assign) CGFloat lineWidth;
// 线条的颜色
@property (nonatomic, strong) UIColor *lineColor;
// 线条的边缘
@property (nonatomic, assign) UIEdgeInsets lineEdge;
// 标题的配置类
@property (nonatomic, strong) LQLAlertTitleConfigModel *titConfig;
// 内容视图配置
@property (nonatomic, strong) LQLAlertContent *alertContent;
// 左右边缘宽度 默认 38
@property (nonatomic, assign) CGFloat margin;
// 窗口的颜色
@property (nonatomic, strong) UIColor *windColor;
// 背景颜色 默认的为 0.5 黑色
@property (nonatomic, strong) UIColor *backgroundColor;
// 圆角
@property (nonatomic, assign) CGFloat windCornerRadius;
// 按钮的高度
@property (nonatomic, assign) CGFloat actionHeight;

/**
 添加按钮

 @param action 添加的按钮配置Model
 */
- (void)addAction:(LQLAlertAction *)action;

/**
 工厂方法创建实例

 @param title 标题
 @param alertContent 弹窗内容视图 
 @return 控制器
 */
+ (LQLAlertViewController *)alertTitle:(NSString *)title alertContent:(LQLAlertContent *)alertContent;
@end

NS_ASSUME_NONNULL_END
