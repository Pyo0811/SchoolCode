//
//  WCustomButton.h
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WCustomButtonDelegate;
@interface WCustomButton : UIView

@property(nonatomic, weak, nullable) id <WCustomButtonDelegate> delegate;

-(void)setTitle:(nullable NSString *)title;
-(void)setImageWithName:(nullable NSString *)imageName;
-(void)updateLayout;

@end


@protocol WCustomButtonDelegate <NSObject>

-(void)didSelectWCustomButton:(nullable WCustomButton *)customBtn;

@end