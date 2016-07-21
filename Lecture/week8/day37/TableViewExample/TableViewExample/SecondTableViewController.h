//
//  SecondTableViewController.h
//  TableViewExample
//
//  Created by Sejin Peo on 2016. 6. 15..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DataType){
    
    DataTypeSchool = 0,
    DataTypeCamp,
    DataTypeKorea,
    DataTypeWorld
};

@interface SecondTableViewController : UITableViewController

@property (nonatomic) DataType dataType;

@end
