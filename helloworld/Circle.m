//
//  Circle.m
//  helloworld
//
//  Created by jinjinwang on 15-6-3.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import "Circle.h"

@implementation Circle

@synthesize radius;
@synthesize otherCircle;

-(void) setOrigin:(XYPoint *)pt{
    // 浅拷贝， 指向的地址是同一个
    origin = pt;
    
    /*
    // 深拷贝
    if(origin){
        [origin release]; // 拷贝前先释放掉原来指向的空间
    }
    origin = [[XYPoint alloc]init]; // 开辟新空间
    [origin setX:pt.x andY:pt.y]; // 赋值
    */
    
}

-(XYPoint*) origin{
    return origin;
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:origin name:@"test"object:nil];
    
    // 释放对象时取消监听
    [origin removeObserver:origin forKeyPath:@"x" context:nil];
    [origin removeObserver:origin forKeyPath:@"y" context:nil];
    [self removeObserver:self forKeyPath:@"radius" context:nil];
    [origin release];
    origin = nil;
    [super dealloc];
}

/**
 *  属性值改变时回调
 *
 *  @param keyPath 键路径
 *  @param object  观察属性变化的对象
 *  @param change  属性变化情况
 *  @param context <#context description#>
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@", object);
    if([keyPath isEqual:@"radius"]){
        NSLog(@"circle的radius被改变了");
        NSLog(@"circle的新半径是：%@, 旧半径是%@", [change objectForKey:@"new"], [change objectForKey:@"old"]);
    }
}

-(void) print{
    
}


/*
- (void) print{
    NSLog(@"The radius of the circle is %d in (%d, %d)", radius, x, y);
}

- (void) setR:(int)_r andX:(int)_x andY:(int)_y{
    radius = _r;
    x = _x;
    y = _y;
}
*/
- (float) girth{
    return 2*3.14*radius;
}

- (float) area{
    return 3.14*radius*radius;
}

+ (void) allNum{
    NSLog(@"This is a circle");
}

- (id) initOrigin:(XYPoint *)_origin andRadius:(int)_radius{
    // 第一步，对形参判断
    if(_radius < 0){
        radius = 1;
    }
    if(_origin == nil){
        
        [self release]; // 释放当前对象的内存
        return nil;
    }
    
    // 第二步，对父类成员初始化
    if(!(self=[super init])){
        return nil;
    }
    
    // 第三步，对自己特有的数据成员初始化
    if(origin){
        [origin release];
    }
    origin = [[XYPoint alloc]init];
    [origin setX:_origin.x andY:_origin.y];
    radius = _radius;
    
    //origin为事件的监听者，需要在XYPoint中实现监听触发的回调函数observeValueForKeyPath:ofObject:change:context
    [origin addObserver:origin // 事件监听者
            forKeyPath:@"x" // 监听的属性
            options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld // 得到的值，回调时对应字典的key为new和old
            context:nil];
    [origin addObserver:origin forKeyPath:@"y" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    //self为事件的监听者，需要在当前类中实现监听触发的回调函数
    [self addObserver:self forKeyPath:@"radius" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    //通过单例得到通知中心，相当于通知在什么地方发布
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    // 注册通知
    [center addObserver: origin // 观察者，即在什么地方接收通知
            selector:@selector(test:) // 收到通知后调用何种方法
            name:@"test" // 通知的名字，也是通知的唯一标示，编译器就通过这个找到通知的
            object:nil];
    // NSNotification * notification = [NSNotification notificationWithName:@"test" object:self  userInfo:nil];
    // [center postNotification:notification];
    [center postNotificationName: @"test" object:origin userInfo:nil];
    
    return self;
    
    
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"I'm the circle!"];
}
@end
