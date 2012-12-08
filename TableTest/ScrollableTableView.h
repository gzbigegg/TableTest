//
//  ScrollableTableView.h
//  TableTest
//
//  Created by Yan Liu on 12-12-7.
//  Copyright (c) 2012年 Yan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "ScrollableTableViewBGScrollView.h"
#import "ScrollableTableViewContentBackgroundView.h"

@protocol ScrollableTableViewDataSource;

@interface ScrollableTableView : UIView <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate> {
    BOOL _respondsToNumberOfSections;
    
    ScrollableTableViewBGScrollView *_scrlView;
    ScrollableTableViewContentBackgroundView *_tblView;
}

@property (nonatomic, assign) id<ScrollableTableViewDataSource> dataSource;

- (void)scrollToPosition:(CGPoint)pos animated:(BOOL)animated;

@end

@protocol ScrollableTableViewDataSource <NSObject>
@required

- (UIView *)tableView:(ScrollableTableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(ScrollableTableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (CGFloat)tableCellWidth;

@optional

- (NSInteger)numberOfSectionsInTableView:(ScrollableTableView *)tableView;

@end
