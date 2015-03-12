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
#import "HTTPClient.h"

#define FeedURL @"http://dl.dropboxusercontent.com/u/746330/facts.json"

@implementation ArticleAPI


+(void)getArrayOfArticlesWithCallBack:(void(^)(NSError*,NSArray*))completionBlock{
    
    //make call to get data
    [HTTPClient fetchDataFromURL:FeedURL withCompletion:^(NSError *error, NSData *data){
        
        if (data){
            //parse data and store in json dictionary
            NSDictionary *parentJSONDictionary = [JSONParser jsonDictionaryFromData:data];
            NSArray *jsonArticles = parentJSONDictionary[@"rows"];
            NSMutableArray *objectArticles = [[[NSMutableArray alloc] init] autorelease];
            
            [jsonArticles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
                NSDictionary *jsonDict = (NSDictionary *)obj;
                //objectify data to reflect data model
                Article *article = [[[Article alloc] initWithTitle:jsonDict[@"title"] description:jsonDict[@"description"] andImageURL:jsonDict[@"imageHref"]] autorelease];
                [objectArticles addObject:article];
            }];
            
            jsonArticles = [objectArticles copy];
            
            completionBlock(nil,jsonArticles);
        }else{
            completionBlock(error,nil);
        }
    }];
}


+(void)getImageFromURL:(NSString *)url withCallback:(void(^)(NSError*,UIImage*))completionBlock{
    
    [HTTPClient fetchDataFromURL:url withCompletion:^(NSError *error, NSData *data){
        
        if (data){
            UIImage *image = [[UIImage alloc] initWithData:data];
            completionBlock(nil,image);
        }else{
            completionBlock(error,nil);
        }
    }];
}
@end
