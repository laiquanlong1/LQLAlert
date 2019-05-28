//
//  LQLAlertAction.h
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LQLAlertAction : NSObject
// 动作标题
@property (nonatomic, copy) NSString *title;
// 动作前景色
@property (nonatomic, strong) UIColor *foregroundColor;
// 动作的背景色
@property (nonatomic, strong) UIColor *backgroundColor;
// 字体
@property (nonatomic, strong) UIFont *font;
// 处理的回调
@property (nonatomic, copy) void(^handler)(UIButton *btn);

/**
 创建方法对象

 @param title 标题
 @param handler 处理的回调
 @return 返回方法对象
 */
+ (LQLAlertAction *)anctionWithTitle:(NSString *)title handler:(void(^)(UIButton *btn))handler;
@end

NS_ASSUME_NONNULL_END
