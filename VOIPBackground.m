//
//  VOIPBackground.m
//  VOIP
//
//  Created by tage on 14-4-22.
//  Copyright (c) 2014年 XT. All rights reserved.
//

#import "VOIPBackground.h"

#import <UIKit/UIKit.h>

@interface VOIPBackground ()

@property (nonatomic) UIBackgroundTaskIdentifier bgTask;

@end

@implementation VOIPBackground

static int bgCount = 0;

- (void)backgroundBeginWithAppdelegate:(id)appDelegate exitTime:(NSInteger)time
{
    if ([self isMultitaskingSupported])
    {
        [appDelegate performSelectorOnMainThread:@selector(keepAlive:) withObject:[NSNumber numberWithInt:500] waitUntilDone:YES];
        
        [[UIApplication sharedApplication] setKeepAliveTimeout:time handler:^{
            
            if (_bgTask == UIBackgroundTaskInvalid && bgCount) {
                
                [appDelegate performSelectorOnMainThread:@selector(keepAlive:) withObject:[NSNumber numberWithInt:50] waitUntilDone:YES];
                
                bgCount = 0;
                
            }
        }];
    }
}

- (BOOL) isMultitaskingSupported
{
    BOOL result = NO;
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)])
    {
        result = [[UIDevice currentDevice] isMultitaskingSupported];
    }
    return result;
}

- (void)keepAlive:(NSNumber *)Num {
    
    _bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        [[UIApplication sharedApplication] endBackgroundTask:_bgTask];
        
        _bgTask = UIBackgroundTaskInvalid;
        
        bgCount += 1;
        
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        while (1) {
            
            if (_bgTask == UIBackgroundTaskInvalid) {
                
                break;
                
            }
            
            NSTimeInterval remainingTime = [UIApplication sharedApplication].backgroundTimeRemaining;
            
            if (remainingTime < 10) {
                
                break;
            }
            
            sleep(240);
            
        }
        
        [[UIApplication sharedApplication] endBackgroundTask:_bgTask];
        
        _bgTask = UIBackgroundTaskInvalid;
        
        bgCount += 1;
    });
}


@end
