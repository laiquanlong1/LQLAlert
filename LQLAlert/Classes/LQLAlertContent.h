//
//  LQLAlertContent.h
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

/**
 内容对齐方式
 
 - LQLAlertContentIconPlainAlignment_Left: 左对齐
 - LQLAlertContentIconPlainAlignment_Right: 右对齐
 - LQLAlertContentIconPlainAlignment_Center: 中心对齐
 */
typedef NS_ENUM(NSInteger,LQLAlertContentIconPlainAlignment) {
    LQLAlertContentIconPlainAlignment_Left,
    LQLAlertContentIconPlainAlignment_Right,
    LQLAlertContentIconPlainAlignment_Center
};


/**
 内容视图基类
 */
@interface LQLAlertContent : NSObject
// 内容对齐方式
@property (nonatomic, assign) LQLAlertContentIconPlainAlignment contentAliment;
// 内容背景视图的缩进
@property (nonatomic, assign) UIEdgeInsets bgEdge;
// 内容的缩进
@property (nonatomic, assign) UIEdgeInsets contentEdge;
// 内容视图高度
@property (nonatomic, assign) CGFloat contentHeight;
// 背景颜色
@property (nonatomic, strong) UIColor *bgColor;
// 标识，便于查找视图
@property (nonatomic, assign) NSUInteger flag;


/**
 默认的提示内容

 @return 返回内容对象
 */
+ (LQLAlertContent *)defaultAlerContent;
@end

NS_ASSUME_NONNULL_END
