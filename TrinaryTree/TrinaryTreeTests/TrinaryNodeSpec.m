#import "Kiwi.h"

#import "TrinaryNode.h"

SPEC_BEGIN(TrinaryNodeSpec)

describe(@"TrinaryNode", ^{
    
    context(@"nil node", ^{
        __block TrinaryNode *node = nil;
        
       beforeEach(^{
            node = [[TrinaryNode alloc] init];
        });
        
        
        it(@"should have a nil key property", ^{
            [[node should] respondsToSelector:@selector(setKey:)];
            [[node should] respondsToSelector:@selector(key)];
            [[node key] shouldBeNil];
            
        });
        
        it(@"should have a nil left node property", ^{
            [[node should] respondsToSelector:@selector(setLeft:)];
            [[node should] respondsToSelector:@selector(left)];
            [[node left] shouldBeNil];
        });
        
        it(@"should have a nil middle node property", ^{
            [[node should] respondsToSelector:@selector(setMiddle:)];
            [[node should] respondsToSelector:@selector(middle)];
            [[node middle] shouldBeNil];
        });
        
        it(@"should have a nil right property", ^{
            [[node should] respondsToSelector:@selector(setRight:)];
            [[node should] respondsToSelector:@selector(right)];
            [[node right] shouldBeNil];
        });

    });
    
    context(@"node", ^{
        __block TrinaryNode *node = nil;
        
        beforeEach(^{
            node = [[TrinaryNode alloc] initWithKey:[NSNumber numberWithInteger:5]];
            [node setLeft:[[TrinaryNode alloc] initWithKey:[NSNumber numberWithInteger:4]]];
            [node setMiddle:[[TrinaryNode alloc] initWithKey:[NSNumber numberWithInteger:5]]];
            [node setRight:[[TrinaryNode alloc] initWithKey:[NSNumber numberWithInteger:6]]];
            
        });
        
        
        it(@"should have a NSNumber key property", ^{
            [[[node key] should] beKindOfClass:[NSNumber class]];
            [[[node key] should] equal:[NSNumber numberWithInteger:5]];
            
        });
        
        it(@"should have a TrinaryNode left node property", ^{
            [[[node left] should] beKindOfClass:[TrinaryNode class]];
            [[[[node left] key] should] equal:[NSNumber numberWithInteger:4]];
        });
        
        it(@"should have a TrinaryNode middle node property", ^{
            [[[node middle] should] beKindOfClass:[TrinaryNode class]];
            [[[[node middle] key] should] equal:[NSNumber numberWithInteger:5]];
        });
        
        it(@"should have a TrinaryNode right property", ^{
            [[[node right] should] beKindOfClass:[TrinaryNode class]];
            [[[[node right] key] should] equal:[NSNumber numberWithInteger:6]];
        });
    });
    
    
});
 
SPEC_END