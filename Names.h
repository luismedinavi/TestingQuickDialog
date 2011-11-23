//
//  Names.h
//  TestQD2_value
//
//  Created by Luis Medina on 11/22/11.
//  Copyright (c) 2011 LMV Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Names : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * webPage;

@end
