//
//  UIImageView+AsyncImageDownload.h
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Typedefs.h"


@interface UIImageView (AsyncImageDownload)

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(ImageCompletionBlock)completionBlock;

@end
