//
//  ArrayDataSource.m
//  MACFinder
//
//  Created by Micah Napier on 12/02/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "TableViewDataSource.h"
#import "ImageCacher.h"

@interface TableViewDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSArray *cellIdentifiers;
@property (nonatomic, copy) NSArray *cellConfigBlocks;
@end

@implementation TableViewDataSource

- (id)initWithItems:(NSArray *)items withCellIdentifiers: (NSArray *)cellIdentifiers andConfigurationBlocks:(NSArray *)cellConfigBlocks{
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifiers = cellIdentifiers;
        self.cellConfigBlocks = cellConfigBlocks;
    }
    return self;
}

-(void)dealloc{
    self.items = nil;
    self.cellIdentifiers = nil;
    self.cellConfigBlocks = nil;
    [super dealloc];
}
#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    TableViewCellConfigureBlock cellBlock;
    id item = self.items[indexPath.row];
    if ([ImageCacher hasImageAtIndexPath:indexPath inArray:self.items]){
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifiers[1] forIndexPath:indexPath];
        cellBlock = self.cellConfigBlocks[1];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifiers[0] forIndexPath:indexPath];
        cellBlock = self.cellConfigBlocks[0];
    }
    
    cellBlock(cell, item);
    return cell;
}

@end