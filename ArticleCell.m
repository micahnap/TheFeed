//
//  ArticleCell.m
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "ArticleCell.h"

@implementation ArticleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)dealloc {
    self.titleLabel = nil;
    self.descriptionLabel = nil;
    [super dealloc];
}

-(void)configureForArticle:(Article *)article{
    self.titleLabel.text = article.titleArticle;
    self.descriptionLabel.text = article.subtitleArticle;
}
@end
