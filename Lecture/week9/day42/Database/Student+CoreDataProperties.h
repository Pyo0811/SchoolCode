//
//  Student+CoreDataProperties.h
//  Database
//
//  Created by Sejin Peo on 2016. 6. 22..
//  Copyright © 2016년 Ubinet. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nonnull, nonatomic, retain) School *school;

@end

NS_ASSUME_NONNULL_END
