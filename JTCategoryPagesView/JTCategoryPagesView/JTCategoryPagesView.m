//
//  JTCategoryPagesView.m
//  JTCategoryPagesView
//
//  Created by xujiangtao on 2020/3/31.
//  Copyright © 2020 functime. All rights reserved.
//

#import "JTCategoryPagesView.h"
#import "JTLeftCategoryView.h"
#import "JTRightPagesView.h"

@interface JTCategoryPagesView ()<JTRightPagesViewDelegate>

@property (nonatomic, strong) JTLeftCategoryView *leftCategoryView;

@property (nonatomic, strong) JTRightPagesView *rightPagesView;

@end

@implementation JTCategoryPagesView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _leftViewWidth = 80;
        [self createViews];
    }
    return self;
}

- (void)createViews {
    self.leftCategoryView = [[JTLeftCategoryView alloc] init];
    [self addSubview:self.leftCategoryView];
    [self.leftCategoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.mas_equalTo(self.leftViewWidth);
    }];

    self.rightPagesView = [[JTRightPagesView alloc] init];
    self.rightPagesView.delegate = self;
    [self addSubview:self.rightPagesView];
    [self.rightPagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.offset(0);
        make.left.equalTo(self.leftCategoryView.mas_right);
    }];

    __weak typeof(self.leftCategoryView) weakLeftCategoryView = self.leftCategoryView;
    self.rightPagesView.currentIndexPathBlock = ^(NSIndexPath *_Nonnull indexPath) {
        weakLeftCategoryView.currentRow = indexPath.section;
    };

    __weak typeof(self.rightPagesView) weakRightPagesView = self.rightPagesView;
    self.leftCategoryView.currentRowBlock = ^(NSInteger row) {
        weakRightPagesView.currentPage = row;
    };
}

- (void)reloadData {
    [self.leftCategoryView reloadData];
    [self.rightPagesView reloadData];
}

- (void)setTitles:(NSMutableArray<NSString *> *)titles {
    _titles = titles;
    self.leftCategoryView.titles = titles;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.delegate collectionView:collectionView numberOfItemsInSection:section];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.delegate numberOfSectionsInCollectionView:collectionView];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.delegate collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.delegate collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
}

- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier {
    [self.rightPagesView registerNib:nib forCellWithReuseIdentifier:identifier];
}

@end
