//
//  SchoolTableViewController.m
//  Database
//
//  Created by Sejin Peo on 2016. 6. 22..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SchoolTableViewController.h"
#import "AppDelegate.h"
#import "School.h"

@interface SchoolTableViewController ()

@property (nonatomic,weak) AppDelegate *appDelegate;
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray<School *> *schools;

// AppDelegate 프로퍼티 생성

@end

@implementation SchoolTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    // app의 싱글턴객체를 호출함
    self.appDelegate = appDelegate;
    
    self.managedObjectContext = appDelegate.managedObjectContext;
    // 관리객체 컨텍스트
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"School"];
    // school 이라는 엔티티 요청
    
    NSError *fetchError = nil;
    
    NSArray<School *> *fetchResult = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    // 관리객체 컨텍스트가 스쿨이라는 클래스에 있는 자료들을 가져옴
    
    NSLog(@"School array %@, fetch error : %@",fetchResult,fetchError);
    
    if(fetchError != nil){
        NSLog(@"Error occured %@",fetchError);
    }else{
        NSLog(@"Fetch success");
        self.schools = [NSMutableArray arrayWithArray:fetchResult];
        
        
    }
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

    return self.schools.count;
}

- (IBAction)clickAddButton:(id)sender{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"School" message:@"추가할 School 이름 입력" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *field = alert.textFields.firstObject;
        NSString *inputText = field.text;
        
        if([inputText length] != 0){
            NSLog(@"%@",inputText);
            [self saveNewSchoolEntity:inputText];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:addAction];
    [alert addAction:cancelAction];
    
    
    
    // 얼럿에 사용자의 입력을 받기 위해 텍스트 필드를 추가해 줄 수 있다.
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField){
        // 블럭 내부에는 텍스트 필드의 폰트, 모양, 플레이스 홀더 등의 설정을 위한 코드를 넣어줄 수 있다.
        [textField setPlaceholder:@"School 이름"];
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)saveNewSchoolEntity:(NSString *)name{
    
    School *schoolToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"School" inManagedObjectContext:self.managedObjectContext];
    
    schoolToAdd.name = name;
    
    [self.appDelegate saveContext];
    
    [self.schools addObject:schoolToAdd];
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SchoolCell" forIndexPath:indexPath];
    
    // Configure the cell...
    School *schoolInfo = [self.schools objectAtIndex:indexPath.row];
    
    cell.textLabel.text = schoolInfo.name;
    
    
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
