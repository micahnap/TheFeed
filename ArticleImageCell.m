//
//  ArticleImageCell.m
//  TheFeed
//
//  Created by Micah on 13/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "ArticleImageCell.h"
#import "ArticleAPI.h"

@implementation ArticleImageCell

-(void)configureForArticle:(Article *)article{
    [super configureForArticle:article];
    
    //download and cache image if not already loaded
    [ArticleAPI getImageFromURL:article.imageURLArticle withCallback:^(UIImage *image){
        //article.imageArticle = image;
        self.imageViewArticle.image = image;
        [self.activityIndicator stopAnimating];
    }];
}

-(void)dealloc{
    self.imageViewArticle = nil;
    self.activityIndicator = nil;
    [super dealloc];
}
@end
