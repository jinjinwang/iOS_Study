//
//  main.m
//  helloworld
//
//  Created by jinjinwang on 15-6-3.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.h"
#import "Circle+ellipse.h"
void testNSLog(){
    // %@ : Object
    NSString * str = @"Hello world!";
    NSLog(@"NSString is : %@", str);
    
    NSNumber * num = [NSNumber numberWithInt:100];
    NSLog(@"NSNumber : %@", num);
    
    
    // %d : sign int
    int intvalue = -100;
    NSInteger intvalue2 = -999;
    NSLog(@"int : %d, %ld", intvalue, intvalue2);
    
    // %u : unsigned int
    unsigned int uintvalue = 100;
    NSLog(@"unsigned int : %u", uintvalue);
    
    // %f : float/double
    float floatValue = 20.20;
    double doubleValue = 50.55;
    NSLog(@"float : %f , double : %f", floatValue, doubleValue);
    
    // %p : pointer
    char* p = "test pointer";
    NSLog(@"pointer : %p", p);
    NSLog(@"char * p : %s", p);

    // %c : char; %C : unichar
    char achar = 'G'; // char型, 一个字节
    char bchar = 0x61; // 'a'
    unichar aunichar = 0x4f60; // unichar两个字节, L'你'
    NSLog(@"char : %c, %c", achar, bchar);
    NSLog(@"unichar : %C", aunichar);
    
    // %s : C string(bytes);
    // %S : C string(unichar)
    NSLog(@"C string(bytes) : %s", p);
    unichar punichar[] = {L'你', L'好', 0x0000}; // 以\0结尾
    NSLog(@"C string(unichar) : %S", punichar);
    
    // %lld : long long
    // %llu : unsigned long long
    // %Lf : long double
    long int longint1 = 123123123;
    long long verylong = -1234567890987654321;
    unsigned long long uverylong =  12345678901234567;
    long double alongdouble = 12345678889.12343242;
    NSLog(@"%ld : ", longint1);
    NSLog(@"long long : %lld", verylong);
    NSLog(@"unsigned long long : %llu", uverylong);
    NSLog(@"long double : %Lf", alongdouble);
}

void testCircle(){
    Circle * circle = [[Circle alloc] init];
    // [circle setR:3 andX:4 andY:5];
    // [circle print];
    circle.radius  = 6;
    // [circle print];
    NSLog(@"The girth of the circle is %f", [circle girth]);
    NSLog(@"The area of the circle is %f", [circle area]);
    [Circle allNum];
    [circle categoryMethod];
    
    XYPoint* point = [[XYPoint alloc]init];
    [point setX:5 andY:6];
    circle.origin = point;
    // [circle setOrigin:point];
    NSLog(@"The circle's radious is %d, the center is at (%d, %d)", circle.radius, circle.origin.x, circle.origin.y);
    [point setX:50 andY:60];
    NSLog(@"The new circle's radious is %d, the center is at (%d, %d)", circle.radius, [circle.origin x], [[circle origin] y]);
    
    XYPoint * tmpPoint = circle.origin;
    NSLog(@"The coordinate is (%d, %d).", tmpPoint.x, tmpPoint.y);

    
    [point release];
    // [circle.origin release];
    [circle release];
    // NSLog(@"The coordinate is (%d, %d) after release the circle.", tmpPoint.x, tmpPoint.y);

}

void testReferenceCounter(){
    Circle * c = [[Circle alloc] init];
    NSLog(@"the reference counter1 is %ld" , [c retainCount]);
    [c retain];
    NSLog(@"the reference counter2 is %ld" , [c retainCount]);
    [c release];
    NSLog(@"the reference counter3 is %ld" , [c retainCount]);
    [c release];
    NSLog(@"the reference counter4 is %ld" , [c retainCount]);
    // [c release];
    // NSLog(@"the reference counter5 is %u" , [c retainCount]);
}

void testReferenceCounter2(){
    XYPoint *p = [[XYPoint alloc] init];
    NSLog(@"p1:%ld", [p retainCount]);
    
    Circle *c  = [[Circle alloc] init];
    NSLog(@"c:%ld", [c retainCount]);
    
    c.origin = p;
    NSLog(@"p2:%ld", [p retainCount]);
    
    Circle *c1 = [[Circle alloc]initOrigin:p andRadius:2];
    NSLog(@"p3:%ld", [p retainCount]);
    
    [p release];
    NSLog(@"p4:%ld", [p retainCount]);
    
    // [c release];
    // NSLog(@"p5:%ld", [p retainCount]);
    
    [c1 release];
    // NSLog(@"p6:%ld", [p retainCount]);
}

/**
 *  字符串读写文件
 */
void testStringWithFile(){
    // NSString * str = @"hello world!";
    // 写文件
    // [str writeToFile:@"1.txt" atomically:NO encoding:NSUTF8StringEncoding error:nil];
    // 读文件
    NSError* error;
    NSString * newStr = [NSString stringWithContentsOfFile:@"1.txt" encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"%@", newStr);
    // 输出错误信息
    NSLog(@"%@", error);
}

/**
 *  测试NSMutableString
 */
void testMutableString(){
    // NSString是不能改变的， 下面两种方式返回的是一个新的字符串，而不是对原来的串进行处理的
    NSString* str = @"123";
    // 追加串
    str = [str stringByAppendingString:@"456"];
    // 格式化串
    str = [NSString stringWithFormat:@"%@%@", str, @"789"];
    NSLog(@"%@", str);
    
    // 可变字符串
    NSMutableString *mutableStr1 = [[NSMutableString alloc] initWithFormat:@"joysim"];
    NSMutableString *mutableStr2 = [NSMutableString stringWithFormat:@"欢迎你"];
    NSLog(@"原串1：%@", mutableStr1);
    NSLog(@"原串2：%@", mutableStr2);
    
    // 拼接
    [mutableStr1 appendString:mutableStr2];
    NSLog(@"拼接后：%@", mutableStr1);
    
    // 插入
    [mutableStr1 insertString:@"3G" atIndex:6];
    NSLog(@"插入后： %@", mutableStr1);
    
    // 替换
    NSRange range = {0, 2};
    [mutableStr1 replaceCharactersInRange:range withString:@"123"];
    NSLog(@"替换后：%@", mutableStr1);
    
    //  删除
    [mutableStr1 deleteCharactersInRange:NSMakeRange(2, 2)];
    NSLog(@"删除后：%@", mutableStr1);
}

/**
 *  测试数组NSArray
 */
void testArray(){
    // 数组中只能保存对象， 不能保存基础数据类型数据
    NSArray* array = @[@"123", @"ceshi", @"hello"]; // 静态数组
    NSLog(@"数组大小: %ld", [array count]);
}

/**
 *  测试kvc(key value coding)
 */
void testKVC(){
    Circle* circle = [[Circle alloc] init];
    // 通过kvc对circle对象的radius属性进行赋值
    [circle setValue:@"12" forKey:@"radius"];
    NSString* str = [circle valueForKey:@"radius"];
    NSLog(@"radius = %@", str);
    
    XYPoint* point = [[XYPoint alloc] init];
    [point setValue:@"2" forKey:@"x"];
    [point setValue:@"4" forKey:@"y"];
    [circle setValue:point forKey:@"origin"]; // 会调用circle的setOrigin方法
    
    // 通过键路径访问属性
    NSLog(@"x1 = %@, x2 = %@", [circle valueForKeyPath:@"origin.x"], [point valueForKey:@"x"]);
    NSLog(@"y = %@, y2 = %@", [circle valueForKeyPath:@"origin.y"], [point valueForKey:@"y"]);
    
    [circle setValue:@"5" forKeyPath:@"origin.x"];
    [circle setValue:@"15" forKeyPath:@"origin.y"];
    
    
    NSLog(@"x1 = %@, x2 = %@, x3 = %@", [circle valueForKeyPath:@"origin.x"], [point valueForKey:@"x"], [[circle valueForKey:@"origin"] valueForKey:@"x"]);
    NSLog(@"y = %@, y2 = %@, y3 = %@", [circle valueForKeyPath:@"origin.y"], [point valueForKey:@"y"], [[circle valueForKey:@"origin"] valueForKey:@"y"]);
    
    // 操作集合
    Circle *circle1 = [[Circle alloc] init];
    Circle *circle2 = [[Circle alloc] init];
    Circle *circle3 = [[Circle alloc] init];
    
    [circle1 setValue:@"5" forKey:@"radius"];
    [circle2 setValue:@"9" forKey:@"radius"];
    [circle3 setValue:@"7" forKey:@"radius"];
    
    NSArray *array = [NSArray arrayWithObjects:circle1, circle2, circle3, nil];
    [circle setValue:array forKey:@"otherCircle"];
    NSLog(@"其他circle的半径 ：%@", [circle valueForKeyPath:@"otherCircle.radius"]);
    NSLog(@"共%@个circle", [circle valueForKeyPath:@"otherCircle.@count"]);
    NSLog(@"最大半径: %@", [circle valueForKeyPath:@"otherCircle.@max.radius"]);
    NSLog(@"最小半径: %@", [circle valueForKeyPath:@"otherCircle.@min.radius"]);
    NSLog(@"平均: %@", [circle valueForKeyPath:@"otherCircle.@avg.radius"]);
}

/**
 *  测试KVO(key value observing)
 */
void testKVO(){
    XYPoint *point = [[XYPoint alloc]init];
    [point setX:1 andY:1];
    NSLog(@"初始值: %@", [point valueForKey:@"x"]);
    
    Circle *circle = [[Circle alloc] initOrigin:point andRadius:1];
    
    [circle.origin setValue:@"20" forKey:@"x"];
    // [circle setValue:@"10" forKeyPath:@"origin.y"];
    // [circle setRadius:2];
    // [[circle origin] setX:12 andY:12];
}

int global = 1000;
/**
 *  测试代码块
 */
void testBlock(){
    // 实例1
    int multiplier = 5;
    int (^myBlock)(int) = ^(int num){
        return num * multiplier;
    };
    
    // 调用块对象变量
    int result = myBlock(6);
    NSLog(@"%d", result);
    
    // 实例2：参数是NSString的代码块
    void (^stringBlock)(NSString *) = ^(NSString *str){
        NSLog(@"参数是字符串的代码块：%@", str);
    };
    stringBlock(@"hello world!");
    
    // 实例3: 字符串数组排序
    NSArray *array = [NSArray arrayWithObjects:@"abc 1", @"abc 21", @"abc 12",@"abc 13",@"abc 05", nil];
    // NSComparator是一个定义好的block
    NSComparator sortBlock = ^(NSString *s1, NSString *s2){
        return [s1 compare:s2];
    };
    NSArray *newArray = [array sortedArrayUsingComparator:sortBlock];
    NSLog(@"字符串array排序 : %@", newArray);
    
    // 实例4：代码块的递归调用
    static void (^recursionBlock)(int) = ^(int num){
        if (num > 0) {
            NSLog(@"num = %d", num);
            recursionBlock(num - 1);
        }
    };
    recursionBlock(4);
    
    // 实例5: 在代码块中使用全局变量和局部变量
    void(^block)(void) = ^(void){
        global++;
        NSLog(@"global:%d", global);
    };
    block();
    NSLog(@"global:%d", global);
    
    // 局部变量只能使用不能改变， 改变局部变量的值需要使用关键字__block
    __block int local = 500;
    void(^block2)(void) = ^(void){
        local++;
        NSLog(@"local:%d", local);
    };
    block2();
    NSLog(@"local:%d", local);
    
    // 实例6: 使用类型定义typedef
    typedef int(^MyBlock)(int ,int);
    // 就可以利用这种类型来定义block变量了
    MyBlock a,b;
    a=^(int a,int b){
        return a-b;
    };
    b=^(int n1,int n2){
        return n1*n2;
    };
    NSLog(@"a = %d", a(2, 1));
    NSLog(@"b = %d", b(2, 1));
}

int main(int argc, const char * argv[])
{
    /*
    NSAutoreleasePool * pool =  [[NSAutoreleasePool alloc] init];
    // ...
    [pool drain];
     */
    @autoreleasepool {
        // tes	tNSLog();
        // testCircle();
        // testReferenceCounter2();
        // testStringWithFile();
        // testMutableString();
        // testArray();
        // testKVC();
        // testKVO();
        testBlock();
    }
    return 0;
}

