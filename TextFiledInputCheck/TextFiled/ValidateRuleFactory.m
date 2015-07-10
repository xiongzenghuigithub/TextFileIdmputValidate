//
//  ValidateRuleFactory.m
//  TextFiledInputCheck
//
//  Created by xiongzenghui on 15/3/1.
//  Copyright (c) 2015年 xiongzenghui. All rights reserved.
//

#import "ValidateRuleFactory.h"



@implementation ValidateRuleFactory

+ (ValidateRule *)instanceForValidateRuleWithTextFiled:(UITextField *)textFiled
                                        ValidateType:(ValidateRuleType) type
                                         FailMessage:(NSString *)failMessage
{
    return [[ValidateRule alloc] initWithTextFiled:textFiled
                                      ValidateType:type
                                       FailMessage:failMessage];
}

//1.MaxLength
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                                 MaxLength:(int) maxLength
                               FailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeMaxLength FailMessage:message];
                          
    
    rule.maxLength = maxLength;
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

//2.MinLength
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *)textFiled
                                 MinLength:(int)minLength
                               FailMessage:(NSString *)message
                             BeginValidate:(TextfileBeginValidate)begin
                          TextfileValiding:(TextfileValiding)validading
                       TextfileEndValidate:(TextfileEndValidate)end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeMinLength FailMessage:message];
    
    rule.minLength = minLength;
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

//3.Range
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                                   InRange:(NSRange) range 
                               FailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeInRange FailMessage:message];
    rule.range = range;
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

//4.纯数字
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                     OnlyNumberFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeNumeric FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

//5. 纯字母
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                  OnlyCharacterFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeAlphabetical FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

//6. 数字+字母
+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
             NumberAndCharacterFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeAlphaNumeric FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}


+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                          EmailFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeEmail FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                       PhoneNumFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypePhoneNumber FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                       UserNameFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeUserName FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                       PassWordFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypePassWord FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                       PostCodeFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypePostCode FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;

}

+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                     IdentifierFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeIdentifier FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                            URLFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeURL FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}

+ (ValidateRule *)validateRuleForTextFiled:(UITextField *) textFiled
                   ShorthandURLFailMessage:(NSString *) message
                             BeginValidate:(TextfileBeginValidate) begin
                          TextfileValiding:(TextfileValiding) validading
                       TextfileEndValidate:(TextfileEndValidate) end
{
    ValidateRule *rule = [self instanceForValidateRuleWithTextFiled:textFiled
                                                       ValidateType:ValidateRuleTypeShorthandURL FailMessage:message];
    
    
    rule.begin = begin;
    rule.end = end;
    rule.validing = validading;
    
    return rule;
}
@end
