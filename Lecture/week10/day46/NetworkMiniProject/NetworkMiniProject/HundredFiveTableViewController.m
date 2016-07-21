//
//  HundredFiveTableViewController.m
//  NetworkMiniProject
//
//  Created by Sejin Peo on 2016. 6. 22..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "HundredFiveTableViewController.h"
#import "HundredFiveTableViewCell.h"
#import "ImageDetailViewController.h"
#import "RequestObject.h"

@interface HundredFiveTableViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) NSArray *imageInfos;
@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic,strong) NSMutableArray *imageNames;
@property (nonatomic,strong) NSMutableArray *imageURLString;
//@property (nonatomic,strong) RequestObject *request;
//@property (nonatomic,strong) HundredFiveTableViewCell *cell;

@end

@implementation HundredFiveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.request = [RequestObject sharedInstance]
//    self.cell = [[HundredFiveTableViewCell alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self alertInputID];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTable) name:imageListUpdateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestImageList) name:ImageUploadDidSuccessNotification object:nil];
    
    self.images = [[NSMutableArray alloc] init];
    self.imageNames = [[NSMutableArray alloc] init];
}


- (void)alertInputID{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"유저 ID 입력" message:@"유저 ID를 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *field = alert.textFields.firstObject;
        NSString *inputText = field.text;
        
        if([inputText length] != 0){
            NSLog(@"%@",inputText);
            [[RequestObject sharedInstance] setUserID:inputText];
            [self requestImageList];
        }
    }];
    
    [alert addAction:okAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField){
        [textField setPlaceholder:@"100 ~ 150자 사이의 숫자"];
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)imageUpload:(id)sender{
    
    [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType{
    
    if([UIImagePickerController isSourceTypeAvailable:sourceType] == NO){
        
        NSLog(@"이 소스는 못쓴단다.");
        
        return;
    }else{
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        
        pickerController.sourceType = sourceType;
        pickerController.delegate = self;
        pickerController.allowsEditing = YES;
        
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    
    UIImage *pickedOriginalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSLog(@"pickedOriginalImage : %@",pickedOriginalImage);
    
    [self.images addObject:pickedOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    //[self setImageTitle];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진 제목" message:@"사진 제목을 입력하세요" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        UITextField *field = alert.textFields.firstObject;
        NSString *inputText = field.text;
        
        if([inputText length] != 0 ){
            
            [self.imageNames addObject:inputText];
            [self refreshTable];
            
            [[RequestObject sharedInstance] uploaadImage:pickedOriginalImage title:inputText];
        }
    }];
    
    [alert addAction:okAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField){
        textField.placeholder = @"사진제목";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    //[self requestImageList];
}

- (void)setImageTitle{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진 제목" message:@"사진 제목을 입력하세요" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
       
        UITextField *field = alert.textFields.firstObject;
        NSString *inputText = field.text;
        
        if([inputText length] != 0 ){
            
            [self.imageNames addObject:inputText];
            [self refreshTable];
        }
    }];
    
    [alert addAction:okAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField){
       textField.placeholder = @"사진제목";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)refreshTable {
    
    self.imageInfos = [[RequestObject sharedInstance] imageInfoJSONArray];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self.tableView reloadData];
    });
}

- (void)requestImageList{
    [[RequestObject sharedInstance] requestImageList];
}

- (void)requestUploadImage:(UIImage *)image title:(NSString *)title{
    [[RequestObject sharedInstance] uploaadImage:image title:title];
}

- (IBAction)refresh:(id)sender{
    [self requestImageList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.imageInfos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HundredFiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    
    
    NSDictionary *imageInfo = self.imageInfos[indexPath.row];
    
    NSString *imageTitle = imageInfo[JSONKeyImageTitle];
    cell.textLabel.text = imageTitle;
    
    NSString *thumnailURLString = imageInfo[JSONKeyThumnailURL];
    NSURL *thumnailURL = [NSURL URLWithString:thumnailURLString];
    
    cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    //cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:thumnailURL]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // Configure the cell...
    
//    cell.imageView.image = self.images[indexPath.row];
//    cell.textLabel.text = self.imageNames[indexPath.row];
//
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:thumnailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data){
            UIImage *image = [UIImage imageWithData:data];
            if(image){
            dispatch_async(dispatch_get_main_queue(), ^{
                UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
                cellForUpdate.imageView.image = image;;
                });
            }
        }
    }];
    
    
    [task resume];
    
    
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
    
    if([[segue identifier] isEqualToString:@"ImageDetail"]){
        ImageDetailViewController *imageDetail = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        NSInteger row = [myIndexPath row];
        imageDetail.imageURLString = [self.imageInfos[row] objectForKey:JSONKeyImageURL];
        NSLog(@"imageURLString    imageURLString imageURLString :%@",imageDetail.imageURLString);
    }
}


@end
