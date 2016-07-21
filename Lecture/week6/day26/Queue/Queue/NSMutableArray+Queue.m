//
//  NSMutableArray+Queue.m
//  Queue
//
//  Created by Sejin Peo on 2016. 5. 30..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)

-(void)push:(id)obj {
    [self addObject:obj];
}

-(id)pop {
    if ([self empty]) {
        return nil;
    }
    id head = self[0];
    [self removeObjectAtIndex:0];
    return head;
}

-(BOOL)empty {
    if ([self count] == 0) {
        return YES;
    } else {
        return NO;
    }
}

@end
