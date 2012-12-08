//
//  MyTableViewController.m
//  TableTest
//
//  Created by Yan Liu on 12-12-6.
//  Copyright (c) 2012年 Yan Liu. All rights reserved.
//

#import "MyTableViewController.h"
#import "NSObject+DelayedBlock.h"

#define kNumberOfSections 20
#define kNumberOfRowsInSection 1

@interface MyTableViewController ()

- (CGFloat)initialLeftMargin;

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
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int j = 0; j < 15; j++) {
            [str appendString:[NSString stringWithFormat:@"%d", i]];
        }
        [_data addObject:[NSString stringWithString:str]];
        [str release];
    }
    
    _tblView = [[ScrollableTableView alloc] initWithFrame:self.view.bounds];
    _tblView.dataSource = self;
    _tblView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_tblView];
    
    [_tblView scrollToPosition:CGPointMake([self initialLeftMargin], 0) animated:YES];

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

#pragma mark - ScrollableTableViewDataSource

- (NSInteger)tableView:(ScrollableTableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(ScrollableTableView *)tableView {
    return [_data count];
}

- (UIView *)tableView:(ScrollableTableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath {
    UILabel *l = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, [self tableCellWidth], 44)] autorelease];
    l.text = [_data objectAtIndex:indexPath.row];
    return l;
}

- (CGFloat)tableCellWidth {
    return 420.f;
}

#pragma mark - Internal methods

- (CGFloat)initialLeftMargin {
    return 100.f;
}

@end
