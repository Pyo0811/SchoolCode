//
//  DataCentre.m
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "DataCentre.h"

@interface DataCentre()

@property(nonatomic,strong) NSMutableArray *arrayOfImages;


@end

@implementation DataCentre

+ (instancetype)defaultData{
    
    static DataCentre *dataCentre = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        dataCentre = [[DataCentre alloc] init];
        
        //NSArray *imageNames = @[@"이상해씨.jpg",@"파이리.png",@"꼬부기.jpg",@"버터플.jpg",@"독침붕.png",@"피죤투.png",@"꼬렛.png",@"아보.jpg",@"피카츄.png",@"라이츄.jpg",@"모래두지.png",@"니드퀸.jpg",@"니드킹.png",@"삐삐.png",@"내루미.png",@"푸린.jpg",@"라플레시아.png",@"디그다.jpg",@"닥트리오.jpg",@"윤겔라.jpg",@"고우스트.jpg",@"갸라도스.jpg",@"프테라.png",@"잠만보.png",@"망나뇽.jpg",@"썬더.png",@"파이어.png",@"프리져.jpg",@"뮤.png",@"뮤츠.jpg"];
        NSArray *imageNames = nil;
        
        NSMutableArray *images = [[NSMutableArray alloc] init];
        
        for (NSString *name in imageNames) {
            [images addObject:[UIImage imageNamed:name]];
        }
        
        dataCentre.arrayOfImages = images;
        
        //NSArray *titleNames = [NSMutableArray arrayWithObjects:@"이상해씨",@"파이리",@"꼬부기",@"버터플",@"독침붕",@"피죤투",@"꼬렛",@"아보",@"피카츄",@"라이츄",@"모래두지",@"니드퀸",@"니드킹",@"삐삐",@"내루미",@"푸린",@"라플레시아",@"디그다",@"닥트리오",@"윤겔라",@"고우스트",@"갸라도스",@"프테라",@"잠만보",@"망나뇽",@"썬더",@"파이어.png",@"프리져",@"뮤",@"뮤츠", nil];
        
        NSArray *titleNames = nil;
        
        NSMutableArray *titles = [[NSMutableArray alloc] init];
        
        for (NSString *name in titleNames){
            [titles addObject:name];
        }
        
        dataCentre.arrayOfTitles = titles;
        
        
        NSArray *aLatitude = nil;
        NSArray *aLongtitude = nil;
        
        NSMutableArray *latitude = [[NSMutableArray alloc] init];
        NSMutableArray *longtitude = [[NSMutableArray alloc] init];
        
        for (NSNumber *number in aLatitude){
            [latitude addObject:number];
        }
        for (NSNumber *number in aLongtitude){
            [longtitude addObject:number];
        }
        
        
        dataCentre.latitude = latitude;
        dataCentre.longtitude = longtitude;
    });
    
    return dataCentre;
}

- (NSInteger)numberOfImages{
    
    return self.arrayOfImages.count;
}

- (NSMutableArray *)imageNameForCells{
    
    return self.arrayOfImages;
}

- (void)addImageName:(NSString *)name
{
    [self.arrayOfImages addObject:name];
}

- (NSMutableArray<UIImage *> *)images {
    return _arrayOfImages;
}

- (void)addTitleName:(NSString *)titles{
    
    [self.arrayOfTitles addObject:titles];
}

- (NSMutableArray<NSString *> *)titles{
    return _arrayOfTitles;
}

/*
- (NSMutableArray *)getArrayOfNames{
    
    return self.arrayOfNames;
    
}
*/

@end
