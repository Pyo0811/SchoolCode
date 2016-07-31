//
//  MainCollectionViewController.m
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 12..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "MainTableViewController.h"
#import "MainCollectionViewCell.h"
#import "LoginPageViewController.h"
#import "DataCentre.h"
#import <Photos/Photos.h>

@interface MainCollectionViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic,weak) IBOutlet UISegmentedControl *segmentedControl;
@property(nonatomic,strong) DataCentre *dataCentre;
@property(nonatomic,strong) MainCollectionViewCell *collectionViewCell;
//@property (strong) PHCachingImageManager *imageManager;
//@property(nonatomic,strong) NSArray *arrayOfImages;

@end

@implementation MainCollectionViewController

static NSString * const reuseIdentifier = @"MainCollectionCell";

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.selected = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataCentre = [DataCentre defaultData];
    self.collectionViewCell = [[MainCollectionViewCell alloc] init];
    
    //self.arrayOfImages = @[@"하연수1.jpg",@"하연수2.jpg",@"하연수3.png",@"하연수4.jpg",@"하연수5.jpg",@"하연수6.gif",@"하연수7.jpg",@"하연수8.jpg",@"하연수9.jpg",@"하연수10.jpg",@"하연수11.jpg",@"하연수12.jpg",@"하연수13.jpg",@"하연수14.png",@"하연수15.jpg",@"하연수16.jpg",@"하연수17.jpg",@"하연수18.jpg",@"하연수19.jpg",@"하연수20.jpg",@"하연수21.jpg",@"하연수22.jpg",@"하연수23.jpg",@"하연수24.jpg",@"하연수19.jpg",@"하연수20.jpg",@"하연수21.jpg",@"하연수22.jpg",@"하연수23.jpg",@"하연수24.jpg"];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0);
    
    //CGSize itemSize = CGSizeZero;
    //itemSize.width = self.view.bounds.size.width / 3.0 - 30;
    //itemSize.height = itemSize.width;
    
    CGRect screenSize = [UIScreen mainScreen].bounds;
    CGFloat screenWidth = screenSize.size.width;
    //CGFloat screenHeight = screenSize.size.height;
    
    flowLayout.itemSize = CGSizeMake((screenWidth-2)/3, screenWidth/3);
    flowLayout.minimumLineSpacing = 0.5;
    flowLayout.minimumInteritemSpacing = 0.5;
    
    self.collectionView.collectionViewLayout = flowLayout;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    //NSLog(@"number of Images : %ld",[self.dataCentre numberOfImages]);
    return [self.dataCentre numberOfImages];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    NSMutableArray *arrayOfImages = [self.dataCentre images];
    
    cell.image = arrayOfImages[indexPath.item];
    
    
    return cell;
}

# pragma Action Button on the navigation bar

- (IBAction)indexChanged:(UISegmentedControl *)sender{
    
    
    switch(self.segmentedControl.selectedSegmentIndex){
            
        case 1:
            NSLog(@"Second Segue");
            UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            MainTableViewController *secondSegue = [main instantiateViewControllerWithIdentifier:@"SecondSegue"];
            [self.navigationController pushViewController:secondSegue animated:NO];
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

- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType{
    
    if([UIImagePickerController isSourceTypeAvailable:sourceType] == NO){
        
        NSLog(@"You can't use this source");
        return;
    }else{
        
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.sourceType = sourceType;
        pickerController.delegate = self;
        pickerController.allowsEditing = YES;
        
        //[self presentViewController:pickerController animated:YES completion:nil];
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}

- (IBAction)actionLogOut:(id)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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
    [self.collectionView reloadData];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self addTitleActionAlert];
    
}

- (void)addTitleActionAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진 제목" message:@"사진 제목을 입력하세요" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *field = alert.textFields.firstObject;
        NSString *inputText = field.text;
        
        if([inputText length] != 0 ){
            [self.dataCentre.titles addObject:inputText];
            [self.collectionView reloadData];
        }
    }];
    
    [alert addAction:okAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진제목";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/



@end
