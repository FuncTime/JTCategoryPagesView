//
//  JTCategoryPagesView.h
//  JTCategoryPagesView
//
//  Created by xujiangtao on 2020/3/31.
//  Copyright © 2020 functime. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JTCategoryPagesViewDelegate<NSObject>
@required
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
//按Section判断到第几页
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface JTCategoryPagesView : UIView

@property (nonatomic, assign) CGFloat leftViewWidth;

@property (nonatomic, weak) id<JTCategoryPagesViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray<NSString *> *titles;

@property (nonatomic, strong) UIColor *leftCategorySelectedColor;

@property (nonatomic, strong) UIColor *leftCategoryNormalColor;

- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
