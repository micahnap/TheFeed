//
//  ArticleImageCell.h
//  TheFeed
//
//  Created by Micah on 13/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.

/**
 This class subclasses Article cell and adds in the image view logic for the cell. It calls out to the API for an image and to the super class for the label details. The activity indicator initializes animating and stops once an image has loaded.
 **/
#import "ArticleCell.h"

@interface ArticleImageCell : ArticleCell

@property (nonatomic, retain) IBOutlet UIImageView *imageViewArticle;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
