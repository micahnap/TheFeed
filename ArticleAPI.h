//
//  ArticleAPI.h
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

/*
 To take advantage of the facade design pattern, this class will provide a single interface for the requester.
 For this project it seems like overkill, but would be very useful in terms of scalability in the real world.
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ArticleAPI : NSObject

+(void)getArrayOfArticlesWithCallBack:(void(^)(NSError*,NSArray*))completionBlock;
+(void)getImageFromURL:(NSString *)url withCallback:(void(^)(NSError*,UIImage*))completionBlock;
@end
