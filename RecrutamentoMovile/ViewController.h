//
//  ViewController.h
//  RecrutamentoMovile
//
//  Created by Alessandro dos santos pinto on 6/30/15.
//  Copyright (c) 2015 Alessandro dos Santos Pinto. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TracktWS.h"
#import "BaseViewController.h"

@interface ViewController : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegate, TrackWSDelegate>


@end

