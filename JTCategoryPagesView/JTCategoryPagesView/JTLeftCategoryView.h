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

- (void)reloadData;

@property (nonatomic, copy) void (^ currentRowBlock)(NSInteger row);

@end

NS_ASSUME_NONNULL_END
