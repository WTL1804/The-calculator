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
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    NSMutableArray *suffix = [[NSMutableArray alloc] init];
    self.String = [[NSMutableString alloc] initWithString:change[@"new"]];
    self.array = [[NSMutableArray alloc] init];
   unsigned long int w = _String.length;
    if (_String.length == 0) {
        return;
    }
    if ([_String characterAtIndex:w - 1] == '=') {
        NSLog(@"正在计算");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"result" object:self];
       _String = [[_String substringToIndex:_String.length] copy];
        for (int i = 0; i < _String.length; i++) {
            [_array addObject:[_String substringWithRange:NSMakeRange(i, 1)]];
        }
        NSLog(@"array%@", _array);
        

//        NSLog(@"%@", array);
//        NSNumber *b = array[0];
//        NSLog(@"%@", array[0]);
        for (int i = 0; i < _array.count; i++) {
            if ([_array[i]  isEqual: @"+"] || [_array[i]  isEqual: @"-"] ||
                [_array[i]  isEqual: @"*"] || [_array[i]  isEqual: @"("] || [_array[i]  isEqual: @"/"] || [_array[i]  isEqual: @")"]) {
                if (stack.count == 0  && !([_array[i]  isEqual: @")"]) && !([_array[i]  isEqual: @"("]) && !([_array[i]  isEqual: @"-"])) {
                    [stack addObject:_array[i]];
                } else if ([_array[i]  isEqual: @"+"] ) {
                    for (long long int j = stack.count - 1; j >= 0; j--) {
                        if([stack[j] isEqual:@"("]) {
                            break;
                        }
                        [suffix addObject:stack[j]];
                        [stack removeObject:stack[j]];
                    }
                    [stack addObject:_array[i]];
                } else if ([_array[i]  isEqual: @"*"] || [_array[i]  isEqual: @"/"]) {
//                    if (stack.count == 0) {
//                        [stack addObject:array[i]];
//                        break;
//                    }
                    for (long long int j = stack.count - 1; j >= 0; j--) {
                        if ([stack[j] isEqual:@"("]) {
                            [stack addObject:_array[i]];
                            break;
                        }
                        
                        if ([stack[j]  isEqual: @"*"] || [stack[j]  isEqual: @"/"]) {
                            //NSLog(@"%@", stack[j]);
                            [suffix addObject:stack[j]];
                            [stack removeObject:stack[j]];
                        } else {
                            [stack addObject:_array[i]];
                            break;
                        }
                    }
                    if (stack.count == 0) {
                        [stack addObject:_array[i]];
                    }
                    
                } else if ([_array[i]  isEqual: @"("]) {
                    [stack addObject:@"("];
                } else if ([_array[i]  isEqual: @")"]) {
                    int flagTemp = 0;
                    for (long long int j = stack.count - 1; j >=0; j--) {
                       if ([stack[j] isEqual:@"("]) {
                           flagTemp++;
                           //[stack removeObjectAtIndex:j];
                            break;
                       }
                    }
                    if (flagTemp == 0) {
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"errors2" object:self];
                        return ;
                    }
                    for (long long int j = stack.count - 1; j >= 0; j--) {
                        if ([stack[j] isEqual:@"("]) {
                            [stack removeObjectAtIndex:j];
                            break;
                        }
                        [suffix addObject:stack[j]];
                        [stack removeObjectAtIndex:j];
                    }
                } else if ([_array[i]  isEqual: @"-"]) {
                if (i == 0) {
                  //  [stack removeLastObject];
                    NSMutableString *number = [[NSMutableString alloc] init];
                                    NSLog(@"输入数字");
                                    int flag = -1;
                    //                if (i < array.count - 1) {
                                        for (int j = i + 1; j < _array.count; j++) {
                                            flag = 0;
                                            if ([_array[j]  isEqual: @"("] || [_array[j]  isEqual: @")"] || [_array[j]  isEqual: @"+"] || [_array[j]  isEqual: @"-"] || [_array[j]  isEqual: @"*"] ||    [_array[j]  isEqual: @"/"]) {
                                                i = j - 1;
                                                break;
                                            } else {
                                                [number appendString:_array[j]];
                                            }
                                            flag = j;
                                        }
                                    if (flag == _array.count - 1) {
                                        i = _array.count;
                                    }
                                     double c = -1 *(double)[number doubleValue];
                                    NSNumber * b = [NSNumber numberWithDouble:c];
                                    [suffix addObject:b];
                } else {
                    for (long long int j = stack.count - 1; j >= 0; j--) {
                        if([stack[j] isEqual:@"("]) {
                            break;
                        }
                        [suffix addObject:stack[j]];
                        [stack removeObjectAtIndex:j];
                    }
                    [stack addObject:_array[i]];
              }
            }
        } else {
                NSMutableString *number = [[NSMutableString alloc] init];
                NSLog(@"输入数字");
                int flag = -1;
//                if (i < array.count - 1) {
                    for (int j = i; j < _array.count; j++) {
                        flag = 0;
                        if ([_array[j]  isEqual: @"("] || [_array[j]  isEqual: @")"] || [_array[j]  isEqual: @"+"] || [_array[j]  isEqual: @"-"] || [_array[j]  isEqual: @"*"] ||    [_array[j]  isEqual: @"/"]) {
                            i = j - 1;
                            break;
                        } else {
                            [number appendString:_array[j]];
                        }
                        flag = j;
                    }
                if (flag == _array.count - 1) {
                    i = _array.count;
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
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"errors1" object:self];
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
