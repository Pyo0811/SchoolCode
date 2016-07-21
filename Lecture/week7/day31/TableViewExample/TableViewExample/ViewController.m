//
//  ViewController.m
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

// 화면에 테이블뷰를 얹음
@property (nonatomic) UITableView *tableView;
@property (nonatomic) DataCenter *dataCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
    // delegate,datasource 를 통해 테이블뷰의 역활을 정의해야됨
    self.tableView.delegate = self;
    // numberOfRowsInsection(Section에대한 rows수), cellForRowAtIndexPath(row에대한 cell)
    self.tableView.dataSource = self;
    
    self.dataCenter = [DataCenter defaultData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *titleNames = self.dataCenter.sectionTitles;
    NSString *title = [titleNames objectAtIndex:section];
    
    return [self.dataCenter numberOfRowsForKey:title];
    //BCDEFGH
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Section의 개수를 알려주는 메소드
    return self.dataCenter.sectionCount;
    
    // Section이 100개 Row 1000 1000*100 = 10만개
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableViewCellID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID];
    // Cell이라는 identify으로 셀이 재사용성 큐로 들어감 미리만들어놓은 셀이없으면 nil 리턴
    
    NSLog(@"Index : section - %ld, row - %ld : %d", indexPath.section, indexPath.row, cell != nil);
    
    if(cell == nil){
        // cell 객체를 생성함
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellID];
        NSLog(@"Make cell for index : %ld - %ld", indexPath.section, indexPath.row);
    }
    NSArray *keys = self.dataCenter.sectionTitles;
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *values = [self.dataCenter valueForKey:key];
    NSString *value = [values objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:value];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *keys = self.dataCenter.sectionTitles;
    NSString *key = [keys objectAtIndex:section];
    return key;
}

#pragma mark - UITableViewDelegate



@end
