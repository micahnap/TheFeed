//
//  ArticleAPI.h
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

/*
 To take advantage of the facade design pattern, this class will provide a single interface for the requester.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ArticleAPI : NSObject

///fetches JSON data from URL, parses and puts into dictionary
+(void)fetchJSONDataAndNotifyWhenDone;

///fetches an image from the respective article image URL from a background thread. A block is attached that is called on the main queue when execution is finished.
+(void)getImageFromURL:(NSString *)url withCallback:(void(^)(UIImage*))completionBlock;

///clear our image cacher if stored objects
+(void)clearImageCache;
@end