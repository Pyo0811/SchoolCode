//
//  WeatherTableViewController.h
//  CustomTable
//
//  Created by Sejin Peo on 2016. 6. 8..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WeatherType){
    WeatherTypeKorea = 0,
    WeatherTypeWorld
};

@interface WeatherTableViewController : UITableViewController

@property (nonatomic) WeatherType weatherType;

@end
