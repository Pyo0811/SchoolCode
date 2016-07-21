//
//  DataCenter.m
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property (nonatomic,strong) NSDictionary *animals;
@property (nonatomic,strong) NSArray *animalSectionTitles;
@property (nonatomic,strong) NSArray *animalIndexTitles;

@end

@implementation DataCenter

+ (instancetype)defaultData
{
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        
    });
    
    return dataCenter;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setAnimalData];
    }
    return self;
}

- (void)setAnimalData
{
    self.animals = @{@"B" : @[@"Bear", @"Black Swan", @"Buffalo"],
                @"C" : @[@"Camel", @"Cockatoo"],
                @"D" : @[@"Dog", @"Donkey"],
                @"E" : @[@"Emu"],
                @"G" : @[@"Giraffe", @"Greater Rhea"],
                @"H" : @[@"Hippopotamus", @"Horse"],
                @"K" : @[@"Koala"],
                @"L" : @[@"Lion", @"Llama"],
                @"M" : @[@"Manatus", @"Meerkat"],
                @"P" : @[@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear"],
                @"R" : @[@"Rhinoceros"],
                @"S" : @[@"Seagull"],
                @"T" : @[@"Tasmania Devil"],
                @"W" : @[@"Whale", @"Whale Shark", @"Wombat"]};
}

- (NSDictionary *)allAnimals
{
    return self.animals;
}

- (NSArray *)sectionTitles
{
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [self.animals.allKeys sortedArrayUsingDescriptors:@[sorter]];
}

- (NSInteger)sectionCount
{
    return self.animals.count;
}

- (NSInteger)numberOfRowsForKey:(NSString *)key{
    return [[self valueForKey:key] count];
    // 키에 해당되는 배열의 요소의 개수
}

- (NSArray *)valueForKey:(NSString *)key{
    return self.animals[key];
}

- (NSString *)imageNameWithAnimal:(NSString *)animal
{
    NSString *imageFilename = [[animal lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    imageFilename = [imageFilename stringByAppendingString:@".jpg"];
    
    return imageFilename;
}

@end
