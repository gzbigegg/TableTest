//
//  ScrollableTableView.h
//  TableTest
//
//  Created by Yan Liu on 12-12-7.
//  Copyright (c) 2012年 Yan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollableTableViewDataSource;

@interface ScrollableTableView : UIView {
    
}

@property (nonatomic, assign) id<ScrollableTableViewDataSource> dataSource;

@end

@protocol ScrollableTableViewDataSource <NSObject>



@end
