//
//  JTLeftCategoryView.h
//  JTCategoryPagesView
//
//  Created by xujiangtao on 2020/3/31.
//  Copyright © 2020 functime. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JTLeftCategoryView : UIView

@property (nonatomic, strong) NSMutableArray<NSString *> *titles;

@property (nonatomic, assign) CGFloat leftCellHeight;

@property (nonatomic, assign) NSInteger currentRow;

@property (nonatomic, copy) void (^ currentRowBlock)(NSInteger row);

@property (nonatomic, strong) UIColor *leftCategorySelectedColor;

@property (nonatomic, strong) UIColor *leftCategoryNormalColor;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
