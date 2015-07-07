//
//  ClassA.m
//  mytest
//
//  Created by jinjinwang on 15/6/30.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ClassA.h"

@implementation ClassA

-(void) initVal:(int)_x
{
    x = _x;
}

-(void) print
{
    NSLog(@"classA , x = %d", x);
}

@end
