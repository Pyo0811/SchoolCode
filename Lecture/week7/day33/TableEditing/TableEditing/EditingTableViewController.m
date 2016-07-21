//
//  EditingTableViewController.m
//  TableEditing
//
//  Created by Sejin Peo on 2016. 6. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "EditingTableViewController.h"
#import "DataCentre.h"

@interface EditingTableViewController ()

@property (nonatomic, strong) DataCentre *dataCentre;

@end

@implementation EditingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataCentre = [DataCentre defaultData];
}
    
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self.dataCentre dataForSection:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    // Cell에 텍스트 레이블에 문자열 데이터를 설정
    NSMutableArray *data = [self.dataCentre dataForSection:indexPath.section];
    NSString *text = [data objectAtIndex:indexPath.row];
    
    cell.textLabel.text = text;
    
    //cell.textLabel.text = [self.dataCentre dataForSection:indexPath.section][indexPath.row];
    
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
//    if(indexPath.section == 0 && indexPath.row == 0){
//        return NO; //맨위에 쎌은 수정을 못하게함
//    }
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleInsert;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
   
        [self.dataCentre removeFirstSectionItemAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 100.0;
//}

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

- (IBAction)clickInsertNewItemButton:(id)sender{
    NSLog(@"CLICK!!");
    
    NSArray *secondData = [self.dataCentre dataForSection:1];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:secondData.count inSection:1];
    
    [self.dataCentre insertNewItemInSecondSection];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
