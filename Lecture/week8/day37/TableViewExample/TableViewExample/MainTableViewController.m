//
//  MainTableViewController.m
//  TableViewExample
//
//  Created by Sejin Peo on 2016. 6. 15..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MainTableViewController.h"
#import "DataCentre.h"
#import "SecondTableViewController.h"

@interface MainTableViewController ()

@property (nonatomic,strong) DataCentre *dataCentre;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataCentre = [DataCentre defaultData];
    self.title = @"Table view practice";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.dataCentre numberOfSectionsForSettingTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataCentre numberOfRowsForSectionInSettingTable:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *dataArray = [self.dataCentre settingTableDataForSection:indexPath.section];
    NSString *text = [dataArray objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            cell.backgroundColor = [UIColor colorWithRed:153.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
            break;
            
        case 1:
            cell.backgroundColor = [UIColor lightGrayColor];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        case 2:
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            break;
    }
    
    cell.textLabel.text = text;
    
    
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [self.dataCentre settingTableHeaderTitleForSection:section];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2){
        return;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *sender = [tableView cellForRowAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:@"SecondTableView" sender:sender];

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1){
        return 100.0;
    }else{
        return 44.0;
    }
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UITableViewCell *senderCell = (UITableViewCell *)sender;
    
    NSLog(@"segue will action : %@",senderCell.textLabel.text);
    
    SecondTableViewController *tableViewController = segue.destinationViewController;
    
    if([senderCell.textLabel.text isEqualToString:@"Korea weather"]){
        tableViewController.dataType = DataTypeKorea;
    }else if([senderCell.textLabel.text isEqualToString:@"World weather"]){
        tableViewController.dataType = DataTypeWorld;
    }else if([senderCell.textLabel.text isEqualToString:@"School"]){
        tableViewController.dataType = DataTypeSchool;
    }else if([senderCell.textLabel.text isEqualToString:@"Camp"]){
        tableViewController.dataType = DataTypeCamp;
    }
}

@end
