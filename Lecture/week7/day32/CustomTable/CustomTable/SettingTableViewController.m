//
//  SettingTableViewController.m
//  CustomTable
//
//  Created by Sejin Peo on 2016. 6. 8..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "DataCentre.h"

NS_ENUM(NSInteger){
    SettingTableSectionCount = 2
    
};

@interface SettingTableViewController () <UITableViewDelegate,UITableViewDelegate,SettingTableViewCellDelegate>

@property(nonatomic, strong) DataCentre *dataCentre;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataCentre = [DataCentre defaultData];
    
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

    return [self.dataCentre numberOfSectionForSettingTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataCentre numberOfRowsForSectionInSettingTable:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSArray *dataArray = [self.dataCentre settingTableDataForSection:indexPath.section];
    NSString *text = [dataArray objectAtIndex:indexPath.row];
     
    if(indexPath.section == 0){
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        
        if(cell == nil){
            cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingCell"];
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell.textLabel setText:text];
        
        BOOL isFunctionOn = [self.dataCentre isOnForSetting:indexPath.row];
        [cell.settingSwitch setOn:isFunctionOn];
        
        return cell;
        
    } else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubtitleCell" forIndexPath:indexPath];
        
        [cell.textLabel setText:text];
        // Configure the cell...
        
        return cell;
    }
   
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.dataCentre settingTableHeaderTitleForSection:section];
}

#pragma mark - Setting Table View Cell delegate

- (void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn {
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    
    [self.dataCentre setSetting:cellIndex.row isOn:isOn];
    
    NSLog(@"Cell Index : %ld -%ld, isOn: %d",cellIndex.section,cellIndex.row, isOn);
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Row Selected : %ld - %ld",indexPath.section, indexPath.row);
    
    if (indexPath.section == 0){
        return;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *sender = [tableView cellForRowAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:@"ShowDetailWeather" sender:sender];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UITableViewCell *senderCell = (UITableViewCell *)sender;
    
    NSLog(@"segue will action : %@",senderCell.textLabel.text);
    
    WeatherTableViewController *tableViewController = segue.destinationViewController;
    
    if([senderCell.textLabel.text isEqualToString:@"한국날씨"]){
        tableViewController.weatherType = WeatherTypeKorea;
    }else{
        tableViewController.weatherType = WeatherTypeWorld;
    }
}

@end
