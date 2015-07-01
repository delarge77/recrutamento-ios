//
//  BaseViewController.m
//  RecrutamentoMovile
//
//  Created by Alessandro dos santos pinto on 6/30/15.
//  Copyright (c) 2015 Alessandro dos Santos Pinto. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

#pragma mark - AFNetworkReachabilityManager

- (BOOL)connected {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

@end
