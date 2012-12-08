//
//  NSObject+DelayedBlock.h
//  TableTest
//
//  Created by Yan Liu on 12/8/12.
//  Copyright (c) 2012 Yan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DelayedBlock)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
