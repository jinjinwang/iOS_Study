//
//  XYPoint.m
//  helloworld
//
//  Created by jinjinwang on 15-6-5.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import "XYPoint.h"

@implementation XYPoint

@synthesize x=_x, y=_y;
-(void) setX:(int)xVal andY:(int)yVal{
    self.x = xVal;
    self.y = yVal;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"I'm the point of the circle's center!"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@", object);
    if([keyPath isEqual:@"x"]){
        NSLog(@"circle的point被改变了");
        NSLog(@"circle中心的新横坐标是：%@, 旧坐标是%@", [change objectForKey:@"new"], [change objectForKey:@"old"]);
    }
    if([keyPath isEqual:@"y"]){
        NSLog(@"circle的point被改变了");
        NSLog(@"circle中心的新纵坐标是：%@, 旧坐标是%@", [change objectForKey:@"new"], [change objectForKey:@"old"]);
    }
}

-(void)test:(NSNotification *)notification
{
    NSLog(@"name : %@ , oject = %@  ,userInfo = %@",[notification name],[notification object],[notification userInfo]);
}

@end
