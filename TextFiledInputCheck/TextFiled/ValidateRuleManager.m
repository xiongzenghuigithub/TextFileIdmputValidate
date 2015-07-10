//
//  ValidateRuleManager.m
//  TextFiledInputCheck
//
//  Created by xiongzenghui on 15/3/1.
//  Copyright (c) 2015年 xiongzenghui. All rights reserved.
//

#import "ValidateRuleManager.h"

@interface ValidateRuleManager ()

//保存被添加的 所有需要校验 Rule对象（UITextfiled对象）
@property (nonatomic, strong, readwrite) NSMutableArray *validateRuleArray;

@property (nonatomic, copy, readwrite) ValidatePreCallback pre;
@property (nonatomic, copy, readwrite) ValidateSuccessCallback success;
@property (nonatomic, copy, readwrite) ValidateFailCallback fail;
@end

@implementation ValidateRuleManager

+ (instancetype)instanceWithValidatePreCallback:(ValidatePreCallback) pre
                        ValidateSuccessCallback:(ValidateSuccessCallback) success
                           ValidateFailCallback:(ValidateFailCallback) fail
{
    ValidateRuleManager *manager = [[ValidateRuleManager alloc] init];
    manager.pre = pre;
    manager.success = success;
    manager.fail = fail;
    return manager;
}


- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    self.validateRuleArray = [NSMutableArray array];
    [self addNotifications];
    
    return self;
}

- (void)addNotifications {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(didReceiveChangedTextFiled:)
                   name:UITextFieldTextDidBeginEditingNotification object:nil];
    [center addObserver:self selector:@selector(didReceiveChangedTextFiled:)
                   name:UITextFieldTextDidChangeNotification object:nil];
    [center addObserver:self selector:@selector(didReceiveChangedTextFiled:)
                   name:UITextFieldTextDidEndEditingNotification object:nil];
}

- (void)removeNotifications {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    [center removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [center removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
}

- (void)dealloc {
    [self removeNotifications];
    
    self.pre = nil;
    self.success = nil;
    self.fail = nil;
}

- (void)addValidateRule:(ValidateRule *)rule {
    [self.validateRuleArray addObject:rule];
}

#pragma mark - 接收到当前被修改内容的TextFiled对象
- (void)didReceiveChangedTextFiled:(NSNotification *) sender {
    UITextField *textFiled = sender.object;
    NSString *name = sender.name;
    if (name == UITextFieldTextDidBeginEditingNotification) {   //整个App程序中开始编辑的输入框对象
        [self handleTextFiledBegineEdit:textFiled];
    }else if (name == UITextFieldTextDidEndEditingNotification) { //整个App程序中结束编辑的输入框对象
        [self handleTextFiledEndEdit:textFiled];
    }else {
        [self handleTextFiledDidChanged:textFiled];   //整个App程序中正在编辑的输入框对象
    }
}

#pragma mark - 当前真个App程序中，正在处于编辑的 UITextFiled对象 ===> 只有一个
- (ValidateRule *)findBingWithTextfiledRule:(UITextField *)textfiled {
    ValidateRule *findedRule = nil;
    for (ValidateRule *rule in self.validateRuleArray) {
        if (textfiled == [rule textField]) {
            findedRule = rule;
            break;
        }
    }
    return findedRule;
}

- (void)handleTextFiledBegineEdit:(UITextField *) textFiled{
    
    [self setTextfileBorderBeginEditAndEditing:textFiled];
    
    // 当前App中唯一的正在开始校验的TextFiled
    ValidateRule *findedRule = [self findBingWithTextfiledRule:textFiled];
    if (findedRule.begin) {
        findedRule.begin(findedRule);
    }
}

- (void)handleTextFiledDidChanged:(UITextField *) textFiled {
    
    ValidateRule *findedRule = [self findBingWithTextfiledRule:textFiled];
    if (findedRule.validing) {
        findedRule.validing(findedRule);
    }
    
    // 每一次TextFiled值改变，都必须校验
    // 而且是校验所有的TextFiled
    [self validate];
}

- (void)handleTextFiledEndEdit:(UITextField *) textFiled {
    
    [self setTextfileBorderEndEdit:textFiled];
    
    // 当前App中唯一的结束校验的TextFiled
    ValidateRule *findedRule = [self findBingWithTextfiledRule:textFiled];
    if (findedRule.end) {
        findedRule.end(findedRule);
    }
}

#pragma mark - 当前Rule校验时，都需要同时校验数组中保存的所有其他的Rule对象
- (void)validate {
    
    //2.
    if ([self.validateRuleArray count] < 1) {
        NSLog(@"请先添加校验规则\n");
        return;
    }
    
    BOOL isValid = YES;
    ValidateRule *fistFailRule = nil;
    
    //同时校验所有的Rule是否合法
    for (ValidateRule *rule in self.validateRuleArray) {
        
        [rule validate];
        
        isValid = rule.isValid && isValid;
        
        if (!rule.isValid) {
            fistFailRule = rule;
            break;
        }
    }
    
    //3. 校验结束
    if (isValid) {
        if (self.success) {
            self.success();
        }
    }else {
        if (self.fail) {
            self.fail(fistFailRule);//返回校验失败的第一个输入框
        }
    }
}

- (void)setTextfileBorderBeginEditAndEditing:(UITextField *) textFiled{
    textFiled.layer.borderColor = [UIColor redColor].CGColor;
}

- (void)setTextfileBorderEndEdit:(UITextField *) textFiled {
    textFiled.layer.borderColor = [UIColor blackColor].CGColor;
}

@end
