//
//  MyTableViewCell.h
//  TableViewExample2
//
//  Created by Sejin Peo on 2016. 6. 16..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UIImageView *myImageView;
@property (nonatomic,weak) IBOutlet UILabel *upLabel;
@property (nonatomic,weak) IBOutlet UILabel *downLabel;

@end
