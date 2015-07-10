//
//  ViewController.m
//  TextFiledInputCheck
//
//  Created by xiongzenghui on 15/3/1.
//  Copyright (c) 2015年 xiongzenghui. All rights reserved.
//

#import "ViewController.h"
#import "SubmitButton.h"

#import "ValidateRuleManager.h"

@interface ViewController ()
@property (strong, nonatomic) UITextField *uName;
@property (strong, nonatomic) UITextField *pwd;
@property (strong, nonatomic) UITextField *phone;
@property (strong, nonatomic) UITextField *email;

@property (strong, nonatomic) SubmitButton *submit;
@property (strong, nonatomic) ValidateRuleManager *validateManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubviews];
}

- (void)initSubviews {
    
    
    //1. 实例化 TextFiled
    self.uName = [[UITextField alloc] init];
    self.uName.placeholder = @"user name";
    self.pwd = [[UITextField alloc] init];
    self.pwd.placeholder = @"password";
    self.phone = [[UITextField alloc] init];
    self.phone.placeholder = @"phone number";
    self.email = [[UITextField alloc] init];
    self.email.placeholder = @"email";
    
    self.uName.layer.borderWidth = 1;
    self.pwd.layer.borderWidth = 1;
    self.phone.layer.borderWidth = 1;
    self.email.layer.borderWidth = 1;
    
    self.uName.accessibilityIdentifier = @"userName";
    self.pwd.accessibilityIdentifier = @"password";
    self.phone.accessibilityIdentifier = @"phone number";
    self.email.accessibilityIdentifier = @"email";
    
    [self.view addSubview:self.uName];
    [self.view addSubview:self.pwd];
    [self.view addSubview:self.phone];
    [self.view addSubview:self.email];
    
    self.uName.frame = CGRectMake(20, 80, 280, 40);
    self.pwd.frame = CGRectMake(20, 130, 280, 40);
    self.phone.frame = CGRectMake(20, 180, 280, 40);
    self.email.frame = CGRectMake(20, 230, 280, 40);

    //2. 实例化 提交按钮， 初始化时 Ennable = NO
    self.submit = [SubmitButton buttonWithType:UIButtonTypeCustom];
    [self.submit setTitle:@"提交" forState:UIControlStateNormal];
    self.submit.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.submit];
    self.submit.frame = CGRectMake(20, 280, 200, 60);
//    self.submit.enabled = NO;
    
    //3. 释放焦点
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [self.view addGestureRecognizer:gesture];
    
    //--------------------------------------------------------------
    //4. 每次校验都是 重新创建一个Manager对象（业务对象），并设置回调Block
    _validateManager = [ValidateRuleManager instanceWithValidatePreCallback:^{
        //初始化按钮为 不可以点击
        self.submit.enabled = NO;
        
    } ValidateSuccessCallback:^{
        
        //改变按钮为 可以点击
        self.submit.enabled = YES;
        
    } ValidateFailCallback:^(ValidateRule *validateFailedRule) {
        
        //1. 改变按钮为 不可以点击
        self.submit.enabled = NO;
        
        //2. 提示信息
//        [[[UIAlertView alloc] initWithTitle:[[validateFailedRule textField] accessibilityIdentifier] message:[validateFailedRule failureMessage] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Done", nil] show];
    }];

    //5. 创建每一个TextFiled对象的校验规则
    [_validateManager addValidateRule:[ValidateRuleFactory validateRuleForTextFiled:self.uName MaxLength:5 FailMessage:@"最大长度为5，且不能为0" BeginValidate:^(ValidateRule *rule)
    {
        NSLog(@"开始校验的Rule: %@\n", [rule failureMessage]);
    } TextfileValiding:^(ValidateRule *rule) {
        NSLog(@"正在校验的Rule: %@\n", [rule failureMessage]);
    } TextfileEndValidate:^(ValidateRule *rule) {
        NSLog(@"结束校验的Rule: %@\n", [rule failureMessage]);
    }]];

    [_validateManager addValidateRule:
     [ValidateRuleFactory validateRuleForTextFiled:self.pwd
                                         MinLength:4
                                       FailMessage:@"最小长度为4"
                                     BeginValidate:^(ValidateRule *rule)
       {
           NSLog(@"开始校验的Rule: %@\n", [rule failureMessage]);
       } TextfileValiding:^(ValidateRule *rule) {
           NSLog(@"正在校验的Rule: %@\n", [rule failureMessage]);
       } TextfileEndValidate:^(ValidateRule *rule) {
           NSLog(@"结束校验的Rule: %@\n", [rule failureMessage]);
       }]
     ];
    
    [_validateManager addValidateRule:
     [ValidateRuleFactory validateRuleForTextFiled:self.phone PhoneNumFailMessage:@"电话号码错误"
      
                                    BeginValidate:^(ValidateRule *rule) {
                                        NSLog(@"开始校验的Rule: %@\n", [rule failureMessage]);
                                    } TextfileValiding:^(ValidateRule *rule) {
                                        NSLog(@"正在校验的Rule: %@\n", [rule failureMessage]);
                                    } TextfileEndValidate:^(ValidateRule *rule) {
                                        NSLog(@"结束校验的Rule: %@\n", [rule failureMessage]);
                                    }]
     ];

    
    [_validateManager addValidateRule:[ValidateRuleFactory validateRuleForTextFiled:self.email EmailFailMessage:@"邮件地址错误" BeginValidate:^(ValidateRule *rule)
    {
            NSLog(@"开始校验的Rule: %@\n", [rule failureMessage]);
    } TextfileValiding:^(ValidateRule *rule) {
            NSLog(@"正在校验的Rule: %@\n", [rule failureMessage]);
    } TextfileEndValidate:^(ValidateRule *rule) {
            NSLog(@"结束校验的Rule: %@\n", [rule failureMessage]);
    }]];

    
}

- (void)click {
    [self.uName resignFirstResponder];
    [self.pwd resignFirstResponder];
    [self.phone resignFirstResponder];
    [self.email resignFirstResponder];
    
}

@end
