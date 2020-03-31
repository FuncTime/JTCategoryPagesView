//
//  ViewController.m
//  JTCategoryPagesView
//
//  Created by xujiangtao on 2020/3/31.
//  Copyright © 2020 functime. All rights reserved.
//

#import "ViewController.h"
#import "JTCategoryPagesView.h"
#import "PagesCollectionViewCell.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()<JTCategoryPagesViewDelegate>

@property (nonatomic, strong) NSMutableArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JTCategoryPagesView *cate = [[JTCategoryPagesView alloc] init];
    cate.delegate = self;
    [self.view addSubview:cate];
    [cate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
    }];

    self.titles = (NSMutableArray *)@[@"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha", @"haha"];
    cate.titles = self.titles;
    
    [cate registerNib:[UINib nibWithNibName:@"PagesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PagesCollectionViewCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.titles.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PagesCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = randomColor;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width - 80, 600);
}



@end
