//
//  UIImageView+AsyncImageDownload.m
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "UIImageView+AsyncImageDownload.h"
#import "HTTPClient.h"

@implementation UIImageView (AsyncImageDownload)


- (void)downloadImageWithURL:(NSURL *)url completionBlock:(ImageCompletionBlock)completionBlock{
    
    [HTTPClient fetchJsonDataFromURL:url withCompletion:^(BOOL succeeded, NSData *data){
        if (succeeded){
            UIImage *image = [[[UIImage alloc] initWithData:data] autorelease];
            completionBlock(YES,image);
        }else{
            completionBlock(NO,nil);
        }
    }];
}

@end
