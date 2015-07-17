//
//  CCExecutor.m
//  CocoaInCoffee
//
//  Created by Peng on 7/15/15.
//  Copyright (c) 2015 Peng. All rights reserved.
//

#import "CCExecutor.h"
#import "JPEngine.h"

@interface CCExecutor ()

@end

@implementation CCExecutor

static JSContext *_ccContext;

+ (void)startExecutor
{
    if (_ccContext) {
        return;
    }
    
    _ccContext = [[JSContext alloc] init];
    
    NSString *cscPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"coffee-script" ofType:@"js"];
    NSAssert(cscPath, @"can't find coffee-script.js");
    NSString *csCompiler = [[NSString alloc] initWithData:[[NSFileManager defaultManager] contentsAtPath:cscPath] encoding:NSUTF8StringEncoding];
    [_ccContext evaluateScript:csCompiler];
 
}

+ (JSValue *) evaluateCoffeeScript:(NSString *)script withType:(CoffeeScriptType)type
{
    NSString *compiledJS = [self compileCoffeeScript:script];
    JSValue *result;
    switch(type){
            
        case CoffeeScriptTypePure:
            result = [_ccContext evaluateScript:compiledJS];
            break;
            
        case CoffeeScriptTypeMix:
            [JPEngine startEngine];
            result = [JPEngine evaluateScript:compiledJS];
            break;
            
        default:
            break;
            
    }
    
    return result;
}

+ (NSString *) compileCoffeeScript:(NSString *)script
{
    
    JSValue *resultJS = [_ccContext evaluateScript:[NSString stringWithFormat:@"CoffeeScript.compile('%@', {bare: true})",script]];
    
    return [resultJS toString];
}

+ (JSContext *)ccContext
{
    return _ccContext;
}

@end
