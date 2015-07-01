//
//  TracktWS.m
//  RecrutamentoMovile
//
//  Created by Alessandro dos santos pinto on 6/30/15.
//  Copyright (c) 2015 Alessandro dos Santos Pinto. All rights reserved.
//

#import "TracktWS.h"
#import "RecrutamentoMovile-Swift.h"

@implementation TracktWS

- (void) getMostPopularShows {
    
    __block id weakDelegate = _delegate;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"trakt-api-version"];
    [manager.requestSerializer setValue:kClientID forHTTPHeaderField:@"trakt-api-key"];
    [manager GET:@"https://api-v2launch.trakt.tv/shows/popular?extended=images" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *shows = [[NSMutableArray alloc] init];
        
        for (NSDictionary *response in responseObject) {
            
            TVShowVO *vo = [[TVShowVO alloc] init];
            vo.name = [response objectForKey:@"title"];
            vo.pictureStringURL = [[[response objectForKey:@"images"] objectForKey:@"poster"] objectForKey:@"thumb"];
            [shows addObject:vo];
        }
        
        [weakDelegate loadScreenWithTVShows:shows];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.description);
        
    }];
    
}

@end
