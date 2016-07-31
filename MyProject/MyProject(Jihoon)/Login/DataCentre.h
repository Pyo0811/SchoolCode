//
//  DataCentre.h
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCentre : NSObject

@property(nonatomic,strong) NSMutableArray *arrayOfTitles;
@property(nonatomic,strong) NSMutableArray *latitude;
@property(nonatomic,strong) NSMutableArray *longtitude;

+ (instancetype)defaultData;
- (NSInteger)numberOfImages;
- (NSMutableArray<UIImage *> *)images;
- (void)addImageName:(NSString *)name;
- (NSMutableArray<NSString *> *)titles;
- (void)addTitleName:(NSString *)titles;
//- (NSMutableArray *)getArrayOfNames;

@end
