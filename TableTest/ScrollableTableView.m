//
//  ScrollableTableView.m
//  TableTest
//
//  Created by Yan Liu on 12-12-7.
//  Copyright (c) 2012年 Yan Liu. All rights reserved.
//

#import "ScrollableTableView.h"

@interface ScrollableTableView ()

- (void)adjustWidth;

- (UITableViewCell *)tblView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSections;

@end

@implementation ScrollableTableView

@synthesize dataSource = _dataSource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.layer.borderColor = [[UIColor colorWithWhite:MM_BorderColorGray alpha:1.0f] CGColor];
        self.layer.cornerRadius = MM_CornerRadius;
        self.layer.borderWidth = MM_BorderWidth;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        self.contentMode = UIViewContentModeRedraw;
        
        _scrlView = [[ScrollableTableViewBGScrollView alloc] initWithFrame:self.bounds];
        _scrlView.parent = self;
        _scrlView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:_scrlView];
        
        _tblView = [[ScrollableTableViewContentBackgroundView alloc] initWithFrame:_scrlView.bounds];
        _tblView.dataSource = self;
        _tblView.delegate = self;
        _tblView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _tblView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tblView.backgroundColor = [UIColor clearColor];
        [_scrlView addSubview:_tblView];
        
        
    }
    
    return self;
}

- (void)dealloc {
    [_tblView release];
    [_scrlView release];
    
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - Properties

- (void)setDataSource:(id<ScrollableTableViewDataSource>)dataSource {
    if (_dataSource != dataSource) {
        _dataSource = dataSource;
        
        _respondsToNumberOfSections = [_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)];
        
        // set contentSize of the scrollView and the width of the tableView
        [self adjustWidth];
    }
}

#pragma mark - Publis methods

- (void)scrollToPosition:(CGPoint)pos animated:(BOOL)animated {
    [_scrlView setContentOffset:pos animated:animated];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numOfRows = 0;
    NSInteger numOfSections = [self numberOfSections];
    
    for (int i = 0; i < numOfSections; i++) {
        numOfRows += [_dataSource tableView:self numberOfRowsInSection:i];
    }
    
    return numOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tblView:_tblView cellForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)tblView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.text = @"WTF";
    return cell;
}



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UIScrollView *target;
    if (scrollView == _tblView) {
        target = _tblView;
    }
    else {
        target = _tblView;
    }
    
    target.contentOffset = scrollView.contentOffset;
}

#pragma mark - Internals

- (NSInteger)numberOfSections {
    if (_respondsToNumberOfSections) {
        return [_dataSource numberOfSectionsInTableView:self];
    }
    else {
        return 1;
    }
}

- (void)adjustWidth {
    CGFloat width = 500.0f;
    _scrlView.contentSize = CGSizeMake(width, 0.0f);
    
    CGRect f = _tblView.frame;
    f.size.width = MAX(self.frame.size.width, width);
    _tblView.frame = f;
}

@end
