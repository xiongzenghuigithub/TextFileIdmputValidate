//
//  ValidateRuleFactory.h
//  TextFiledInputCheck
//
//  Created by xiongzenghui on 15/3/1.
//  Copyright (c) 2015年 xiongzenghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ValidateRule.h"


@interface ValidateRuleFactory : NSObject

/**
 *  最大长度，且不为0
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                                 MaxLength:(int) maxLength
                               FailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  最小长度，且不为0
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                                 MinLength:(int) minLength
                               FailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  输入指定范围的数字
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                                   InRange:(NSRange) range
                               FailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  只输入数字
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                     OnlyNumberFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  只输入字符
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                  OnlyCharacterFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  输入数字+字符
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
             NumberAndCharacterFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  邮箱
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                          EmailFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  电话号码
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                       PhoneNumFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  用户名
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                       UserNameFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  密码
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                       PassWordFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  邮编
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                       PostCodeFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;
/**
 *  身份证
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                     IdentifierFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  URL
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                            URLFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

/**
 *  ShorthandURL
 */
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                   ShorthandURLFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end;

@end
