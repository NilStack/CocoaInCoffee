//
//  CCExecutor.h
//  CocoaInCoffee
//
//  Created by Peng on 7/15/15.
//  Copyright (c) 2015 Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

//TODO: Might remove in future?
typedef NS_ENUM(NSInteger, CoffeeScriptType) {
    CoffeeScriptTypePure,    // only call native CoffeeScript class and method
    CoffeeScriptTypeMix      // call Objective-C class and method
};

@interface CCExecutor : NSObject

+ (void)startExecutor;
+ (JSValue *) evaluateCoffeeScript:(NSString *)script withType:(CoffeeScriptType)type;
+ (NSString *) compileCoffeeScript:(NSString *)script;
+ (JSContext *)ccContext;

@end
