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
#import "ArticleImageCell.h"
#import "Article.h"
#import "TableViewDataSource.h"


NSString * const kArticleCellIdentifier = @"ArticleCell";
NSString * const kArticleImageCellIdentifier = @"ArticleImageCell";
NSString * const kLoadingString = @"Loading...";

@interface ArticleTableViewController ()
@property (nonatomic, strong) NSArray *articles;
@property (nonatomic, retain) TableViewDataSource *tvDataSource;
@end

@implementation ArticleTableViewController
bool isRefreshing;

- (void)viewDidLoad {
    
    //observer for ArticleAPI
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView:) name:@"reloadTableView" object:nil];
    
    UIRefreshControl *refreshControl = [[[UIRefreshControl alloc] init] autorelease];
    refreshControl.attributedTitle = [[[NSAttributedString alloc] initWithString:kLoadingString] autorelease];
    [refreshControl addTarget:self action:@selector(pullToRefresh) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    [ArticleAPI fetchJSONDataAndNotifyWhenDone];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    self.articles = nil;
    self.tvDataSource = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

-(void)pullToRefresh{
    isRefreshing = true;
    self.title = kLoadingString;
    self.articles = nil;
    self.tvDataSource = nil;
    [ArticleAPI clearImageCache];
    [ArticleAPI fetchJSONDataAndNotifyWhenDone];
}

-(void)reloadTableView:(id)notification{

    if (isRefreshing) {
        [self.refreshControl endRefreshing];
        isRefreshing = false;
    }
    
    if (notification){
        NSDictionary *detailDictionary = [notification object];
        self.articles = detailDictionary[@"articles"];
        self.title = detailDictionary[@"headingTitle"];
        
        //pass cell setup block to data source for designing table view
        void(^configureBasicCellBlock)(ArticleCell*, Article*) = ^void(ArticleCell *cell, Article *article){
            [cell configureForArticle:article];
        };
        
        void(^configureImageCellBlock)(ArticleImageCell*, Article*) = ^void(ArticleImageCell *cell, Article *article){
            [cell configureForArticle:article];
        };
        
        NSArray *cellConfigBlocks = [NSArray arrayWithObjects:configureBasicCellBlock,configureImageCellBlock ,nil];
        NSArray *cellIdentifiers = [NSArray arrayWithObjects:kArticleCellIdentifier,kArticleImageCellIdentifier ,nil];
        self.tvDataSource = [[[TableViewDataSource alloc] initWithItems:self.articles withCellIdentifiers:cellIdentifiers andConfigurationBlocks:cellConfigBlocks] autorelease];
        self.tableView.dataSource = self.tvDataSource;
        [self.tableView reloadData];
    }else{
        self.title = @"Error";
    }
    
}

@end
