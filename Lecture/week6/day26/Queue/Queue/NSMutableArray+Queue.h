//
//  NSMutableArray+Queue.h
//  Queue
//
//  Created by Sejin Peo on 2016. 5. 30..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)

-(void)push:(id)obj;
-(id)pop;
-(BOOL)empty;

@end