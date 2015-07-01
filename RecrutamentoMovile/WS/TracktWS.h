//
//  TracktWS.h
//  RecrutamentoMovile
//
//  Created by Alessandro dos santos pinto on 6/30/15.
//  Copyright (c) 2015 Alessandro dos Santos Pinto. All rights reserved.
//

#define kClientID @"80be3073873cf9f89dbe07a70fe61dd21ec4b93a929f061eb96a129af00d6e8b"
#define kClientSecret @"dec1c025492158485577602903ed77497e6e99050c2687b0f0bf152988a3e56b"

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@protocol TrackWSDelegate <NSObject>

- (void) loadScreenWithTVShows:(NSArray *) shows;

@end

@interface TracktWS : NSObject

- (void) getMostPopularShows;

@property (weak, nonatomic) id<TrackWSDelegate> delegate;

@end
