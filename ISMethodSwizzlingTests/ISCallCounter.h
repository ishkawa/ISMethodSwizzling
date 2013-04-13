#import <Foundation/Foundation.h>

NSUInteger ISCount1;
NSUInteger ISCount2;

@interface ISCallCounter : NSObject

@property (nonatomic) NSUInteger count1;
@property (nonatomic) NSUInteger count2;

- (void)method1;
- (void)method2;

+ (void)reset;
+ (void)method1;
+ (void)method2;

@end
