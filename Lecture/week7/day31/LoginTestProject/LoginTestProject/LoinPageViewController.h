//
//  ViewController.h
//  LoginTestProject
//
//  Created by youngmin joo on 2016. 5. 16..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 태그의 기본값이 0이기 때문에... 음... 되도록이면 0이 아니라
 100, 101 이렇게 하는게 어떨까 합니다
 그리고 외부에서 사용할 필요가 없다면 굳이 헤더에 넣은 필요가 있을까요~
 */

/*
 텍스트 필드 암호 필드는 secure text input으로 해주면 어떨까요?
 */

typedef NS_ENUM(NSInteger, LOGIN_TEXTFIELD_TYPE)
{
    LOGIN_TEXTFIELD_TYPE_ID = 0,
    LOGIN_TEXTFIELD_TYPE_PW = 1,
};

@interface LoinPageViewController : UIViewController


@end

