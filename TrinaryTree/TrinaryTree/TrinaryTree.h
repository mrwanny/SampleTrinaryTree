//
//  TrinaryTree.h
//  TrinaryTree
//
//  Created by wanny on 10/13/12.
//  Copyright (c) 2012 All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrinaryNode.h"

@interface TrinaryTree : NSObject

@property (nonatomic, retain) TrinaryNode *rootNode;

/*
 * insert a new TrinaryNode with key in the tree
 */
- (void)insertNodeForKey:(NSNumber *)key;

/*
 * delete a TrinaryNode with key in the tree
 * if a root node need to be removed, the right subtree will be moved to the left subtree and the left node become the new root.
 */
- (void)deleteNodeForKey:(NSNumber *)key;

-(void) printTreeByLevel;
@end
