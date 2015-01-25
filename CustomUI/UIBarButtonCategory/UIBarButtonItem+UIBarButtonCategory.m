//
//  UIBarButtonItem+UIBarButtonCategory.m
//  CustomUI
//
//  Created by Adit Hasan on 1/24/15.
//  Copyright (c) 2015 Adit Hasan. All rights reserved.
//

#import "UIBarButtonItem+UIBarButtonCategory.h"
#import "UIControl+SKTargetEventBlock.h"


@implementation UIBarButtonItem (UIBarButtonCategory)

-(UIBarButtonItem *)addSKBarButton:(NSString *)buttonTitle actionhandler:(void(^)())actionhandlered{
 
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 30);
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"yOrrange.png"] forState:UIControlStateNormal];
    [button addControlEventHandler:^(id sender, UIEvent *event) {
        
             actionhandlered();
        
    } forControlEvent:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];

}


@end
