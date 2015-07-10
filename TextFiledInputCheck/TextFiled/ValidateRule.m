//
//  ValidateRule.m
//  TextFiledInputCheck
//
//  Created by xiongzenghui on 15/3/1.
//  Copyright (c) 2015年 xiongzenghui. All rights reserved.
//

#import "ValidateRule.h"

@implementation NSString (ValidatorRules)

+ (BOOL)checkIfAlphabetical:(NSString *)string
{
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSString *unameRegex = @"[a-zA-Z]";

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:unameRegex options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == string.length;
}

+ (BOOL)checkIfAlphaNumeric:(NSString *)string
{
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z0-9]" options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == string.length;
}

+ (BOOL)checkPhoneNumber:(NSString *)string {
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:phoneRegex options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == 1;
}

+ (BOOL)checkIfEmailId:(NSString *)string
{
    if (string == nil)
        string = [NSString string];
        
        NSError *error             = NULL;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[+\\w\\.\\-']+@[a-zA-Z0-9-]+(\\.[a-zA-Z]{2,})+$" options:NSRegularExpressionCaseInsensitive error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
        
        return numberOfMatches     == 1;
}

+ (BOOL)checkNumeric:(NSString *)string
{
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == string.length;
}

+ (BOOL)checkUserNane:(NSString *)string {
    
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:userNameRegex options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == 1;
}

+ (BOOL)checkPassword:(NSString *)string {
    
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:userNameRegex options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == 1;
}

+ (BOOL)checkIfIdentifier:(NSString *)string {
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSString *regexString = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == 1;
}

+ (BOOL)checkPostCodeUK:(NSString *)string
{
    if (string == nil)
        string = @"";
        
        NSError *error             = NULL;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^([A-PR-UWYZa-pr-uwyz]([0-9]{1,2}|([A-HK-Ya-hk-y][0-9]|[A-HK-Ya-hk-y][0-9]([0-9]|[ABEHMNPRV-Yabehmnprv-y]))|[0-9][A-HJKS-UWa-hjks-uw])\\ {0,1}[0-9][ABD-HJLNP-UW-Zabd-hjlnp-uw-z]{2}|([Gg][Ii][Rr]\\ 0[Aa][Aa])|([Ss][Aa][Nn]\\ {0,1}[Tt][Aa]1)|([Bb][Ff][Pp][Oo]\\ {0,1}([Cc]\\/[Oo]\\ )?[0-9]{1,4})|(([Aa][Ss][Cc][Nn]|[Bb][Bb][Nn][Dd]|[BFSbfs][Ii][Qq][Qq]|[Pp][Cc][Rr][Nn]|[Ss][Tt][Hh][Ll]|[Tt][Dd][Cc][Uu]|[Tt][Kk][Cc][Aa])\\ {0,1}1[Zz][Zz]))$" options:0 error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, [string length])];
        
        return numberOfMatches     == 1;
        }

+ (BOOL)checkIfInRange:(NSString *)string WithRange:(NSRange)_range
{
    if (_range.location == 0
        && _range.length == 0)
        return YES;
    
    if (string == nil)
        string = [NSString string];
        
        NSError *error             = NULL;
        NSString *regexString      = [NSString stringWithFormat:@"^.{%d,%d}$", _range.location, _range.length];
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:0 error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
        
        return numberOfMatches     == 1;
        }

+ (BOOL)checkIfURL:(NSString *)string
{
    if (string == nil)
    {
        return NO;
    }
    
    NSDataDetector *detector         = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSTextCheckingResult *firstMatch = [detector firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    
    return [firstMatch.URL isKindOfClass:[NSURL class]]
    && ![firstMatch.URL.scheme isEqualToString:@"mailto"]
    && ![firstMatch.URL.scheme isEqualToString:@"ftp"];
}

+ (BOOL)checkIfShorthandURL:(NSString *)string
{
    if (string == nil)
    {
        return NO;
    }
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^((https?)://)?[a-z0-9-]+(\\.[a-z0-9-]+)+([/?].*)?$" options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == 1;
}

- (BOOL)isNotEqualToString:(NSString *)string
{
    
    return [self isEqualToString:string] ? NO : YES;
    
}

- (BOOL)containsString:(NSString *)string
{
    
    return [self rangeOfString:string].location == NSNotFound ? NO : YES;
    
}

- (NSString *)stringBetweenString:(NSString *)start andString:(NSString *)end
{
    
    NSRange startRange       = [self rangeOfString:start];
    if (startRange.location != NSNotFound) {
        
        NSRange targetRange;
        targetRange.location = startRange.location + startRange.length;
        targetRange.length   = [self length] - targetRange.location;
        NSRange endRange     = [self rangeOfString:end options:0 range:targetRange];
        
        if (endRange.location != NSNotFound) {
            
            targetRange.length = endRange.location - targetRange.location;
            return [self substringWithRange:targetRange];
        }
    }
    return nil;
}

@end


@interface ValidateRule ()
@property (assign, nonatomic) ValidateRuleType validateType;
@end

@implementation ValidateRule

- (instancetype)initWithTextFiled:(UITextField *)textFiled
                     ValidateType:(ValidateRuleType) type
                      FailMessage:(NSString *)failMessage
{
    self = [super init];
    if (self) {
        self.textField = textFiled;
        self.failureMessage = failMessage;
        self.isValid = NO;
        
        self.validateType = type;
    }
    return self;
}

- (void)dealloc {
    self.begin = nil;
    self.validing = nil;
    self.end = nil;
}

#pragma mark - 验证
- (void)validate {
    switch (self.validateType) {
        case ValidateRuleTypeMaxLength:
            [self validateWithMaxLength];
            break;
        
        case ValidateRuleTypeMinLength:
            [self validateWithMinLength];
            break;
        
        case ValidateRuleTypeInRange:
            [self validateWithInRange];
            break;
            
        case ValidateRuleTypeNumeric:
            [self validateWithNumeric];
            break;
            
        case ValidateRuleTypeAlphabetical:
            [self validateWithAlphabetical];
            break;
         
        case ValidateRuleTypeAlphaNumeric:
            [self validateWithAlphaNumeric];
            break;
            
        case ValidateRuleTypeEmail:
            [self validateWithEmail];
            break;
        
        case ValidateRuleTypePhoneNumber:
            [self validateWithPhoneNumber];
            break;
            
        case ValidateRuleTypeUserName:
            [self validateWithUserName];
            break;
        
        case ValidateRuleTypePassWord:
            [self validateWithPassWord];
            break;
            
        case ValidateRuleTypePostCode:
            [self validateWithPostCode];
            break;
            
        case ValidateRuleTypeIdentifier:
            [self validateWithIdentifier];
            break;
        
        case ValidateRuleTypeURL:
            [self validateWithURL];
            break;
            
        case ValidateRuleTypeShorthandURL:
            [self validateWithShorthandURL];
            break;
            
        default:
            break;
    }
}

- (void)validateWithMaxLength {
    if (self.textField.text.length > self.maxLength || self.textField.text.length < 1) {
        self.isValid = NO;
    } else {
        self.isValid = YES;
    }
}

- (void)validateWithMinLength {
    if (self.textField.text.length < self.minLength) {
        self.isValid = NO;
    }else {
        self.isValid = YES;
    }
}

- (void)validateWithInRange {
    BOOL isInRange = [NSString checkIfInRange:self.textField.text WithRange:self.range];
    self.isValid = isInRange;
}

- (void)validateWithNumeric {
    self.isValid = [NSString checkNumeric:self.textField.text];
}

- (void)validateWithAlphabetical {
    self.isValid = [NSString checkIfAlphabetical:self.textField.text];
}

- (void)validateWithAlphaNumeric {
    self.isValid = [NSString checkIfAlphaNumeric:self.textField.text];
}

- (void)validateWithEmail {
    self.isValid = [NSString checkIfEmailId:self.textField.text];
}

- (void)validateWithPhoneNumber {
    self.isValid = [NSString checkPhoneNumber:self.textField.text];
}

- (void)validateWithUserName {
    self.isValid = [NSString checkUserNane:self.textField.text];
}

- (void)validateWithPassWord {
    self.isValid = [NSString checkPassword:self.textField.text];
}

- (void)validateWithPostCode {
    self.isValid = [NSString checkPostCodeUK:self.textField.text];
}

- (void)validateWithIdentifier {
    self.isValid = [NSString checkIfIdentifier:self.textField.text];
}

- (void)validateWithURL {
    self.isValid = [NSString checkIfURL:self.textField.text];
}

- (void)validateWithShorthandURL {
    self.isValid = [NSString checkIfShorthandURL:self.textField.text];
}
@end
