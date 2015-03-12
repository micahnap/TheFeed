//
//  Article.h
//  TheFeed
//
//  Created by Micah on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Article : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *articleDescription;
@property (nonatomic, strong) UIImage *imageArticle;

-(id)initWithTitle:(NSString *)title description:(NSString *)description andImageURL:(NSString *)imageURL;
@end
