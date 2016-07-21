//
//  MyTableViewController.m
//  TableViewExample2
//
//  Created by Sejin Peo on 2016. 6. 16..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"
#import "MyDetailViewController.h"

@interface MyTableViewController ()

@property (nonatomic,strong) NSArray *myImageView;
@property (nonatomic,strong) NSArray *upLabel;
@property (nonatomic,strong) NSArray *downLabel;

@end

@implementation MyTableViewController


- (void)viewWillAppear:(BOOL)animated
{
 [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController setNavigationBarHidden:YES];
    self.upLabel = @[@"하연수1",
                     @"하연수2",
                     @"하연수3",
                     @"하연수4",
                     @"하연수5",
                     @"하연수6",
                     @"하연수7",
                     @"하연수8"];
    
    self.downLabel = @[@".jpg",
                       @".jpg",
                       @".png",
                       @".jpg",
                       @".jpg",
                       @".gif",
                       @".jpg",
                       @".jpg"];
    
    self.myImageView = @[@"하연수1.jpg",
                         @"하연수2.jpg",
                         @"하연수3.png",
                         @"하연수4.jpg",
                         @"하연수5.jpg",
                         @"하연수6.gif",
                         @"하연수7.jpg",
                         @"하연수8.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.myImageView.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myTableCell" forIndexPath:indexPath];
    
    cell.upLabel.text = self.upLabel[indexPath.row];
    cell.downLabel.text = self.downLabel[indexPath.row];
    cell.myImageView.image = [UIImage imageNamed:self.myImageView[indexPath.row]];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"ShowMyDetails"]){
        MyDetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        NSInteger row = [myIndexPath row];
        detailViewController.myDetailMode = @[self.upLabel[row],self.downLabel[row],self.myImageView[row]];
        
        NSLog(@"self.firstLabel[0] : %@",self.upLabel[row]);
        NSLog(@"self.secondLabel[1] : %@",self.downLabel[row]);
        NSLog(@"self.myImageView[2] : %@",self.myImageView[row]);
        
    }
}


@end
