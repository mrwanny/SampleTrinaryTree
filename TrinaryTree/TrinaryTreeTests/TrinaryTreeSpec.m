#import "Kiwi.h"
#import "TrinaryTree.h"

SPEC_BEGIN(TrinaryTreeSpec)

describe(@"TrinaryTree", ^{
    context(@"nil tree", ^{
        __block TrinaryTree *tree = nil;
        
        beforeEach(^{
            tree = [[TrinaryTree alloc] init];
        });
        
        
        it(@"should have resprond to insert and delete method", ^{
            [[tree should] respondsToSelector:@selector(insertNodeForKey:)];
            [[tree should] respondsToSelector:@selector(deleteNodeForKey:)];
            [[tree rootNode] shouldBeNil];
            
        });
        
    });
    
    context(@"example tree", ^{
        __block TrinaryTree *tree = nil;
        
        beforeAll(^{
            tree = [[TrinaryTree alloc] init];
            
            [tree insertNodeForKey:[NSNumber numberWithInteger:5]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:4]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:9]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:5]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:7]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:2]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:2]];
                        
        });
        
        
        it(@"root should be 5 and has middle 5", ^{
            [[[[tree rootNode] key] should] equal:[NSNumber numberWithInteger:5]];
            [[[[[tree rootNode] middle] key] should] equal:[NSNumber numberWithInteger:5]];
            
        });
        
        it(@"root left should be 4, left left 2 and left left middle 2", ^{
            [[[[[tree rootNode] left] key] should] equal:[NSNumber numberWithInteger:4]];
            [[[[[[tree rootNode] left] left] key] should] equal:[NSNumber numberWithInteger:2]];
            [[[[[[[tree rootNode] left] left] middle] key] should] equal:[NSNumber numberWithInteger:2]];
            
            
        });
        
        it(@"root right should be 9 and right left 7", ^{
            [[[[[tree rootNode] right] key] should] equal:[NSNumber numberWithInteger:9]];
            [[[[[[tree rootNode] right] left] key] should] equal:[NSNumber numberWithInteger:7]];
            
        });
        
        
    });
    
    context(@"example tree and delete 5", ^{
        __block TrinaryTree *tree = nil;
        
        beforeAll(^{
            tree = [[TrinaryTree alloc] init];
            
            [tree insertNodeForKey:[NSNumber numberWithInteger:5]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:4]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:9]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:5]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:7]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:2]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:2]];
            
            [tree deleteNodeForKey:[NSNumber numberWithInteger:5]];
            
        });
        
        
        it(@"root should be 5 and has middle nil", ^{
            [[[[tree rootNode] key] should] equal:[NSNumber numberWithInteger:5]];
            [[[tree rootNode] middle] shouldBeNil];
            
        });
        
        it(@"root left should be 4, left left 2 and left left middle 2", ^{
            [[[[[tree rootNode] left] key] should] equal:[NSNumber numberWithInteger:4]];
            [[[[[[tree rootNode] left] left] key] should] equal:[NSNumber numberWithInteger:2]];
            [[[[[[[tree rootNode] left] left] middle] key] should] equal:[NSNumber numberWithInteger:2]];
            
            
        });
        
        it(@"root right should be 9 and right left 7", ^{
            [[[[[tree rootNode] right] key] should] equal:[NSNumber numberWithInteger:9]];
            [[[[[[tree rootNode] right] left] key] should] equal:[NSNumber numberWithInteger:7]];
            
        });
        
        
    });

    context(@"example tree and delete 5,5", ^{
        __block TrinaryTree *tree = nil;
        
        beforeAll(^{
            tree = [[TrinaryTree alloc] init];
            
            [tree insertNodeForKey:[NSNumber numberWithInteger:5]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:4]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:9]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:5]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:7]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:2]];
            [tree insertNodeForKey:[NSNumber numberWithInteger:2]];
            
            [tree deleteNodeForKey:[NSNumber numberWithInteger:5]];
            [tree deleteNodeForKey:[NSNumber numberWithInteger:5]];
            
        });
        
        
        it(@"root should be 4, left 2, left middle 2, right 9, right left 7", ^{
            [[[[tree rootNode]  key] should] equal:[NSNumber numberWithInteger:4]];
            [[[[[tree rootNode] left] key] should] equal:[NSNumber numberWithInteger:2]];
            [[[[[[tree rootNode] left] middle] key] should] equal:[NSNumber numberWithInteger:2]];
            [[[[[tree rootNode] right] key] should] equal:[NSNumber numberWithInteger:9]];
            [[[[[[tree rootNode] right] left]  key] should] equal:[NSNumber numberWithInteger:7]];
            
            
        });
        
        
    });


});


SPEC_END