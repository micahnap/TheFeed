//
//  ArticleHelpers.m
//  TheFeed
//
//  Created by Micah on 15/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "ImageCacher.h"
#import "Article.h"

@interface ImageCacher()


@end
@implementation ImageCacher

+(BOOL)hasImageAtIndexPath:(NSIndexPath *)indexPath inArray:(NSArray *)items {
    Article *article = items[indexPath.row];
    return ![article.imageURLArticle isEqualToString:@""];
}

+(ImageCacher *)sharedInstance;
{
    static ImageCacher *cacher = nil;
    
    @synchronized(self)
    {
        if(!cacher){
            cacher = [[ImageCacher alloc] init];
            cacher.cacheDictionary = [[[NSMutableDictionary alloc] init] autorelease];
        }
    }
    return cacher;
}

-(void)clearImagesFromCache{
    [self.cacheDictionary removeAllObjects];
}

-(BOOL)imageExistsForIdentifier:(NSString *)identifier{
    
    return self.cacheDictionary[identifier] != nil;
}

-(void)storeImage:(UIImage *)image forIdentifier:(NSString *)identifier{
    [self.cacheDictionary setObject:image forKey:identifier];
}

-(void)dealloc{
    self.cacheDictionary = nil;
    [super dealloc];
}
@end
