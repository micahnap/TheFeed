//
//  Article.m
//  TheFeed
//
//  Created by Micah on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "Article.h"

@implementation Article

-(id)initWithTitle:(NSString *)titleArticle subtitle:(NSString *)descriptionArticle andImageURL:(NSString *)url{
    self = [super init];
    if (self) {
        self.titleArticle = [titleArticle isEqual:[NSNull null]] ? @"[No Title]" : titleArticle;
        self.subtitleArticle = [descriptionArticle isEqual:[NSNull null]] ? @"[No Description]" : descriptionArticle;
        self.imageURLArticle = [url isEqual:[NSNull null]] ? @"" : url;
    }
    return self;
}

-(void)dealloc{
    self.titleArticle = nil;
    self.subtitleArticle = nil;
    self.imageURLArticle = nil;
    [super dealloc];
}

@end
