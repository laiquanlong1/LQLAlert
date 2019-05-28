//
//  LQLAlertTitleConfigModel.h
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LQLAlertTitleConfigModel : NSObject
// 标题视图高度
@property (nonatomic, assign) CGFloat titHeight;
// attribute
@property (nonatomic, strong) NSDictionary *attributes;
// 标题对齐方式
@property (nonatomic, assign) NSTextAlignment titleAlignment;
// 标题上下左右的距离
@property (nonatomic, assign) UIEdgeInsets edge;
// 左右的距离
@property (nonatomic, assign) CGFloat margin;
@end

NS_ASSUME_NONNULL_END
