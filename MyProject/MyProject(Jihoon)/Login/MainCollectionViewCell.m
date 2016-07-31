//
//  MainCollectionViewCell.m
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MainCollectionViewCell.h"

@interface MainCollectionViewCell()

@end

@implementation MainCollectionViewCell

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.myImages.image = image;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    self.myImages = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:self.myImages];
    
    self.myImages.image = self.image;
}

/*
- (void)setImageName:(NSString *)imageName {
    self.imageName = imageName;
    
    self.myImages.image = [UIImage imageNamed:imageName];
}
*/
@end
