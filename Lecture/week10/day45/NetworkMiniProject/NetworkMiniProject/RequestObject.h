//
//  RequestObject.h
//  NetworkMiniProject
//
//  Created by Sejin Peo on 2016. 6. 24..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *imageListUpdateNotification = @"ImageListUpdated";
static NSString *ImageListUpdateFailNotification = @"ImageListUpdateFail";
static NSString *ImageUploadDidSuccessNotification = @"ImageUploadSuccess";
static NSString *ImageUploadDidFailNotification = @"ImageUploadFail";

static NSString *JSONKeyImageURL = @"image_url";
static NSString *JSONKeyThumnailURL = @"thumbnail_url";
static NSString *JSONKeyImageTitle = @"title";

@interface RequestObject : NSObject

@property (nonatomic, strong) NSArray *imageInfoJSONArray;
@property (nonatomic, strong) NSString *userID;
+ (instancetype)sharedInstance;

- (void)uploaadImage:(UIImage *)image title:(NSString *)title;
- (void)requestImageList;

@end
