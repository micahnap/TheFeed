//
//  ArticleTableViewController.m
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "ArticleTableViewController.h"
#import "ArticleAPI.h"
#import "ArticleCell.h"
#import "Article.h"
static NSString * const cellIdentifier = @"ArticleCell";

@interface ArticleTableViewController ()
@property (nonatomic, strong) NSArray *articles;
@end

@implementation ArticleTableViewController

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView:) name:@"reloadTableView" object:nil];
    [super viewDidLoad];

    [ArticleAPI getArrayOfArticles];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    
    [_articles release];
    [super dealloc];
}

-(void)reloadTableView:(id)notification{
    _articles = [notification object];
    [self.tableView reloadData];
}

#pragma mark - TableView DataSource / Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_articles count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self basicCellAtIndexPath:indexPath];
}

- (ArticleCell *)basicCellAtIndexPath:(NSIndexPath *)indexPath {
    ArticleCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [self configureBasicCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureBasicCell:(ArticleCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Article *article = _articles[indexPath.row];
    
    [self setTitleForCell:cell item:article];
    [self setSubtitleForCell:cell item:article];
}

- (void)setTitleForCell:(ArticleCell *)cell item:(Article *)article {
    NSString *title = article.titleArticle;
    [cell.titleLabel setText:title];
}

- (void)setSubtitleForCell:(ArticleCell *)cell item:(Article *)article {
    NSString *subtitle = article.descriptionArticle;
    
    [cell.descriptionLable setText:subtitle];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForBasicCellAtIndexPath:indexPath];
}

- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath {
    __block ArticleCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    });
    
    [self configureBasicCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}

@end
