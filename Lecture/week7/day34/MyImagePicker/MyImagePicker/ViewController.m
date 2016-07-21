//
//  ViewController.m
//  MyImagePicker
//
//  Created by Sejin Peo on 2016. 6. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (IBAction)touchImageView:(id)sender{
    NSLog(@"Image view touched");
    
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"라이브러리" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"libary Action");
        
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"사진앨범" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"album Action");
        // 카메라 앨범
        
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"cancel Action");
    }];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진소스선택" message:@"사진을 가져올 소스를 선택해 주세요" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:libraryAction];
    [alert addAction:albumAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
}



-(void) showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType{
    
    if([UIImagePickerController isSourceTypeAvailable:sourceType] == NO){
        // 파라미터로 전달받는 소스타입이 사용가능한 상태인지 확인해보는것.
        // 사용자에게 얼럿 보여주기
        // 얼럿 코드...
        
        // 우리는 로그를 보겠다..
        
        NSLog(@"이 소스는 못쓴단다");
        return;
    }else{
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.sourceType = sourceType;
    pickerController.delegate = self;
    
    pickerController.allowsEditing = YES;
    
    // Picker를 모델로 보여준다.
    [self presentViewController:pickerController animated:YES completion:nil];
    }
}

#pragma mark - UIImagePicker Controller Delegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    // Picker 모델을 내려준다.
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    // 이미지를 선택했을때
    UIImage *pickedOriginalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = pickedOriginalImage;
    
    //딕셔녀리 키 변경
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    self.imageView.image = editedImage;
    
    //contentModeScale
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSLog(@"didFinish");
    NSLog(@"123123 %@",pickedOriginalImage);
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

//-(void)getImagePikerFromAlbum:(UIImagePickerControllerSourceType *)source{
//    
//    UIImagePickerController *imagePiker = [[UIImagePickerController alloc] init];
//    imagePiker.delegate = self;
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    blackView.backgroundColor = [UIColor greenColor];
//    
//    
//    
//    [self.view addSubview:blackView];
    [self.view setBackgroundColor:[UIColor blackColor]];
}

- (void)UIViewCreate{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
