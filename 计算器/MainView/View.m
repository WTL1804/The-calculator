//
//  View.m
//  计算器
//
//  Created by 王天亮 on 2019/9/24.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "View.h"
#import <Masonry.h>

@implementation View

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI{
    self.backgroundColor = [UIColor blackColor];
    
    
    self.ACBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.ACBtn];
    [self.ACBtn setTitle:@"AC" forState:UIControlStateNormal];
    [self.ACBtn setBackgroundColor:[UIColor grayColor]];
    self.ACBtn.layer.borderWidth = 1;
    self.ACBtn.tag = 110;
    [self.ACBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.leftBtn];
    [self.leftBtn setTitle:@"(" forState:UIControlStateNormal];
    [self.leftBtn setBackgroundColor:[UIColor grayColor]];
    self.leftBtn.layer.borderWidth = 1;
    self.leftBtn.tag = 111;
    [self.leftBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.rightBtn];
    [self.rightBtn setTitle:@")" forState:UIControlStateNormal];
    [self.rightBtn setBackgroundColor:[UIColor grayColor]];
    self.rightBtn.layer.borderWidth = 1;
    self.rightBtn.tag = 112;
    [self.rightBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.divisionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.divisionBtn];
    [self.divisionBtn setTitle:@"/" forState:UIControlStateNormal];
    [self.divisionBtn setBackgroundColor:[UIColor orangeColor]];
    self.divisionBtn.layer.borderWidth = 1;
    self.divisionBtn.tag = 113;
    [self.divisionBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.multiplicationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.multiplicationBtn];
    [self.multiplicationBtn setTitle:@"*" forState:UIControlStateNormal];
    [self.multiplicationBtn setBackgroundColor:[UIColor orangeColor]];
    self.multiplicationBtn.layer.borderWidth = 1;
    self.multiplicationBtn.tag = 114;
    [self.multiplicationBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.subtractionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.subtractionBtn];
    [self.subtractionBtn setTitle:@"-" forState:UIControlStateNormal];
    [self.subtractionBtn setBackgroundColor:[UIColor orangeColor]];
    self.subtractionBtn.layer.borderWidth = 1;
    self.subtractionBtn.tag = 115;
    [self.subtractionBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.addBtn];
    [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
    [self.addBtn setBackgroundColor:[UIColor orangeColor]];
    self.addBtn.layer.borderWidth = 1;
    self.addBtn.tag = 116;
    [self.addBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.resultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.resultBtn];
    [self.resultBtn setTitle:@"=" forState:UIControlStateNormal];
    [self.resultBtn setBackgroundColor:[UIColor orangeColor]];
    self.resultBtn.layer.borderWidth = 1;
    self.resultBtn.tag = 117;
    [self.resultBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.sevenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.sevenBtn];
    [self.sevenBtn setTitle:@"7" forState:UIControlStateNormal];
    [self.sevenBtn setBackgroundColor:[UIColor grayColor]];
    self.sevenBtn.layer.borderWidth = 1;
    self.sevenBtn.tag = 107;
    [self.sevenBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.eightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.eightBtn];
    [self.eightBtn setTitle:@"8" forState:UIControlStateNormal];
    [self.eightBtn setBackgroundColor:[UIColor grayColor]];
    self.eightBtn.layer.borderWidth = 1;
    self.eightBtn.tag = 108;
    [self.eightBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.nineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.nineBtn];
    [self.nineBtn setTitle:@"9" forState:UIControlStateNormal];
    [self.nineBtn setBackgroundColor:[UIColor grayColor]];
    self.nineBtn.layer.borderWidth = 1;
    self.nineBtn.tag = 109;
    [self.nineBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.fourBtn];
    [self.fourBtn setTitle:@"4" forState:UIControlStateNormal];
    [self.fourBtn setBackgroundColor:[UIColor grayColor]];
    self.fourBtn.layer.borderWidth = 1;
    self.fourBtn.tag = 104;
    [self.fourBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.fiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.fiveBtn];
    [self.fiveBtn setTitle:@"5" forState:UIControlStateNormal];
    [self.fiveBtn setBackgroundColor:[UIColor grayColor]];
    self.fiveBtn.layer.borderWidth = 1;
    self.fiveBtn.tag = 105;
    [self.fiveBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.sixBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.sixBtn];
    [self.sixBtn setTitle:@"6" forState:UIControlStateNormal];
    [self.sixBtn setBackgroundColor:[UIColor grayColor]];
    self.sixBtn.layer.borderWidth = 1;
    self.sixBtn.tag = 106;
    [self.sixBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.oneBtn];
    [self.oneBtn setTitle:@"1" forState:UIControlStateNormal];
    [self.oneBtn setBackgroundColor:[UIColor grayColor]];
    self.oneBtn.layer.borderWidth = 1;
    self.oneBtn.tag = 101;
    [self.oneBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.twoBtn];
    [self.twoBtn setTitle:@"2" forState:UIControlStateNormal];
    [self.twoBtn setBackgroundColor:[UIColor grayColor]];
    self.twoBtn.layer.borderWidth = 1;
    self.twoBtn.tag = 102;
    [self.twoBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.threeBtn];
    [self.threeBtn setTitle:@"3" forState:UIControlStateNormal];
    [self.threeBtn setBackgroundColor:[UIColor grayColor]];
    self.threeBtn.layer.borderWidth = 1;
    self.threeBtn.tag = 103;
    [self.threeBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.zeroBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.zeroBtn];
    [self.zeroBtn setTitle:@"0" forState:UIControlStateNormal];
    [self.zeroBtn setBackgroundColor:[UIColor grayColor]];
    self.zeroBtn.layer.borderWidth = 1;
    self.zeroBtn.tag = 100;
    [self.zeroBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.pointBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.pointBtn];
    [self.pointBtn setTitle:@"." forState:UIControlStateNormal];
    [self.pointBtn setBackgroundColor:[UIColor grayColor]];
    self.pointBtn.layer.borderWidth = 1;
    self.pointBtn.tag = 99;
    [self.pointBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.textField = [[UITextField alloc] init];
    //self.textField.text = @"0";
    self.textField.font = [UIFont systemFontOfSize:60];
    [self addSubview:self.textField];
    self.textField.backgroundColor = [UIColor blackColor];
    self.textField.textColor = [UIColor whiteColor];
    self.textField.keyboardType =  NO;
    self.textField.textAlignment = NSTextAlignmentRight;
    self.textField.minimumFontSize = 20;
    self.textField.adjustsFontSizeToFitWidth = YES;
    self.textField.enabled = NO;
}
- (void)layoutSubviews {
    NSLog(@"正在执行layoutSubviews");
    int heights = self.frame.size.height / 10 ;
    int widths = self.frame.size.width / 4;
    [self.ACBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 +heights);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_left).offset(widths);
    }];
    
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self).offset(self.frame.size.height/2);
           make.bottom.equalTo(self).offset(- self.frame.size.height/2 +heights);
           make.left.equalTo(self.ACBtn.mas_right);
           make.right.equalTo(self.ACBtn.mas_right).offset(widths);
       }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self).offset(self.frame.size.height/2);
           make.bottom.equalTo(self).offset(- self.frame.size.height/2 +heights);
           make.left.equalTo(self.leftBtn.mas_right);
           make.right.equalTo(self.leftBtn.mas_right).offset(widths);
       }];
    
    [self.divisionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self).offset(self.frame.size.height/2);
           make.bottom.equalTo(self).offset(- self.frame.size.height/2 +heights);
           make.left.equalTo(self.rightBtn.mas_right);
           make.right.equalTo(self.rightBtn.mas_right).offset(widths);
       }];
    
    
    [self.sevenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(self.frame.size.height/2 + heights);
            make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 2 *heights);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_left).offset(widths);
           }];
    
    
    [self.eightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(self.frame.size.height/2 + heights);
            make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 2 *heights);
            make.left.equalTo(self.sevenBtn.mas_right);
            make.right.equalTo(self.sevenBtn.mas_right).offset(widths);
           }];
    
    
    [self.nineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 2 *heights);
        make.left.equalTo(self.eightBtn.mas_right);
        make.right.equalTo(self.eightBtn.mas_right).offset(widths);
    }];
    

    
    [self.multiplicationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self).offset(self.frame.size.height/2 + heights);
           make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 2 *heights);
           make.left.equalTo(self.nineBtn.mas_right);
           make.right.equalTo(self.nineBtn.mas_right).offset(widths);
       }];

    
    [self.fourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 2 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 3 *heights);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_left).offset(widths);
    }];
    
    
    [self.fiveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 2 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 3 *heights);
        make.left.equalTo(self.fourBtn.mas_right);
        make.right.equalTo(self.fourBtn.mas_right).offset(widths);
    }];
    
    
    [self.sixBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 2 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 3 *heights);
        make.left.equalTo(self.fiveBtn.mas_right);
        make.right.equalTo(self.fiveBtn.mas_right).offset(widths);
    }];
    
    [self.subtractionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 2 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 3 *heights);
        make.left.equalTo(self.sixBtn.mas_right);
        make.right.equalTo(self.sixBtn.mas_right).offset(widths);
    }];
    
    
    [self.oneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 3 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 4 *heights);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_left).offset(widths);
    }];
    
    
    [self.twoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 3 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 4 *heights);
        make.left.equalTo(self.oneBtn.mas_right);
        make.right.equalTo(self.oneBtn.mas_right).offset(widths);
    }];
    
    [self.threeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 3 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 4 *heights);
        make.left.equalTo(self.twoBtn.mas_right);
        make.right.equalTo(self.twoBtn.mas_right).offset(widths);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 3 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 4 *heights);
        make.left.equalTo(self.threeBtn.mas_right);
        make.right.equalTo(self.threeBtn.mas_right).offset(widths);
    }];
    
    
    [self.zeroBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 4 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 5 *heights);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_left).offset(2 * widths);
    }];
    
    [self.pointBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 + 4 * heights);
        make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 5 *heights);
        make.left.equalTo(self.zeroBtn.mas_right);
        make.right.equalTo(self.zeroBtn.mas_right).offset(widths);
    }];
    
    
    [self.resultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self).offset(self.frame.size.height/2 + 4 * heights);
           make.bottom.equalTo(self).offset(- self.frame.size.height/2 + 5 *heights);
           make.left.equalTo(self.pointBtn.mas_right);
           make.right.equalTo(self.pointBtn.mas_right).offset(widths);
       }];
       
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.frame.size.height/2 - 1.5 * heights);
        make.bottom.equalTo(self).offset(-self.frame.size.height/2);
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];
    
}

- (void)clickBtn:(UIButton *)btn{
    [self.delegate clickBtn:btn];
}
@end
