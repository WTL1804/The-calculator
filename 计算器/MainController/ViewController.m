//
//  ViewController.m
//  计算器
//
//  Created by 王天亮 on 2019/9/24.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainView = [[View alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.mainView setUI];
    [self.view addSubview:self.mainView];
    self.mainView.delegate = self;
    self.mainModel = [[MainModel alloc] init];
    //设置KVO
    [self.mainView.textField addObserver:self.mainModel forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(result) name:@"result" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finish) name:@"finish" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(errors1) name:@"errors1" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(errors2) name:@"errors2" object:nil];
}

- (void)clickBtn:(UIButton *)btn {
    NSMutableString *string = [NSMutableString stringWithString:self.mainView.textField.text];
    if (btn.tag == 99) {
        if (self.mainModel.String.length > 1) {
            if ([[self.mainModel.String substringWithRange:NSMakeRange(self.mainModel.String.length - 1, 1)]  isEqual: @"."]) {
                return ;
            }
        }
        for (int i = 0; i < self.mainModel.String.length; i++) {
            if ([[self.mainModel.String substringWithRange:NSMakeRange(i, 1)]  isEqual: @"."]) {
                return;
                break;
            }
        }
        [string appendString:@"."];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 100) {
        [string appendString:@"0"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 101) {
        [string appendString:@"1"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 102) {
        [string appendString:@"2"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 103) {
        [string appendString:@"3"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 104) {
        [string appendString:@"4"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 105) {
        [string appendString:@"5"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 106) {
        [string appendString:@"6"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 107) {
        [string appendString:@"7"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 108) {
        [string appendString:@"8"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 109) {
        [string appendString:@"9"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 110) {
        [string setString:@""];
        self.mainView.textField.text = string;
        self.mainView.textField.placeholder = @"";
        [self.view reloadInputViews];
    }
    if (btn.tag == 111) {
        [string appendString:@"("];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 112) {
        [string appendString:@")"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 113) {
        if (self.mainModel.String.length > 1) {
            if ([[self.mainModel.String substringWithRange:NSMakeRange(self.mainModel.String.length - 1, 1)]  isEqual: @"/"]) {
                return ;
            }
        }
        [string appendString:@"/"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 114) {
        if (self.mainModel.String.length > 1) {
            if ([[self.mainModel.String substringWithRange:NSMakeRange(self.mainModel.String.length - 1, 1)]  isEqual: @"*"]) {
                return ;
            }
        }
        [string appendString:@"*"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 115) {
        if (self.mainModel.String.length > 1) {
            if ([[self.mainModel.String substringWithRange:NSMakeRange(self.mainModel.String.length - 1, 1)]  isEqual: @"-"]) {
                return ;
            }
        }
        [string appendString:@"-"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 116) {
        if (self.mainModel.String.length > 1) {
            if ([[self.mainModel.String substringWithRange:NSMakeRange(self.mainModel.String.length - 1, 1)]  isEqual: @"+"]) {
                return ;
            }
        }
        [string appendString:@"+"];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
    if (btn.tag == 117) {
        [string appendString:@"="];
        self.mainView.textField.text = string;
        [self.view reloadInputViews];
    }
}
- (void)result {
    self.mainView.textField.text =[[self.mainView.textField.text substringToIndex:self.mainView.textField.text.length - 1] copy];
    [self.mainView reloadInputViews];
}
- (void)finish {
    NSString *string = [self.mainModel.numberArray[0] stringValue];
    self.mainView.textField.text = string;
    [self.mainView reloadInputViews];
}
- (void)errors1{
    self.mainView.textField.text = @"";
    self.mainView.textField.placeholder = @"错误1";
    [self.mainView reloadInputViews];
}
- (void)errors2{
    self.mainView.textField.text = @"";
    self.mainView.textField.placeholder = @"错误2";
    [self.mainView reloadInputViews];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
