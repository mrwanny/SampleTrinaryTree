//
//  TrinaryTree.m
//  TrinaryTree
//
//  Created by wanny on 10/13/12.
//  Copyright (c) 2012 All rights reserved.
//

#import "TrinaryTree.h"

@implementation TrinaryTree

-(void)insertNodeForKey:(NSNumber *)key {
    if (self.rootNode == nil) {
        [self setRootNode:[[TrinaryNode alloc] initWithKey:key]];
    }else {
        [self addChildNodeForKey:key atNode:self.rootNode];
        
    }
    
}

-(void)addChildNodeForKey:(NSNumber *)key atNode:(TrinaryNode *)node {
    
    switch ([key compare:node.key]) {
            
        case NSOrderedSame:
            if (node.middle) {
                [self addChildNodeForKey:key atNode:node.middle];
            }else {
                [node setMiddle:[[TrinaryNode alloc] initWithKey:key]];
            }
            break;
            
        case NSOrderedAscending:
            if (node.left) {
                [self addChildNodeForKey:key atNode:node.left];
            }else {
                [node setLeft:[[TrinaryNode alloc] initWithKey:key]];
            }
            break;
            
        case NSOrderedDescending:
            if (node.right) {
                [self addChildNodeForKey:key atNode:node.right];
            }else {
                [node setRight:[[TrinaryNode alloc] initWithKey:key]];
            }
            break;
            
        default:
            break;
    }
}

-(void)deleteNodeForKey:(NSNumber *)key {
    
    if (!self.rootNode) {
        @throw [NSException exceptionWithName:@"Empty Trinary Tree" reason:@"Cannot delete node from an empty tree" userInfo:@{@"key" : key}];
    }else {
        [self setRootNode:[self removeNodeForKey:key fromNode:self.rootNode]];
    }
}

// return YES if the the node was found

-(TrinaryNode*)removeNodeForKey:(NSNumber *)key fromNode:(TrinaryNode *)node {
    
    switch ([key compare:node.key]) {
            
        case NSOrderedSame:
            // if there is no middle child move the right subtree to the botton right of the left subtree and return the left node as root of the new tree
            if (!node.middle) {
                if (node.left) {
                    [[self findMostRightNodeIn:node.left] setRight:node.right];
                    return node.left;
                }else {
                    return node.right;
                }
            } else {
                [node setMiddle:[self removeNodeForKey:key fromNode:node.middle]];
            }
            break;
            
        case NSOrderedAscending:
            [node setLeft:[self removeNodeForKey:key fromNode:node.left]];
            break;
            
        case NSOrderedDescending:
            [node setRight:[self removeNodeForKey:key fromNode:node.right]];
            break;
            
        default:
            break;
    }
    return node;
}

-(TrinaryNode*) findMostLeftNodeIn:(TrinaryNode*)node {
    if (node.left) {
        return [self findMostLeftNodeIn:node.left];
    } else {
        return node;
    }
}

-(TrinaryNode*) findMostRightNodeIn:(TrinaryNode*)node {
    if (node.right) {
        return [self findMostRightNodeIn:node.left];
    } else {
        return node;
    }
}

-(void)printTreeByLevel{
    if (!self.rootNode) {
        NSLog(@"empty tree");
    }
    [self printNodesByLevel:[NSArray arrayWithObject:self.rootNode]];
}

-(void) printNodesByLevel:(NSArray*) buffer{
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:1];
    NSMutableString *line = [NSMutableString stringWithCapacity:1];
    for (TrinaryNode *node in buffer) {
        [line appendFormat:@"%@ ",[node key]];
        if (node.left) {
            [tmp addObject:node.left];
        }
        if (node.middle) {
            [tmp addObject:node.middle];
        }
        if (node.right) {
            [tmp addObject:node.right];
        }
    }
    NSLog(@"%@",line);
    if ([tmp count]>0) {
        [self printNodesByLevel:tmp];
    }
}

@end
