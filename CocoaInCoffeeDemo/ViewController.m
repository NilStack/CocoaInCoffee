//
//  ViewController.m
//  CocoaInCoffeeDemo
//
//  Created by Peng on 7/17/15.
//  Copyright (c) 2015 Peng. All rights reserved.
//

#import "ViewController.h"
#import "CCExecutor.h"
#import "JPEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *demoPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"demo" ofType:@"coffee"];
    NSString *demoScript = [[NSString alloc] initWithData:[[NSFileManager defaultManager] contentsAtPath:demoPath] encoding:NSUTF8StringEncoding];
    [CCExecutor startExecutor];
    JSValue *result = [CCExecutor evaluateCoffeeScript:demoScript withType:CoffeeScriptTypePure];
    NSLog(@"the result is : %d", [result toInt32]);
    
    // CoffeeScript for UI
    NSString *UIDemoPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"UIDemo" ofType:@"coffee"];
    NSString *UIDemoScript = [[NSString alloc] initWithData:[[NSFileManager defaultManager] contentsAtPath:UIDemoPath] encoding:NSUTF8StringEncoding];
    [CCExecutor evaluateCoffeeScript:UIDemoScript withType:CoffeeScriptTypeMix];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
