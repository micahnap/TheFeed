//
//  ArrayDataSource.h
//  MACFinder
//
//  Created by Micah Napier on 12/02/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

/**
 This is an abstract data source class that is designed for dual cell support for one model. You pass in an array of cell configuration blocks for custom cell setup,
 an arrat that represents a data model, and the cell identifiers for each cell. Index 0 is the basic cell configuration and Index 1 is the image cell.
 **/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id object);
@interface TableViewDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)items withCellIdentifiers: (NSArray *)cellIdentifiers andConfigurationBlocks:(NSArray *)cellConfigBlocks;

@end
