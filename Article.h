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

@property (nonatomic, strong) NSString *titleArticle;
@property (nonatomic, strong) NSString *imageURLArticle;
@property (nonatomic, strong) NSString *subtitleArticle;
@property (nonatomic, strong) UIImage *imageArticle;

-(id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle andImageURL:(NSString *)url;
@end
