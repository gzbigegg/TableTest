//
//  MyTableViewController.h
//  TableTest
//
//  Created by Yan Liu on 12-12-6.
//  Copyright (c) 2012年 Yan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollableTableView.h"

@interface MyTableViewController : UIViewController <ScrollableTableViewDataSource> {
    
    NSMutableArray *_data;
    
    ScrollableTableView *_tblView;
}

@end
