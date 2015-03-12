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
    
    [super viewDidLoad];
    
    [ArticleAPI getArrayOfArticlesWithCallBack:^(NSError *error, NSArray *array){
        
        if (!array){
            NSLog(@"error: %@", error);
        }else{
            NSLog(@"array: %@", array);
            _articles = array;
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    
    [_articles release];
    [super dealloc];
}

-(void)loadTableView{
    
}

#pragma mark - TableView DataSource / Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_articles count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Article *article = _articles[indexPath.row];
    
    if (article.imageArticle) {
        cell.imageViewArticle.image = article.imageArticle;
    }else{
        
        __block UIImage *articleImage;
        
        [ArticleAPI getImageFromURL:article.imageURL withCallback:^(NSError *error, UIImage *image){
            articleImage = image;
        }];
        
        cell.imageViewArticle.image = articleImage;
        article.imageArticle = articleImage;
    }
    
    cell.titleLabel.text = article.title;
    cell.descriptionLable.text = article.articleDescription;
    return cell;
}

@end
