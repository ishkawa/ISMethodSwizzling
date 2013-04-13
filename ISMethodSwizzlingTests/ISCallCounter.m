#import "ISCallCounter.h"

@implementation ISCallCounter

- (id)init
{
    self = [super init];
    if (self) {
        _count1 = 0U;
        _count2 = 0U;
    }
    return self;
}

- (void)method1
{
    self.count1++;
}

- (void)method2
{
    self.count2++;
}

+ (void)reset
{
    ISCount1 = 0U;
    ISCount2 = 0U;
}

+ (void)method1
{
    ISCount1++;
}

+ (void)method2
{
    ISCount2++;
}

@end
