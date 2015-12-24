//
//  UIViewController+CustomWillAppearMethod.m
//  KOEBU PRO
//
//  Created by Thinh Xavi on 4/20/15.
//  Copyright (c) 2015 KeisukeTatsumi. All rights reserved.
//

#import "UIViewController+CustomWillAppearMethod.h"
#import <objc/runtime.h>

@implementation UIViewController (CustomWillAppearMethod)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (void)_viewWillAppear:(BOOL)animated {
    [self _viewWillAppear:animated];
    NSLog(@"Class:%@",NSStringFromClass([self class]));
}

@end
