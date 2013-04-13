#import "Kiwi.h"
#import "ISCallCounter.h"
#import "ISMethodSwizzling.h"

SPEC_BEGIN(ISMethodSwizzlingSpec)

describe(@"ISMethodSwizzling", ^{
    __block ISCallCounter *object;
    
    beforeEach(^{
        [ISCallCounter reset];
        
        object = [[ISCallCounter alloc] init];
    });
    
    context(@"swizzled instance methods", ^{
        beforeEach(^{
            ISSwizzleInstanceMethod([ISCallCounter class], @selector(method1), @selector(method2));
        });
        
        afterEach(^{
            ISSwizzleInstanceMethod([ISCallCounter class], @selector(method1), @selector(method2));
        });
        
        context(@"when method1 is called", ^{
            beforeEach(^{
                [object method1];
            });
            
            it(@"does not count up count1", ^{
                [[theValue(object.count1) should] equal:theValue(0U)];
            });
            
            it(@"counts up count2", ^{
                [[theValue(object.count2) should] equal:theValue(1U)];
            });
        });
        
        context(@"when method2 is called", ^{
            beforeEach(^{
                [object method2];
            });
            
            it(@"counts up count1", ^{
                [[theValue(object.count1) should] equal:theValue(1U)];
            });
            
            it(@"does not count up count2", ^{
                [[theValue(object.count2) should] equal:theValue(0U)];
            });
        });
        
        // does not affect class methods
        context(@"when class method1 is called", ^{
            beforeEach(^{
                [ISCallCounter method1];
            });
            
            it(@"counts up count1", ^{
                [[theValue(ISCount1) should] equal:theValue(1U)];
            });
            
            it(@"does not count up count2", ^{
                [[theValue(ISCount2) should] equal:theValue(0U)];
            });
        });
        
        // does not affect class methods
        context(@"when class method2 is called", ^{
            beforeEach(^{
                [ISCallCounter method2];
            });
            
            it(@"does not count up count1", ^{
                [[theValue(ISCount1) should] equal:theValue(0U)];
            });
            
            it(@"counts up count2", ^{
                [[theValue(ISCount2) should] equal:theValue(1U)];
            });
        });
    });
    
    context(@"swizzled class methods", ^{
        beforeEach(^{
            ISSwizzleClassMethod([ISCallCounter class], @selector(method1), @selector(method2));
        });
        
        afterEach(^{
            ISSwizzleClassMethod([ISCallCounter class], @selector(method1), @selector(method2));
        });
        
        context(@"when class method1 is called", ^{
            beforeEach(^{
                [ISCallCounter method1];
            });
            
            it(@"does not count up count1", ^{
                [[theValue(ISCount1) should] equal:theValue(0U)];
            });
            
            it(@"counts up count2", ^{
                [[theValue(ISCount2) should] equal:theValue(1U)];
            });
        });
        
        context(@"when class method2 is called", ^{
            beforeEach(^{
                [ISCallCounter method2];
            });
            
            it(@"counts up count1", ^{
                [[theValue(ISCount1) should] equal:theValue(1U)];
            });
            
            it(@"does not count up count2", ^{
                [[theValue(ISCount2) should] equal:theValue(0U)];
            });
        });
        
        // does not affect instance methods
        context(@"when instance method1 is called", ^{
            beforeEach(^{
                [object method1];
            });
            
            it(@"counts up count1", ^{
                [[theValue(object.count1) should] equal:theValue(1U)];
            });
            
            it(@"does not count up count2", ^{
                [[theValue(object.count2) should] equal:theValue(0U)];
            });
        });
        
        // does not affect instance methods
        context(@"when instance method2 is called", ^{
            beforeEach(^{
                [object method2];
            });
            
            it(@"does not count up count1", ^{
                [[theValue(object.count1) should] equal:theValue(0U)];
            });
            
            it(@"counts up count2", ^{
                [[theValue(object.count2) should] equal:theValue(1U)];
            });
        });
    });
});

SPEC_END
