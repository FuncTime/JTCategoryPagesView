//
//  JTRightPagesView.h
//  JTCategoryPagesView
//
//  Created by xujiangtao on 2020/3/31.
//  Copyright © 2020 functime. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JTRightPagesViewDelegate<NSObject>
@required
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface JTRightPagesView : UIView

@property (nonatomic, weak) id<JTRightPagesViewDelegate> delegate;

@property (nonatomic, copy) void (^ currentIndexPathBlock)(NSIndexPath *indexPath);

@property (nonatomic, assign) NSInteger currentPage;

- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
