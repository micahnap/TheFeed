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
#import "NSString+NoNil.h"

#define FeedURL @"http://dl.dropboxusercontent.com/u/746330/facts.json"

@implementation ArticleAPI


+(void)getArrayOfArticles{
    
    //make call to get data
    [HTTPClient fetchJSONDataFromURL:FeedURL withCompletion:^(NSError *error, NSString *jsonString){
        
        if (jsonString){
            //parse data and store in json dictionary
            NSDictionary *parentJSONDictionary = [JSONParser jsonDictionaryFromString:jsonString];
            NSArray *jsonArticles = parentJSONDictionary[@"rows"];
            NSMutableArray *objectArticles = [[[NSMutableArray alloc] init] autorelease];

            [jsonArticles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
                
                NSDictionary *jsonDict = (NSDictionary *)obj;
                NSString* title = [NSString noNilStringFromString:jsonDict[@"title"]];
                NSString* description = [NSString noNilStringFromString:jsonDict[@"description"]];
                NSString* imageHref = [NSString noNilStringFromString:jsonDict[@"imageHref"]];
                NSLog(@"title: %@", jsonDict[@"title"]);
                //objectify data to reflect data model
                Article *article = [[[Article alloc] init]autorelease];
                article.titleArticle = title;
                article.descriptionArticle = description;
                article.imageURL = imageHref;
                [objectArticles addObject:article];
            }];
            
            jsonArticles = [objectArticles copy];
            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableView" object:jsonArticles];
//            });

        }else{
            
        }
    }];
}

+(void)getImageFromURL:(NSString *)url withCallback:(void(^)(NSError*,UIImage*))completionBlock{
    
    [HTTPClient fetchDataFromURL:url withCompletion:^(NSError *error, NSData *data){
        
        if (data){
            UIImage *image = [[[UIImage alloc] initWithData:data] autorelease];
            completionBlock(nil,image);
        }else{
            completionBlock(error,nil);
        }
    }];
}
@end
