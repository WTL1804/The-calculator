//
//  ViewController.h
//  计算器
//
//  Created by 王天亮 on 2019/9/24.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"
#import "MainModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController <clickBtnDelegate>
@property (strong, nonatomic) View *mainView;
@property (strong, nonatomic) MainModel * mainModel;

@end

NS_ASSUME_NONNULL_END
