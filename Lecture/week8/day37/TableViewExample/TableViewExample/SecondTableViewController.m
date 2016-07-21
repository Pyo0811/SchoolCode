//
//  SecondTableViewController.m
//  TableViewExample
//
//  Created by Sejin Peo on 2016. 6. 15..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SecondTableViewController.h"
#import "DataCentre.h"

@interface SecondTableViewController ()

@property (nonatomic,strong) DataCentre *dataCentre;

@end

@implementation SecondTableViewController

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

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
//    if(section == 0){
//       return [[[DataCentre defaultData] dataForFastCampus:self.fastCampusType] count];
//    }else{
//        return [[[DataCentre defaultData] dataForWeather:self.weatherType] count];
//    }
   
    
    return [[self.dataCentre dataForSecondTableView:self.dataType] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
    
//    if(indexPath.section== 0){
//        
//        cell.textLabel.text = [[[DataCentre defaultData] dataForFastCampus:self.fastCampusType] objectAtIndex:indexPath.row];
//    }else if(indexPath.section == 1){
//        cell.textLabel.text = [[[DataCentre defaultData] dataForWeather:self.weatherType] objectAtIndex:indexPath.row];
//    }
        cell.textLabel.text = [[self.dataCentre dataForSecondTableView:self.dataType] objectAtIndex:indexPath.row];

    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
