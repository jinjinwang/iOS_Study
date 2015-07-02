//
// The center's coordinate of the circle, we use two separate values, x and y.
//  XYPoint.h
//  helloworld
//
//  Created by jinjinwang on 15-6-5.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYPoint : NSObject
{
    int _x;
    int _y;
}
@property(nonatomic) int x, y;
-(void)setX:(int)xVal andY:(int)yVal;

@end
