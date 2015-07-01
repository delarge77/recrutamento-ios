//
//  ViewController.m
//  RecrutamentoMovile
//
//  Created by Alessandro dos santos pinto on 6/30/15.
//  Copyright (c) 2015 Alessandro dos Santos Pinto. All rights reserved.
//

#import "ViewController.h"
#import "RecrutamentoMovile-Swift.h"
#import "TVShowCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()

@property (retain, nonatomic) NSArray *showsData;
@property (weak, nonatomic) IBOutlet UICollectionView *collection;

@end

@implementation ViewController

#pragma mark - Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        if (!status == AFNetworkReachabilityStatusNotReachable) {
            TracktWS *ws = [[TracktWS alloc] init];
            [ws setDelegate:self];
            [ws getMostPopularShows];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sem Conexão" message:@"Por favor verifique sua conexão e tente novamente" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TrackWSDelegate Methods

- (void)loadScreenWithTVShows:(NSArray *)shows {
    self.showsData = [NSArray arrayWithArray:shows];
    [self.collection reloadData];
}

#pragma mark - UICollectionView DataSource Methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    TVShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    TVShowVO *show = [self.showsData objectAtIndex:indexPath.row];
    
    [cell.showImageView sd_setImageWithURL:[NSURL URLWithString:show.pictureStringURL] placeholderImage:[UIImage imageNamed:@"movile"]];
    
    cell.showNameLabel.text = show.name;
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.showsData count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0,0,0,-10);
}


@end
