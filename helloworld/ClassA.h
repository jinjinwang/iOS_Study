//
//  ClassA.h
//  mytest
//
//  Created by jinjinwang on 15/6/30.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtocolA.m"

@protocol ProtocolB

-(void) print;

@optional
-(void) print2;

@required
-(void) print3;

@end

@interface ClassA : NSObject <ProtocolB>
{
    int x;
}

-(void) initVal:(int)_x;
-(void) print;


@end
