//
//  MainTableViewController.m
//  Login
//
//  Created by Sejin Peo on 2016. 7. 11..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainCollectionViewController.h"
#import "MainTableViewCell.h"
#import "LoginPageViewController.h"
#import "DataCentre.h"
#import <Photos/Photos.h>
#import "BranchMapViewController.h"
#import "PreventIndex0ErrorViewController.h"

@interface MainTableViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong) IBOutlet UISegmentedControl *segmentedControl;
@property(nonatomic,strong) DataCentre *dataCentre;

@end

@implementation MainTableViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
    self.segmentedControl.selectedSegmentIndex = 1;
    self.segmentedControl.selected = YES;
}

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

    return [self.dataCentre numberOfImages];
}

# pragma Action Button on the navigation bar


- (IBAction)indexChanged:(UISegmentedControl *)sender{
    
    switch(self.segmentedControl.selectedSegmentIndex){
        
        case 0:
            
            /*
            NSLog(@"First Segue");
            UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            MainCollectionViewController *firstSegue = [main instantiateViewControllerWithIdentifier:@"FirstSegue"];
            [self.navigationController pushViewController:firstSegue animated:NO];
             */
            NSLog(@"First Segue");
            [self.navigationController popViewControllerAnimated:NO];
            break;
    }
}

- (IBAction)addPhotos:(id)sender{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진추가" message:@"사진을 추가해주세요" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }];
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cameraAction];
    [alert addAction:libraryAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)actionLogOut:(id)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}


- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType{
    
    if([UIImagePickerController isSourceTypeAvailable:sourceType] == NO){
        
        NSLog(@"You can't use this source");
        return;
    }else{
        
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.sourceType = sourceType;
        pickerController.delegate = self;
        pickerController.allowsEditing = YES;
        
        
        [self presentViewController:pickerController animated:YES completion:nil];
        
    }
}

#pragma UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *image = nil;
    
    if (info[UIImagePickerControllerEditedImage]) {
        image = info[UIImagePickerControllerEditedImage];
        NSLog(@"image : %@",image);
    } else {
        image = info[UIImagePickerControllerOriginalImage];
        NSLog(@"image : %@",image);
    }
    
    
    NSURL *url = [info objectForKey:UIImagePickerControllerReferenceURL];
    
    PHFetchResult *result = [PHAsset fetchAssetsWithALAssetURLs:@[url] options:nil];
    
    PHAsset *asset = [result firstObject];
    
    NSLog(@"%lf", asset.location.coordinate.latitude);
    NSLog(@"%lf", asset.location.coordinate.longitude);
    
    NSNumber *latitude = [NSNumber numberWithFloat:asset.location.coordinate.latitude];
    NSNumber *longtitude = [NSNumber numberWithFloat:asset.location.coordinate.longitude];
    
    [self.dataCentre.latitude addObject:latitude];
    [self.dataCentre.longtitude addObject:longtitude];
    
    /*
     UIImage *pickedOriginalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
     NSLog(@"pickerOriginalImage : %@",pickedOriginalImage);
     */
    
    //이미지를 저장하고 이미지 이름 가져오기
    //[self.dataCentre addImageName:<#(NSString *)#>];
    
    //    self.collectionViewCell.myImages.image = image;
    [self.dataCentre.images addObject:image];
    [self.tableView reloadData];
    [self addTitleActionAlert];
    [picker dismissViewControllerAnimated:YES completion:nil];
    //PreventIndex0ErrorViewController *preventIndex0ErrorViewController = [[PreventIndex0ErrorViewController alloc] init];
    //[picker presentViewController:preventIndex0ErrorViewController animated:YES completion:nil];

}

- (void)addTitleActionAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진 제목" message:@"사진 제목을 입력하세요" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *field = alert.textFields.firstObject;
        NSString *inputText = field.text;
        
        if([inputText length] != 0 ){
            [self.dataCentre.titles addObject:inputText];
            [self.tableView reloadData];
        }
    }];
    
    [alert addAction:okAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진제목";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}


# pragma tableView cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableCell" forIndexPath:indexPath];
    NSMutableArray *images = [self.dataCentre images];
    //NSString *text = [self.dataCentre.arrayOfTitles objectAtIndex:indexPath.row];
    
    NSDictionary *dic = @{ @"image" : images[indexPath.row] };
    cell.infoDic = dic;
    //cell.names.text = text;
    
//    CGRect screenSize = [UIScreen mainScreen].bounds;
//    CGFloat screenWidth = screenSize.size.width;
//    CGFloat screenHeight = screenSize.size.height;
    
    
    /*
    cell.imageView.autoresizingMask = ( UIViewAutoresizingNone );
    cell.imageView.autoresizesSubviews = NO;
    cell.imageView.contentMode = UIViewContentModeCenter;
    //cell.imageView.bounds = CGRectMake(0, 0, 50, 50);
     */
    
//    cell.imageView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
//    cell.yImageView.image = [UIImage imageNamed:imageName[indexPath.row]];
    
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
    if([[segue identifier] isEqualToString:@"TableViewToMap"]){
        
        BranchMapViewController *mapView = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger row = [indexPath row];
        mapView.detailMode = @[self.dataCentre.latitude[row],self.dataCentre.longtitude[row]];
        
    }
}


@end
