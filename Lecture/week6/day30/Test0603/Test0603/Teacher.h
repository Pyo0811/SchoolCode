//
//  Teacher.h
//  Test0603
//
//  Created by Sejin Peo on 2016. 6. 3..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Teacher <NSObject>
//정의만 해둠
- (void)teach;

@optional
- (void)giveHomework;

@end
