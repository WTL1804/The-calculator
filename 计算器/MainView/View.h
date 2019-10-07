//
//  View.h
//  计算器
//
//  Created by 王天亮 on 2019/9/24.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol clickBtnDelegate <NSObject>

-(void)clickBtn:(UIButton *)btn;

@end
@interface View : UIView
@property (nonatomic, strong) UIButton *ACBtn;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *divisionBtn;
@property (nonatomic, strong) UIButton *multiplicationBtn;
@property (nonatomic, strong) UIButton *subtractionBtn;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UIButton *resultBtn;
@property (nonatomic, strong) UIButton *sevenBtn;
@property (nonatomic, strong) UIButton *eightBtn;
@property (nonatomic, strong) UIButton *nineBtn;
@property (nonatomic, strong) UIButton *fourBtn;
@property (nonatomic, strong) UIButton *fiveBtn;
@property (nonatomic, strong) UIButton *sixBtn;
@property (nonatomic, strong) UIButton *oneBtn;
@property (nonatomic, strong) UIButton *twoBtn;
@property (nonatomic, strong) UIButton *threeBtn;
@property (nonatomic, strong) UIButton *zeroBtn;
@property (nonatomic, strong) UIButton *pointBtn;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, weak) id<clickBtnDelegate>delegate;

- (void)setUI;
@end

NS_ASSUME_NONNULL_END
