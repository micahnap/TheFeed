//
//  ArticleCell.h
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *descriptionLable;
@property (nonatomic, retain) IBOutlet UIImageView *imageViewArticle;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
