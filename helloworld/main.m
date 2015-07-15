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
#import "ClassA.h"

/**
 *  格式化输出日志
 */
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

/**
 *  类相关：定义，实现，初始化，深浅复制，property，category等
 */
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

/**
 *  引用计数
 */
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

/**
 *  引用计数
 */
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
 *  字符串
 */
void testString(){
    // 初始化(工厂行为：对象初始化)
    // 行为
    // 静态NSString  动态NSMutableString
    NSString *str = @"123";
    NSLog(@"%@", str);
    // 类的行为
    // 通过c字符串来构建一个oc字符串
    // char *cstr = "嘿嘿";
    // NSString *str1 = [NSString stringWithCharacters:cstr length:strlen(cstr)];
    // NSLog(@"%@", str1);
    // 通过类方法初始化
    NSString * str2 = [NSString stringWithFormat:@"%d", 123];
    NSLog(@"%@", str2);
    
    NSString * str3 = [NSString stringWithUTF8String:"猪婆生日快乐"];
    NSLog(@"%@", str3);
    
    // NSString *str4 = [NSString stringWithString:@"hello"];
    NSString *str4=@"hello";
    NSLog(@"%@", str4);
    
    // 通过实例方法初始化
    NSString * str5 = [[NSString alloc] initWithUTF8String:"猪婆"];
    NSLog(@"%@", str5);
    
}

/**
 *  测试字符串的方法
 */
void testStringMethod(){
    NSString * str = @"哈aBc1";
    NSLog(@"%@", str);
    // 大小写
    str = [str uppercaseString];
    NSLog(@"大写：%@", str);
    str = [str lowercaseString];
    NSLog(@"小写：%@", str);
    // 长度
    NSLog(@"the length : %lu", [str length]);
    // 一个汉字占用三个字节
    NSLog(@"the length : %lu", [str lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    // 判断字符串中是否包含另一个字符串
    NSRange rang = [str rangeOfString:@"1"];
    NSLog(@"leng = %lu, location = %lu", rang.length, rang.location);
    if(rang.location == NSNotFound){
        NSLog(@"没有");
    }else{
        NSLog(@"有");
    }
    
    // 字符串内容比较
    NSLog(@"%@", [str isEqualToString:@"1"]?@"YES":@"NO");
    
    // 字符串转换为数字
    NSString * snum = @"12.345";
    NSLog(@"数字: %d", [snum intValue]);
    NSLog(@"数字: %f", [snum doubleValue]);
    
    // 判断字符串是否以什么字符串开头或结尾
    NSLog(@"是否以开头：%@", [snum hasPrefix:@"1"]?@"YES":@"NO");
    NSLog(@"是否以结尾：%@", [snum hasSuffix:@"1"]?@"YES":@"NO");
    
    // 提取子串
    NSLog(@"从指定位置开始的子串: %@", [snum substringFromIndex:1]);
    NSLog(@"到某个位置的子串: %@", [snum substringToIndex:2]);
    NSRange r = {1, 3};
    NSLog(@"从指定位置到指定位置的子串：%@", [snum substringWithRange:r]);
    
    // 实例：倒序显示字符串
    for (NSUInteger i = snum.length; i > 0; i--) {
        
        NSLog(@"%@", [snum substringWithRange:NSMakeRange(i-1, 1)]);
    }
    
    // 去除字符串两端的空格
    NSString * blankStr = @" say sad? ";
    NSLog(@"替换字符串两端的空格：%@%@%@", @"I want,", [blankStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]], @"to it");
    
    // 字符串读写文件
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

/*
 四种常用的结构
 */
void testStruct(){
    // OC中提供的结构： 点，大小，矩形，范围
    // 点
    CGPoint p = {100, 200};
    // p = CGPointMake(100, 200);
    // p.x = 100;
    // p.y = 100;
    NSLog(@"x=%g, y=%g", p.x, p.y);
    
    // 大小
    CGSize s = {100, 200};
    // s = CGSizeMake(10, 200);
    NSLog(@"width=%g, height=%g", s.width, s.height);
    
    // 矩形
    CGRect rect;
    rect.origin.x = 10;
    rect.origin.y = 20;
    rect.size.width = 100;
    rect.size.height = 50;
    // rect = CGRectMake(10, 20, 100, 50);
    
    // 范围
    NSRange range;
    range.length = 10;
    range.location = 10;
    
}

/**
 *  测试数组NSArray
 */
void testArray(){
    // 数组中只能保存对象， 不能保存基础数据类型数据
    //    NSArray *array = @[@"123", @"456", @"hello"]; // 静态数组
    //    NSArray *array = [NSArray arrayWithObjects:@"123", @"456", @"world", nil];
    NSArray *array = [[NSArray alloc] initWithObjects:@"123", @456, nil];
    NSLog(@"数组大小：%ld", [array count]);
    // 遍历
    //    for (int i = 0; i < [array count]; i++) {
    //        NSLog(@"%@", [array objectAtIndex:i]);
    //        NSLog(@"%@", array[i]);
    //    }
    //
    //    for (NSString *str in array) {
    //        NSLog(@"%@", str);
    //    }
    
    //    NSMutableArray *mutableArray = @[@"123", @"456", @"hello"];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:20];
    for (int i; i < 10; i++) {
        [mutableArray addObject:[NSString stringWithFormat:@"%d", i+1]];
    }
    //    [mutableArray removeAllObjects];
    [mutableArray removeLastObject];
    [mutableArray removeObjectAtIndex:1];
    [mutableArray insertObject:@"a" atIndex:0];
    for (NSString *str in mutableArray) {
        NSLog(@"%@", str);
    }
    
    
}

/**
 *  <pre>
 *  测试集合<br>
 *  1. 集合中的元素不重复,无序
 *  </pre>
 */
void testNSSet(){
    //    NSSet *set = [NSSet setWithObjects:@"1", @"2", @"5", @"3", @"2", nil];
    //    NSLog(@"集合元素个数：%ld", [set count]);
    //    NSArray *array = [set allObjects];
    // 转成数组后排序
    //    array = [array sortedArrayUsingSelector:@selector(compare:)];
    
    NSMutableSet *set = [NSMutableSet setWithCapacity:20];
    // 添加元素
    [set addObject:@"2"];
    [set addObject:@"1"];
    [set addObject:@"3"];
    [set addObject:@"4"];
    // 删除元素
    [set removeObject:@"3"];
    for (NSString *str in set) {
        NSLog(@"%@", str);
    }
}

/**
 *  测试字典类
 */
void testDictionary(){
    //    NSDictionary *dic = @{@"1":@"111", @"2":@"222"};
    //    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"zhangsan", @"1", @"lisi", @"2", nil];
    //    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"zhangsan", @"1", @"lisi", @"2", nil];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:10];
    // 添加元素
    [dic setObject:@"zhangsan" forKey:@"1"];
    [dic setObject:@"zhangsan" forKey:@"1"];
    [dic setObject:@"wangwu" forKey:@"3"];
    [dic setObject:@"lisi" forKey:@"2"];
    // 删除元素
    [dic removeObjectForKey:@"3"];
    NSArray *keys = [dic allKeys];
    for (NSString* key in keys) {
        NSLog(@"key=%@, value=%@", key, [dic objectForKey:key]);
    }
}

/**
 *  测试包裹类<br>
 *  1. 结构类数据(点，指针等)是不能直接保存在数组等集合中的，需要借助包裹类NSValue保存结构数据，然后存放在数组中<br>
 *  2. 基本的数据类型也不能保存在集合中，可以使用NSNumber进行封装，NSNumber是NSValue的子类
 */
void testNSValue(){
    // 简单的数据类型
    NSArray *arr = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithFloat:12.3], nil];
    for (NSNumber *num in arr) {
        NSLog(@"%g", [num floatValue]);
    }
    
    // 复杂的数据类型
    CGPoint point1 = {10, 10};
    CGPoint point2 = {20, 20};
    CGPoint point3 = {30, 30};
    // 封装成对象
    NSValue *v1 = [NSValue valueWithPoint:point1];
    NSValue *v2 = [NSValue valueWithPoint:point2];
    NSValue *v3 = [NSValue valueWithPoint:point3];
    
    NSArray *array = [NSArray arrayWithObjects:v1, v2, v3, nil];
    for (NSValue* v in array) {
        // 取出结构数据
        CGPoint p = [v pointValue];
        NSLog(@"x = %g, y = %g", p.x, p.y);
    }
}

/**
 *  集合数据操作文件
 */
void testCollection4File(){
    // 数组
    //        NSArray *arr =[NSArray arrayWithObjects:@"111", @"555", @"333", @"444", nil];
    //        [arr writeToFile:@"array.plist" atomically:NO];
    
    //    NSArray *arr = [NSArray arrayWithContentsOfFile:@"array.plist"];
    //    for (NSString *str in arr) {
    //        NSLog(@"%@", str);
    //    }
    // 集合， 需要转成数组操作
    //    NSSet *set = [[NSSet alloc] initWithObjects:@"zhangsan", @"lisi", @"wangwu", nil];
    //    [[set allObjects] writeToFile:@"set.plist" atomically:NO];
    
    // 字典
    //    [[[NSDictionary alloc] initWithObjectsAndKeys:@"zhangsan", @"1", @"lisi", @"3", @"wangwu", @"2", nil] writeToFile:@"dict.plist" atomically:NO];
    NSLog(@"%@", [NSDictionary dictionaryWithContentsOfFile:@"dict.plist"]);
}

/**
 *  NSData和NSMutableData用于保存二进制数据
 */
void testNSData(){
    // 读取文件
    NSData *data = [NSData dataWithContentsOfFile:@"a.png"];
    NSLog(@"%ld", data.length);
    unsigned char *ch = [data bytes];
    NSLog(@"%x, %x", ch[0], ch[1]);
    // 写入文件
    [data writeToFile:@"b.jpg" atomically:NO];
    
}

/**
 *  测试protocol
 */
void testProtocol(){
    ClassA *class = [[ClassA alloc] init];
    [class initVal:3];
    [class print];
    
    // 协议适用性检查
    NSLog(@"对象class是否采用ProtocolA协议：%hhd", [class conformsToProtocol:@protocol(ProtocolA)]);
    NSLog(@"类ClassA是否采用ProtocolB协议：%hhd", [ClassA conformsToProtocol:@protocol(ProtocolB)]);
    
    
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

/**
 *  测试对象的复制
 */
void testCopying(){
    NSString *str = @"123";
    
    // 创建一个不可变的副本
    NSString *str2 = [str copy];
    NSLog(@"nsstring copy : %i", str2 == str);
    
    // 创建一个可变的副本
    NSString *str3 = [str mutableCopy];
    NSLog(@"nsstring mutablecopy : %i", str == str3);
    
    NSMutableString *mstr = [NSMutableString stringWithFormat:@"abc"];
    NSString *mstr1 = [mstr copy];
    NSMutableString *mstr2 = [mstr mutableCopy];
    
    [mstr appendFormat:@"12"];
    NSLog(@"nsmutablestring copy : %i", mstr == mstr1);
    NSLog(@"nsmutablestring mutablecopy : %i", mstr == mstr2);
    
    NSLog(@"mstr : %@", mstr);
    NSLog(@"mstr1 : %@", mstr1);
    NSLog(@"mstr2 : %@", mstr2);
    
    // 对象的复制
    Circle *circle = [[Circle alloc] init];
    XYPoint *point = [[XYPoint alloc] init];
    [point setX:1 andY:2];
    [circle initOrigin:point andRadius:3];
    
    /**
     *  1. Circle必须实现NSCopying协议
     *  2. 需要重写- (id)copyWithZone:(NSZone *)zone方法
     */
    Circle *circle2 = [circle copy];
    NSLog(@"%@", circle);
    NSLog(@"%@", circle2);
    
}

int main(int argc, const char * argv[])
{
    /*
    NSAutoreleasePool * pool =  [[NSAutoreleasePool alloc] init];
    // ...
    [pool drain];
     */
    @autoreleasepool {
        // 格式化输出日志
//        testNSLog();
        
        // 类相关：定义，实现，初始化，深浅复制，property，category等
//        testCircle();
//
//        // 对象的引用计数
//        testReferenceCounter();
//        testReferenceCounter2();
//        
//        // 四种常用的结构(点，大小，矩形，范围)
//        testStruct();
//        
//        // 字符串
//        testString();
//        
//        // 字符串方法
//        testStringMethod();
//        
//        // 可变字符串
//        testMutableString();
//        
//        // 数组
//        testArray();
//        
//        // 集合
//        testNSSet();
//        
//        // 字典
//        testDictionary();
//        
//        // 包裹类
//        testNSValue();
//        
//        // 集合操作文件
//        testCollection4File();
//        
//        // NSData操作二进制文件
//        testNSData();
//        
//        // 协议
//        testProtocol();
//        
//        // 代码块
//        testBlock();
//        
//        // KVC
//        testKVC();
//        
//        // KVO
//        testKVO();
        
        // 对象的拷贝
        testCopying();
    }
    return 0;
}

