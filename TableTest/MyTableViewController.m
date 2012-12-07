//
//  MyTableViewController.m
//  TableTest
//
//  Created by Yan Liu on 12-12-6.
//  Copyright (c) 2012年 Yan Liu. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // do setup here
    }
    return self;
}

- (void)dealloc {
    [_data release];
    [_tblView release];
    
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _data = [[NSMutableArray alloc] initWithCapacity:20];
    for (int i = 0; i < 20; i++) {
        [_data addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    _tblView = [[ScrollableTableView alloc] initWithFrame:self.view.bounds];
    _tblView.dataSource = self;
    _tblView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_tblView];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
