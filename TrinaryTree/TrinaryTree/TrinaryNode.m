//
//  TrinaryNode.m
//  TrinaryTree
//
//  Created by wanny on 10/13/12.
//  Copyright (c) 2012  All rights reserved.
//

#import "TrinaryNode.h"
#import "TrinaryTree.h"

@implementation TrinaryNode

-(id)initWithKey:(NSNumber*) key{
    self = [super init];
    if (self) {
        [self setKey:key];
    }
    return self;
}

@end
