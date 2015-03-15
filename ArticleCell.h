//
//  ArticleCell.h
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

/**
 This is the basic cell subclass. It has a bit of added funtionality that will configure it's subviews from the model when loaded.
 I was tempted to put this logic into a category extending this class, however the functionality is idiosyncratic to the
 **/

#import <UIKit/UIKit.h>
#import "Article.h"

@interface ArticleCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel;

-(void)configureForArticle:(Article *)article;
@end
