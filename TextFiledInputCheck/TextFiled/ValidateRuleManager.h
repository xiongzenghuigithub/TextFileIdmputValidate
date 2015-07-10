//
//  ValidateRuleManager.h
//  TextFiledInputCheck
//
//  Created by xiongzenghui on 15/3/1.
//  Copyright (c) 2015年 xiongzenghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ValidateRuleFactory.h"

//校验开始 之前要做的事情
typedef void (^ValidatePreCallback)(void);

//校验成功 之后要做的事情
typedef void (^ValidateSuccessCallback)(void);

//校验失败 之后要做的事情
typedef void (^ValidateFailCallback)(ValidateRule *validateFailedRule);

@interface ValidateRuleManager : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *validateRuleArray;

+ (instancetype)instanceWithValidatePreCallback:(ValidatePreCallback) pre
                        ValidateSuccessCallback:(ValidateSuccessCallback) success
                           ValidateFailCallback:(ValidateFailCallback) fail;

- (void)addValidateRule:(ValidateRule *)rule;

@end
