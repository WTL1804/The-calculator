//
//  MainModel.m
//  计算器
//
//  Created by 王天亮 on 2019/9/24.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "MainModel.h"
#include <string.h>
#include <stdio.h>
@implementation MainModel
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    long int numbersuffix[100] = {0};
    int head = 0;
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    NSMutableArray *suffix = [[NSMutableArray alloc] init];
    NSMutableString *String = [[NSMutableString alloc] initWithString:change[@"new"]];
    NSMutableArray *array = [[NSMutableArray alloc] init];
   unsigned long int w = String.length;
    if (String.length == 0) {
        return;
    }
    if ([String characterAtIndex:w - 1] == '=') {
        NSLog(@"正在计算");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"result" object:self];
       String = [[String substringToIndex:String.length - 1] copy];
        for (int i = 0; i < String.length; i++) {
            [array addObject:[String substringWithRange:NSMakeRange(i, 1)]];
        }
        NSLog(@"array%@", array);
        

//        NSLog(@"%@", array);
//        NSNumber *b = array[0];
//        NSLog(@"%@", array[0]);
        for (int i = 0; i < array.count; i++) {
            if ([array[i]  isEqual: @"+"] || [array[i]  isEqual: @"-"] ||
                [array[i]  isEqual: @"*"] || [array[i]  isEqual: @"("] || [array[i]  isEqual: @"/"] || [array[i]  isEqual: @")"]) {
                if (stack.count == 0  && !([array[i]  isEqual: @")"])) {
                    [stack addObject:array[i]];
                } else if ([array[i]  isEqual: @"+"] || [array[i]  isEqual: @"-"]) {
                    for (long long int j = stack.count - 1; j >= 0; j--) {
                        if([stack[j] isEqual:@"("]) {
                            break;
                        }
                        [suffix addObject:stack[j]];
                        [stack removeObject:stack[j]];
                    }
                    [stack addObject:array[i]];
                } else if ([array[i]  isEqual: @"*"] || [array[i]  isEqual: @"/"]) {
//                    if (stack.count == 0) {
//                        [stack addObject:array[i]];
//                        break;
//                    }
                    for (long long int j = stack.count - 1; j >= 0; j--) {
                        if ([stack[j] isEqual:@"("]) {
                            [stack addObject:array[i]];
                            break;
                        }
                        
                        if ([stack[j]  isEqual: @"*"] || [stack[j]  isEqual: @"/"]) {
                            NSLog(@"%@", stack[j]);
                            [suffix addObject:stack[j]];
                            [stack removeObject:stack[j]];
                        } else {
                            [stack addObject:array[i]];
                            break;
                        }
                    }
                    if (stack.count == 0) {
                        [stack addObject:array[i]];
                    }
                    
                } else if ([array[i]  isEqual: @"("]) {
                    [stack addObject:@"("];
                } else if ([array[i]  isEqual: @")"]) {
                    int flagTemp = 0;
                    for (long long int j = stack.count - 1; j >=0; j--) {
                       if ([stack[j] isEqual:@"("]) {
                           flagTemp++;
                            break;
                       }
                    }
                    if (flagTemp == 0) {
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"errors" object:self];
                        return ;
                    }
                    for (long long int j = stack.count - 1; j >= 0; j--) {
                        if ([stack[j] isEqual:@"("]) {
                            [stack removeObject:@"("];
                            break;
                        }
                        [suffix addObject:stack[j]];
                        [stack removeObject:stack[j]];
                    }
                }
            }else {
                NSMutableString *number = [[NSMutableString alloc] init];
                NSLog(@"输入数字");
                int flag = -1;
//                if (i < array.count - 1) {
                    for (int j = i; j < array.count; j++) {
                        flag = 0;
                        if ([array[j]  isEqual: @"("] || [array[j]  isEqual: @")"] || [array[j]  isEqual: @"+"] || [array[j]  isEqual: @"-"] || [array[j]  isEqual: @"*"] ||    [array[j]  isEqual: @"/"]) {
                            i = j - 1;
                            break;
                        } else {
                            [number appendString:array[j]];
                        }
                        flag = j;
                    }
                if (flag == array.count - 1) {
                    i = array.count;
                }
                 double c = (double)[number doubleValue];
                NSNumber * b = [NSNumber numberWithDouble:c];
                [suffix addObject:b];
            }
        }
        if (stack.count != 0) {
            for (long long int j = stack.count - 1; j >= 0; j--) {
                if ([stack[j] isEqual:@"("]) {
                    [stack removeObject:@"("];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"errors" object:self];
                    return ;
                    break;
                }
                [suffix addObject:stack[j]];
                [stack removeObject:stack[j]];
            }
        }
        NSLog(@"%@", suffix);
        self.numberArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < suffix.count; i++){
            if ([suffix[i]  isEqual: @"+"] || [suffix[i]  isEqual: @"-"] || [suffix[i]  isEqual: @"*"] || [suffix[i]  isEqual: @"/"]) {
                if ([suffix[i]  isEqual: @"+"]) {
                     long int  j = _numberArray.count - 1;
                    double n = [_numberArray[j] doubleValue];
                    double m = [_numberArray[j - 1] doubleValue];
                    NSNumber *p = [NSNumber numberWithDouble:m + n];
                    [_numberArray removeObjectAtIndex:j];
                    [_numberArray removeObjectAtIndex:j-1];
                    [_numberArray addObject:p];
                } else if ([suffix[i]  isEqual: @"-"]) {
                    long int  j = _numberArray.count - 1;
                    double n = [_numberArray[j] doubleValue];
                    double m = [_numberArray[j - 1] doubleValue];
                    NSNumber *p = [NSNumber numberWithDouble:m - n];
                    [_numberArray removeObjectAtIndex:j];
                    [_numberArray removeObjectAtIndex:j-1];
                    [_numberArray addObject:p];
                } else if ([suffix[i]  isEqual: @"*"]) {
                     long int  j = _numberArray.count - 1;
                    double n = [_numberArray[j] doubleValue];
                    double m = [_numberArray[j - 1] doubleValue];
                    NSNumber *p = [NSNumber numberWithDouble:m * n];
                    [_numberArray removeObjectAtIndex:j];
                    [_numberArray removeObjectAtIndex:j-1];
                    [_numberArray addObject:p];
                } else if ([suffix[i]  isEqual: @"/"]) {
                    long int  j = _numberArray.count - 1;
                    double n = [_numberArray[j] doubleValue];
                    double m = [_numberArray[j - 1] doubleValue];
                    NSNumber *p = [NSNumber numberWithDouble:m / n];
                    [_numberArray removeObjectAtIndex:j];
                    [_numberArray removeObjectAtIndex:j-1];
                    [_numberArray addObject:p];
                }
            } else {
                [_numberArray addObject:suffix[i]];
            }
        }
        NSLog(@"%@", _numberArray);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"finish" object:self];
    }
    
//

//    while(1) {
//        int i = 0;
//        if (change[@"new"][i] >= '0' && change[@"new"][i] <= '9') {
//            [suffixString appendString:change[@"new"][i]];
//        } else if (change[@"new"][i] == '(') {
//
//        }
//    }
}
@end
