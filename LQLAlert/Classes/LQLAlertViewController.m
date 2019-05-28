//
//  LQLAlertViewController.m
//  Demo
//
//  Created by HoTia on 2019/4/21.
//  Copyright © 2019 Purple long technology  co.,LTD. All rights reserved.
//

#import "LQLAlertViewController.h"

@interface LQLAlertViewController ()
// 方法数组
@property (nonatomic, strong) NSMutableArray <LQLAlertAction *>*actionArr;
// 方法按钮数组
@property (nonatomic, strong) NSMutableArray <UIButton *>*actionBtns;
// 背景视图
@property (nonatomic, strong) UIView *windBgView;
// 标题背景视图
@property (nonatomic, strong) UIView *titBgView;
// 标题
@property (nonatomic, strong) UILabel *titLabel;
// 标题线
@property (nonatomic, strong) UIView *lineView;
// 方法按钮上面的线
@property (nonatomic, strong) UIView *line2View;
// 方法背景
@property (nonatomic, strong) UIView *actionBgView;
// 背景视图
@property (nonatomic, strong) UIVisualEffectView *effectView;
@end

@implementation LQLAlertViewController


#pragma mark setter

// 圆角
- (void)setWindCornerRadius:(CGFloat)windCornerRadius {
    _windCornerRadius = windCornerRadius;
    self.windBgView.layer.cornerRadius = windCornerRadius;
}

// 设置背景色
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    self.view.backgroundColor = backgroundColor;
}

// 设置窗口颜色
- (void)setWindColor:(UIColor *)windColor {
    _windColor = windColor;
    self.windBgView.backgroundColor = windColor;
}

// 设置左右的边缘宽度
- (void)setMargin:(CGFloat)margin {
    _margin = margin;
    [self updateConsraints];
}

// 设置标题视图
- (void)setTitConfig:(LQLAlertTitleConfigModel *)titConfig {
    _titConfig = titConfig;
    [self addTitView];
}

// 设置标题
- (void)setTitString:(NSString *)titString {
    _titString = titString;
    if (self.titConfig && self.titConfig.attributes) {
        self.titLabel.attributedText = [[NSAttributedString alloc] initWithString:titString?titString:@"" attributes:self.titConfig.attributes];
    }else {
        self.titLabel.text = titString;
    }
}

// 设置线宽
- (void)setLineEdge:(UIEdgeInsets)lineEdge {
    _lineEdge = lineEdge;
    [self updateConsraints];
}

// 线宽
- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    [self updateConsraints];
}

// 线的颜色
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    self.lineView.backgroundColor = lineColor;
    self.line2View.backgroundColor = lineColor;
}

// 内容视图
- (void)setAlertContent:(LQLAlertContent *)alertContent {
    _alertContent = alertContent;
    [self updateConsraints];
}




#pragma mark Add sub Views

/**
 添加标题视图
 */
- (void)addTitView {
    
    if (self.titConfig) {
        if (![self.windBgView.subviews containsObject:self.titBgView]) {
            [self.windBgView addSubview:self.titBgView];
        }
          self.titBgView.backgroundColor = (self.titConfig.attributes&&self.titConfig.attributes[NSBackgroundColorAttributeName])?self.titConfig.attributes[NSBackgroundColorAttributeName]:[UIColor clearColor];
        if (![self.titBgView.subviews containsObject:self.titLabel]) {
            [self.titBgView addSubview:self.titLabel];
        }
        self.titLabel.backgroundColor = [UIColor clearColor];
        self.titLabel.textAlignment = self.titConfig.titleAlignment;
        if (self.titString) {
            if (self.titConfig.attributes) {
                self.titLabel.attributedText = [[NSAttributedString alloc] initWithString:self.titString?self.titString:@"" attributes:self.titConfig.attributes];
            }
        }
        
        if (![self.windBgView.subviews containsObject:self.lineView]) {
            [self.windBgView addSubview:self.lineView];
        }
        
        [self updateConsraints];
    }
}



/**
  更新约束
 */
- (void)updateConsraints {
    // 清除约束
    [NSLayoutConstraint deactivateConstraints:self.view.constraints];
    [NSLayoutConstraint deactivateConstraints:self.windBgView.constraints];
    [NSLayoutConstraint deactivateConstraints:self.titBgView.constraints];
    [NSLayoutConstraint deactivateConstraints:self.titLabel.constraints];
    [NSLayoutConstraint deactivateConstraints:self.lineView.constraints];
    
    // 窗口的高度
    CGFloat windHeight = 0.0f;
    
    // 背景视图的约束
    [[self.windBgView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:self.margin] setActive:YES];
    [[self.windBgView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-self.margin] setActive:YES];
    [[self.windBgView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:0] setActive:YES];
    
    
    
    // 标题部分
    if (self.titConfig) {
        [[self.titBgView.leftAnchor constraintEqualToAnchor:self.windBgView.leftAnchor constant:self.titConfig.edge.left] setActive:YES];
        [[self.titBgView.rightAnchor constraintEqualToAnchor:self.windBgView.rightAnchor constant:-self.titConfig.edge.right] setActive:YES];
        [[self.titBgView.heightAnchor constraintEqualToConstant:self.titConfig.titHeight] setActive:YES];
        [[self.titBgView.topAnchor constraintEqualToAnchor:self.windBgView.topAnchor constant:self.titConfig.edge.top] setActive:YES];
        
        
        [[self.titLabel.leftAnchor constraintEqualToAnchor:self.titBgView.leftAnchor constant:self.titConfig.margin] setActive:YES];
        [[self.titLabel.rightAnchor constraintEqualToAnchor:self.titBgView.rightAnchor constant:-self.titConfig.margin] setActive:YES];
        [[self.titLabel.topAnchor constraintEqualToAnchor:self.titBgView.topAnchor constant:0] setActive:YES];
        [[self.titLabel.bottomAnchor constraintEqualToAnchor:self.titBgView.bottomAnchor constant:0] setActive:YES];
        
        
        [[self.lineView.leftAnchor constraintEqualToAnchor:self.windBgView.leftAnchor constant:self.lineEdge.left] setActive:YES];
        [[self.lineView.rightAnchor constraintEqualToAnchor:self.windBgView.rightAnchor constant:-self.lineEdge.right] setActive:YES];
        [[self.lineView.heightAnchor constraintEqualToConstant:self.lineWidth] setActive:YES];
        [[self.lineView.topAnchor constraintEqualToAnchor:self.titBgView.bottomAnchor constant:0] setActive:YES];
        
        // 添加wind高度
        windHeight += self.titConfig.titHeight;
    }
    
    
    // 内容配置
    if (self.alertContent) {
        [self configContentView];
        // 添加wind高度
        windHeight += self.alertContent.contentHeight;
        if (![self.windBgView.subviews containsObject:self.line2View]) {
            [self.windBgView addSubview:self.line2View];
        }
        [NSLayoutConstraint deactivateConstraints:self.line2View.constraints];
        [[self.line2View.leftAnchor constraintEqualToAnchor:self.windBgView.leftAnchor constant:self.lineEdge.left] setActive:YES];
        [[self.line2View.rightAnchor constraintEqualToAnchor:self.windBgView.rightAnchor constant:-self.lineEdge.right] setActive:YES];
        [[self.line2View.heightAnchor constraintEqualToConstant:self.lineWidth] setActive:YES];
        [[self.line2View.topAnchor constraintEqualToAnchor:self.lineView.bottomAnchor constant:self.alertContent.contentHeight] setActive:YES];
    }

    // 按钮配置
    if (self.actionArr.count) {
        windHeight += self.actionHeight?self.actionHeight:54.;
        if (![self.windBgView.subviews containsObject:self.actionBgView]) {
            [self.windBgView addSubview:self.actionBgView];
        }
        [NSLayoutConstraint deactivateConstraints:self.actionBgView.constraints];
        [[self.actionBgView.topAnchor constraintEqualToAnchor:self.line2View.bottomAnchor] setActive:YES];
        [[self.actionBgView.leftAnchor constraintEqualToAnchor:self.windBgView.leftAnchor] setActive:YES];
        [[self.actionBgView.rightAnchor constraintEqualToAnchor:self.windBgView.rightAnchor] setActive:YES];
        [[self.actionBgView.bottomAnchor constraintEqualToAnchor:self.windBgView.bottomAnchor] setActive:YES];
        
        

        
        UIButton *actionBtn = [self.actionBtns firstObject];
        [NSLayoutConstraint deactivateConstraints:actionBtn.constraints];
        [[actionBtn.topAnchor constraintEqualToAnchor:self.actionBgView.topAnchor] setActive:YES];
        [[actionBtn.leftAnchor constraintEqualToAnchor:self.actionBgView.leftAnchor] setActive:YES];
        [[actionBtn.heightAnchor constraintEqualToConstant:self.actionHeight?self.actionHeight:54.] setActive:YES];
        for (int i = 1; i < self.actionBtns.count; i ++) {
            UIButton *btn = self.actionBtns[i];
            [NSLayoutConstraint deactivateConstraints:btn.constraints];
            [[btn.topAnchor constraintEqualToAnchor:self.actionBgView.topAnchor] setActive:YES];
            [[btn.leftAnchor constraintEqualToAnchor:actionBtn.rightAnchor constant:1] setActive:YES];
            [[btn.heightAnchor constraintEqualToConstant:self.actionHeight?self.actionHeight:54.] setActive:YES];
            [[btn.widthAnchor constraintEqualToAnchor:actionBtn.widthAnchor multiplier:1.0] setActive:YES];
            if (i == self.actionBtns.count-1) {
                [[btn.rightAnchor constraintEqualToAnchor:self.actionBgView.rightAnchor] setActive:YES];
            }else {
             actionBtn = btn;
            }
        }
    }
    [[self.windBgView.heightAnchor constraintEqualToConstant:windHeight] setActive:YES];
    self.windBgView.clipsToBounds = YES;
}






/**
 配置内容视图
 */
- (void)configContentView {
    
    UIView *bgView = [self.windBgView viewWithTag:10000];
    if (bgView == nil) {
        bgView = [[UIView alloc] init];
        bgView.tag = 10000;
        bgView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if (![self.windBgView.subviews containsObject:bgView]) {
        [self.windBgView addSubview:bgView];
    }
    
    bgView.backgroundColor = self.alertContent.bgColor?self.alertContent.bgColor:[UIColor redColor];
    [NSLayoutConstraint deactivateConstraints:bgView.constraints];
    [[bgView.leftAnchor constraintEqualToAnchor:self.windBgView.leftAnchor constant:self.alertContent.bgEdge.left] setActive:YES];
    [[bgView.rightAnchor constraintEqualToAnchor:self.windBgView.rightAnchor constant:-self.alertContent.bgEdge.right] setActive:YES];
    [[bgView.topAnchor constraintEqualToAnchor:self.lineView.bottomAnchor constant:0] setActive:YES];
    [[bgView.heightAnchor constraintEqualToConstant:self.alertContent.contentHeight] setActive:YES];
    
    // 配置内容视图
    if ([self.alertContent isKindOfClass:[LQLAlertContentIconPlain class]]) {
        [self configAlertContentIconPlain:bgView];
    }
}






#pragma mark getter

// 窗口背景视图
- (UIView *)windBgView {
    if (_windBgView == nil) {
        _windBgView = [[UIView alloc] init];
        _windBgView.layer.cornerRadius = 10.f;
        _windBgView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _windBgView;
}

// 标题背景视图
- (UIView *)titBgView {
    if (_titBgView == nil) {
        _titBgView = [[UIView alloc] init];
        _titBgView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _titBgView;
}

// 标题Label
- (UILabel *)titLabel {
    if (_titLabel == nil) {
        _titLabel = [[UILabel alloc] init];
         _titLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _titLabel;
}

// 线条的颜色
- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _lineView;
}

- (UIView *)line2View {
    if (_line2View == nil) {
        _line2View = [[UIView alloc] init];
        _line2View.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _line2View;
}

- (UIView *)actionBgView {
    if (_actionBgView == nil) {
        _actionBgView = [UIView new];
        _actionBgView.backgroundColor = self.lineColor?self.lineColor:[UIColor colorWithRed:223./255. green:223./255. blue:223./255. alpha:1.0f];
        _actionBgView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _actionBgView;
}


- (NSMutableArray<LQLAlertAction *> *)actionArr {
    if (_actionArr == nil) {
        _actionArr = [NSMutableArray array];
    }
    return _actionArr;
}

- (NSMutableArray<UIButton *> *)actionBtns {
    if (_actionBtns == nil) {
        _actionBtns = [NSMutableArray array];
    }
    return _actionBtns;
}

#pragma mark initalize

/**
 工厂方法创建实例
 
 @param title 标题
 @param alertContent 弹窗内容视图
 @return 控制器
 */
+ (LQLAlertViewController *)alertTitle:(NSString *)title alertContent:(LQLAlertContent *)alertContent {
    LQLAlertViewController *alertVC = [[LQLAlertViewController alloc] init];
    alertVC.alertContent = alertContent;
    alertVC.titString = title;
    return alertVC;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.windBgView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.windBgView.transform = CGAffineTransformIdentity;
    } completion:nil];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        // 呈现的样式
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        
        // 默认设置
        self.windCornerRadius = 5.f;
//        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        self.windColor = [UIColor whiteColor];
        self.margin = 38.f;
        LQLAlertTitleConfigModel *titConfig = [[LQLAlertTitleConfigModel alloc] init];
        titConfig.edge = UIEdgeInsetsZero;
        titConfig.attributes = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:17],NSForegroundColorAttributeName:[UIColor colorWithRed:24/255.0 green:24/255.0 blue:24/255.0 alpha:1.0]};
        titConfig.margin = 15.f;
        titConfig.titHeight = 44.f;
        titConfig.titleAlignment = NSTextAlignmentCenter;
        self.titConfig = titConfig;
        self.lineWidth = 1.f;
        self.lineEdge = UIEdgeInsetsZero;
        self.lineColor = [UIColor colorWithRed:223./255. green:223./255. blue:223./255. alpha:1.0f];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIBlurEffect *bureffect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleDark)];
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:bureffect];
    self.effectView.frame = self.view.bounds;
    self.effectView.alpha = 0.8;
    [self.view addSubview:self.effectView];

    [self.view addSubview:self.windBgView];
}

- (void)dealloc {
    NSLog(@"释放了");
}

#pragma mark addAction

- (void)addAction:(LQLAlertAction *)action {
    [self.actionArr addObject:action];
    if (self.actionBtns==nil) {
        self.actionBtns = [NSMutableArray array];
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn setTitleColor:action.foregroundColor forState:UIControlStateNormal];
    [btn setBackgroundColor:action.backgroundColor];
    [btn setTitle:action.title forState:UIControlStateNormal];
    [btn.titleLabel setFont:action.font];
    [btn addTarget:self action:@selector(actionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.actionBtns addObject:btn];
    [self.actionBgView addSubview:btn];
    [self updateConsraints];
}




- (void)configActionBtn {
    
}

- (IBAction)actionBtnAction:(UIButton *)btn {
    LQLAlertAction *action = self.actionArr[[self.actionBtns indexOfObject:btn]];
    if (action.handler) {
        action.handler(btn);
    } 
//    [UIView animateWithDuration:0.15 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        self.windBgView.transform = CGAffineTransformMakeScale(0.01, 0.01);
//    } completion:^(BOOL finished) {
//        
//    }];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark 配置内容视图
/**
 配置图标
 
 @param bgView 背景视图
 */
- (void)configAlertContentIconPlain:(UIView *)bgView {
    LQLAlertContentIconPlain *alertContent = (LQLAlertContentIconPlain *)self.alertContent;
    UIImageView *imgView =  [bgView viewWithTag:alertContent.flag+1];
    if (imgView == nil) {
        imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:alertContent.iconName]];
        imgView.tag = alertContent.flag+1;
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.translatesAutoresizingMaskIntoConstraints = NO;
        imgView.layer.cornerRadius = alertContent.iconSize.width/2.;
        imgView.layer.masksToBounds = YES;
    }
    
    // 下载网络图片
    if (alertContent.imgURL) {
      imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:alertContent.imgURL]] scale:[UIScreen mainScreen].scale];
    }
    
    if (![bgView.subviews containsObject:imgView]) {
        [bgView addSubview:imgView];
    }
    
    [NSLayoutConstraint deactivateConstraints:imgView.constraints];
    [[imgView.topAnchor constraintEqualToAnchor:bgView.topAnchor constant:alertContent.contentEdge.top] setActive:YES];
    
    CGFloat width = 0.0f;
    CGRect frame = [alertContent.message boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 18) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:((LQLAlertContentIconPlain*)self.alertContent).messageFont} context:nil];
    
    
    width = frame.size.width + alertContent.contentEdge.right + alertContent.iconSize.width;
    
    CGFloat allWidth = CGRectGetWidth(bgView.bounds);
    CGFloat left = 0.0f;
    if (allWidth <= width) {
        left = allWidth;
    }else {
        left = (allWidth - width)/2;
    }
    // 中间对齐
    if (alertContent.contentAliment == LQLAlertContentIconPlainAlignment_Center) {
        [[imgView.centerXAnchor constraintEqualToAnchor:bgView.centerXAnchor constant:-width/2+alertContent.iconSize.width/2] setActive:YES];
    }else if (alertContent.contentAliment == LQLAlertContentIconPlainAlignment_Left) {
        [[imgView.leftAnchor constraintEqualToAnchor:bgView.leftAnchor   constant:alertContent.contentEdge.left] setActive:YES];
    }else {
        [[imgView.leftAnchor constraintEqualToAnchor:bgView.rightAnchor   constant:-width-alertContent.contentEdge.left] setActive:YES];
    }
    
    [[imgView.widthAnchor constraintEqualToConstant:alertContent.iconSize.width] setActive:YES];
    [[imgView.heightAnchor constraintEqualToConstant:alertContent.iconSize.height] setActive:YES];
    
    UILabel *contentLabel =  [bgView viewWithTag:alertContent.flag+2];
    if (contentLabel == nil) {
        contentLabel = [[UILabel alloc] init];
        contentLabel.tag = alertContent.flag+2;
        contentLabel.font = alertContent.messageFont;
        contentLabel.text = alertContent.message;
        contentLabel.textColor = alertContent.messageTextColor;
        contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if (![bgView.subviews containsObject:contentLabel]) {
        [bgView addSubview:contentLabel];
    }
    [NSLayoutConstraint deactivateConstraints:contentLabel.constraints];
    [[contentLabel.topAnchor constraintEqualToAnchor:bgView.topAnchor constant:alertContent.contentEdge.top] setActive:YES];
    [[contentLabel.leftAnchor constraintEqualToAnchor:imgView.rightAnchor   constant:alertContent.contentEdge.right] setActive:YES];
    [[contentLabel.rightAnchor constraintEqualToAnchor:bgView.rightAnchor   constant:-alertContent.contentEdge.left] setActive:YES];
    [[contentLabel.heightAnchor constraintEqualToConstant:alertContent.iconSize.height] setActive:YES];
}




@end
