//
//  TrinaryNode.h
//  TrinaryTree
//
//  Created by wanny on 10/13/12.
//  Copyright (c) 2012 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrinaryNode : NSObject

@property (nonatomic, strong) NSNumber *key;

@property (nonatomic, strong) TrinaryNode *left;
@property (nonatomic, strong) TrinaryNode *middle;
@property (nonatomic, strong) TrinaryNode *right;

/*
 * init a TrinaryNode with the given key
 */
-(id)initWithKey:(NSNumber*) key;

@end
