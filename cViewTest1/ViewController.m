//
//  ViewController.m
//  cViewTest1
//
//  Created by amir sankar on 10/18/16.
//  Copyright © 2016 amir sankar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.urlArray = [[NSArray alloc]initWithObjects:@"https://upload.wikimedia.org/wikipedia/commons/7/73/Amblyraja_hyperborea1.jpg",@"https://images.fast-growing-trees.com/images/T/Harvester-Peach-Tree-350w.jpg",@"https://upload.wikimedia.org/wikipedia/commons/0/05/20100726_Kalamitsi_Beach_Ionian_Sea_Lefkada_island_Greece.jpg", @"https://static.pexels.com/photos/6675/flight-mountains-sky-flying.jpeg", nil];
    
    [self.theCollectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.urlArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    NSURL *url = [NSURL URLWithString: self.urlArray[indexPath.row]];
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];

        [cell.theImage performSelectorOnMainThread:@selector(setImage:) withObject:downloadedImage waitUntilDone:YES];
        
    }];
    [downloadPhotoTask resume];
    
    return cell;
}

@end
