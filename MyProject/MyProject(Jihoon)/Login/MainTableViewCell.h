//
//  MainTableViewCell.h
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 15..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *infoDic;
@property (nonatomic,strong) IBOutlet UILabel *names;

@end
