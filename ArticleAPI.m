//
//  ArticleAPI.m
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "ArticleAPI.h"
#import "JSONParser.h"
#import "Article.h"
#import "ImageCacher.h"

#define FeedURL @"http://dl.dropboxusercontent.com/u/746330/facts.json"

@implementation ArticleAPI

+(void)fetchJSONDataAndNotifyWhenDone{
    //make call to get data
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSError *error = nil;
        NSString *jsonString = [[[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:FeedURL] encoding:NSASCIIStringEncoding error:&error] autorelease];
        
        if (jsonString){
            //parse data and store in separate json dictionary
            
            NSDictionary *parentJSONDictionary = [JSONParser jsonDictionaryFromString:jsonString];
            NSArray *jsonArticles = parentJSONDictionary[@"rows"];
            NSMutableArray *objectArticles = [[[NSMutableArray alloc] init] autorelease];
            
            [jsonArticles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
                
                NSDictionary *jsonDict = (NSDictionary *)obj;
                //objectify data to reflect data model
                Article *article = [[[Article alloc] initWithTitle:jsonDict[@"title"] subtitle:jsonDict[@"description"] andImageURL:jsonDict[@"imageHref"]] autorelease];
                
                [objectArticles addObject:article];
            }];
            
            NSString *headingTitle = parentJSONDictionary[@"title"];
            NSArray *copiedArray = [[objectArticles copy] autorelease];
            NSDictionary *dictForVC = [[[NSDictionary alloc] initWithObjectsAndKeys:headingTitle,@"headingTitle",copiedArray,@"articles", nil] autorelease];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:dictForVC];
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:nil];
            });
        }
    });
}

+(void)getImageFromURL:(NSString *)url withCallback:(void(^)(UIImage*))completionBlock{
    
    //check for cached image first
    ImageCacher *imageCacher = [ImageCacher sharedInstance];
    
    if ([imageCacher imageExistsForIdentifier:url]) {
        UIImage *image = imageCacher.cacheDictionary[url];
        completionBlock(image);
    }else{
        //download if it doesn't exist
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0];
            NSURLResponse *response = nil;
            NSError *error = nil;
            NSData *imageData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            UIImage *image;
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            
            if (error || [httpResponse statusCode] != 200) {
                image = [UIImage imageNamed:@"no-image.jpg"];
            }else{
                image = imageData ? [UIImage imageWithData:imageData] : [UIImage imageNamed:@"no-image.jpg"];
            }
            [imageCacher storeImage:image forIdentifier:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(image);
            });
        });
    }
}

+(void)clearImageCache{
    ImageCacher *imageCacher = [ImageCacher sharedInstance];
    [imageCacher clearImagesFromCache];
}
@end
