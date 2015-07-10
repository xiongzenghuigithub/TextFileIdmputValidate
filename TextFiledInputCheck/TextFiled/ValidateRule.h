

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(int, ValidateRuleType) {
    ValidateRuleTypeMaxLength = 1,  //最大长度
    ValidateRuleTypeMinLength ,     //最小长度
    ValidateRuleTypeInRange ,       //指定范围
    
    ValidateRuleTypeAlphaNumeric,   //字母+数字
    ValidateRuleTypeAlphabetical,   //纯字母
    ValidateRuleTypeNumeric ,       //纯数字
    
    ValidateRuleTypeEmail ,         //邮箱
    ValidateRuleTypePhoneNumber ,   //手机号码
    ValidateRuleTypeUserName ,      //用户名
    ValidateRuleTypePassWord ,      //密码
    ValidateRuleTypePostCode ,      //邮编
    ValidateRuleTypeIdentifier ,    //身份证
    ValidateRuleTypeURL,            //URL
    ValidateRuleTypeShorthandURL ,  //短URL
};

@interface NSString (ValidatorRules)

//1. 数字+字母
+ (BOOL)checkIfAlphaNumeric:(NSString *)string;

//2. 纯字母
+ (BOOL)checkIfAlphabetical:(NSString *)string;

//3. 纯数字
+ (BOOL)checkNumeric:(NSString *)string;

//4. 用户名
+ (BOOL)checkUserNane:(NSString *)string;

//5. 密码
+ (BOOL)checkPassword:(NSString *)string;

//6. 身份证
+ (BOOL)checkIfIdentifier:(NSString *)string;

//7. 输入字母（或数字）的个数在指定的范围
+ (BOOL)checkIfInRange:(NSString *)string WithRange:(NSRange)_range;

//8. 手机号码
+ (BOOL)checkPhoneNumber:(NSString *)string;

//9. 邮件
+ (BOOL)checkIfEmailId:(NSString *)string;

//10. 邮编
+ (BOOL)checkPostCodeUK:(NSString *)string;

//11. URL
+ (BOOL)checkIfURL:(NSString *)string;

//12. 短连接
+ (BOOL)checkIfShorthandURL:(NSString *)string;


- (BOOL)isNotEqualToString:(NSString *)string;
- (BOOL)containsString:(NSString *)string;
- (NSString *)stringBetweenString:(NSString *)start andString:(NSString*)end;

@end

@class ValidateRule;
typedef void (^TextfileBeginValidate)(ValidateRule *rule);
typedef void (^TextfileValiding)(ValidateRule *rule);
typedef void (^TextfileEndValidate)(ValidateRule *rule);

@interface ValidateRule : NSObject

@property (assign, nonatomic) TextfileBeginValidate begin;
@property (assign, nonatomic) TextfileValiding validing;
@property (assign, nonatomic) TextfileEndValidate end;

@property (nonatomic, retain) NSString *failureMessage;
@property (nonatomic) BOOL isValid;

//注意： weak引用UI对象
@property (nonatomic, weak) UITextField *textField;

//----
@property (assign, nonatomic) int maxLength;
@property (assign, nonatomic) int minLength;
@property (assign, nonatomic) NSRange range;
//----

- (instancetype)initWithTextFiled:(UITextField *)textFiled
                     ValidateType:(ValidateRuleType) type
                      FailMessage:(NSString *)failMessage;

- (void)validate;

@end
