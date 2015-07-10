//
//  SubmitButton.m
//  TextFiledInputCheck
//
//  Created by xiongzenghui on 15/3/1.
//  Copyright (c) 2015年 xiongzenghui. All rights reserved.
//

#import "SubmitButton.h"

@implementation SubmitButton

- (void)setEnabled:(BOOL)enabled {
    
    if (enabled) {
        self.backgroundColor = [UIColor redColor];
    }else {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    [super setEnabled:enabled];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
   
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
