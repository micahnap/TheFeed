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
    //NSLog(@"article: %@", _articles);
//    for (int i =0; i < [_articles count]; i++) {
//        Article *article = _articles[i];
//        NSLog(@"article: %@", article.titleArticle);
//    }
    [self.tableView reloadData];
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
    Article *article = _articles [indexPath.row];
    //NSLog(@"article: %@", article.titleArticle);
//    if (article.imageArticle) {
//        cell.imageViewArticle.image = article.imageArticle;
//    }else{
//        
//        __block UIImage *articleImage;
//        
//        [ArticleAPI getImageFromURL:article.imageURL withCallback:^(NSError *error, UIImage *image){
//            articleImage = image;
//        }];
//        
//        cell.imageViewArticle.image = articleImage;
//        article.imageArticle = articleImage;
//    }
    
    cell.titleLabel.text = article.titleArticle;
    cell.descriptionLable.text = @"lol";
    return cell;
}

@end
