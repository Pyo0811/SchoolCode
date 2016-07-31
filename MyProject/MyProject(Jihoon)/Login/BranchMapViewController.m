//
//  BranchMapViewController.m
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 25..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "BranchMapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface BranchMapViewController ()
@property (nonatomic,weak) IBOutlet MKMapView *mapView;


@end

@implementation BranchMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Location";
    [self setCoordinateOnMap]; 
    NSLog(@"받아온 값 1 : %@",self.detailMode[0]);
    NSLog(@"받아온 값 2 : %@",self.detailMode[1]);
    
}


- (void)setCoordinateOnMap{
    
    NSNumber *latitude = self.detailMode[0];
    NSNumber *longtitude = self.detailMode[1];
    
    CGFloat lat = latitude.floatValue;
    CGFloat longT = longtitude.floatValue;
    
    //표시 좌표
    CLLocationCoordinate2D loc = CLLocationCoordinate2DMake(lat, longT);
    
    // 핀용 어노테이션을 생성
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = loc; // 핀의 좌표
    
    // 핀을 설정
    [self.mapView addAnnotation:pin];
    
    // 표시 위치와 크기를 설정
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    MKCoordinateRegion region = MKCoordinateRegionMake(loc, span);
    [self.mapView setRegion:region animated:YES];
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

@end
