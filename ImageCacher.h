//
//  ArticleHelpers.h
//  TheFeed
//
//  Created by Micah on 15/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.

/**
 This class provides extra convenience to the data source, allowing it to initialize the proper cell class
 It also provides (feeble) image caching. In a real world situation, I would use a more robust (ARC) solution such as
 the imageview category of AFNetworking. However to conserve time, storing images in a local dictionary would scale just fine.
 **/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageCacher : NSObject

//publicly accessible, but only speaks with the API
@property(nonatomic, strong) NSMutableDictionary* cacheDictionary;

///method that checks if object in cell contains an image
+(BOOL)hasImageAtIndexPath:(NSIndexPath *)indexPath inArray:(NSArray *)items;

///returns a singleton to manage the image caching
+(ImageCacher *)sharedInstance;

///store image in shared dictionary
-(void)storeImage:(UIImage *)image forIdentifier:(NSString *)identifier;

///check for existence of image with the specified identifier
-(BOOL)imageExistsForIdentifier:(NSString *)identifier;

///clears Image cache
-(void)clearImagesFromCache;
@end
