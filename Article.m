//
//  Article.m
//  TheFeed
//
//  Created by Micah on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "Article.h"

@implementation Article


-(id)initWithTitle:(NSString *)title description:(NSString *)description andImageURL:(NSString *)imageURL{
    
    self = [super init];
    
    if (self){
        _title = title;
        _articleDescription = description;
        _imageURL = imageURL;
    }
    
    return self;
}

@end
