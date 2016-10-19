//
//  ViewController.h
//  cViewTest1
//
//  Created by amir sankar on 10/18/16.
//  Copyright © 2016 amir sankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCell.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *urlArray;
@property (strong, nonatomic) NSArray *pictureArray;
@property (strong, nonatomic) IBOutlet UICollectionView *theCollectionView;


@end

