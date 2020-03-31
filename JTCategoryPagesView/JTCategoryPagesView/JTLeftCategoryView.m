//
//  JTLeftCategoryView.m
//  JTCategoryPagesView
//
//  Created by xujiangtao on 2020/3/31.
//  Copyright © 2020 functime. All rights reserved.
//

#import "JTLeftCategoryView.h"

@interface JTLeftCategoryView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<NSString *> *selectStatus;

@property (nonatomic, assign) NSInteger lastRow;

@end

@implementation JTLeftCategoryView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titles = [NSMutableArray array];
        self.selectStatus = [NSMutableArray array];
        _leftCellHeight = 60;
        [self createViews];
    }
    return self;
}

- (void)createViews {
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (void)setTitles:(NSMutableArray *)titles {
    _titles = titles;
    [self.selectStatus removeAllObjects];
    for (int i = 0; i < titles.count; i++) {
        if (i == 0) {
            [self.selectStatus addObject:@"1"];
        } else {
            [self.selectStatus addObject:@"0"];
        }
    }
    [self.tableView reloadData];
}

- (void)setLeftCellHeight:(CGFloat)leftCellHeight {
    _leftCellHeight = leftCellHeight;
    [self.tableView reloadData];
}

- (void)setCurrentRow:(NSInteger)currentRow {
    _currentRow = currentRow;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentRow inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];

    //replaceObjectAtIndex方法--->当数据多的时候消耗性能遍历
//    [self.selectStatus enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [self.selectStatus replaceObjectAtIndex:idx withObject:@"0"];
//    }];
//    [self.selectStatus replaceObjectAtIndex:currentRow withObject:@"1"];

    //exchangeObjectAtIndex方法--->在右边collectionView有动画的时候不完美--->所以取消了右边collectionView滑动的动画,还节约性能
    [self.selectStatus exchangeObjectAtIndex:self.lastRow withObjectAtIndex:currentRow];
    self.lastRow = currentRow;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.titles[indexPath.row];
    if ([self.selectStatus[indexPath.row] isEqualToString:@"1"]) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectStatus exchangeObjectAtIndex:self.lastRow withObjectAtIndex:indexPath.row];
    self.lastRow = indexPath.row;
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    [tableView reloadData];
    if (self.currentRowBlock) {
        self.currentRowBlock(indexPath.row);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.leftCellHeight;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}

@end
