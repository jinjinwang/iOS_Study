//
//  Circle.h
//  helloworld
//
//  Created by jinjinwang on 15-6-3.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"

@class XYPoint; // 前向声明（提高程序运行的效率）
@interface Circle : NSObject<NSCopying>
{
    int radius;
    // int x;
    // int y;
    XYPoint *origin; // 定义类XYPoint对象， 作为circle的实例变量
    NSArray *otherCircle; // 测试kvc, 其他的circle
}

// static int sum = 5;
@property(nonatomic) int radius;
// @property(nonatomic, retain) XYPoint* origin;
@property(nonatomic, retain) NSArray *otherCircle;

-(void) setOrigin:(XYPoint*)pt;
-(XYPoint*) origin;
-(void) dealloc; // 重新定义析构函数

- (void) print;
//- (void) setR : (int)_r andX : (int)_x andY : (int)_y;
- (float) girth;
- (float) area;
+ (void) allNum;


- (id) initOrigin : (XYPoint *)_origin andRadius : (int)_radius;

@end
