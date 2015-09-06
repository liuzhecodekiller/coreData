//
//  Student.h
//  coreData
//
//  Created by shenZhenNewWorld on 15-8-8.
//  Copyright (c) 2015年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * age;

@end
