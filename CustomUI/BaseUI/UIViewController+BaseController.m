//
//  UIViewController+BaseController.m
//  CustomUI
//
//  Created by Adit Hasan on 1/24/15.
//  Copyright (c) 2015 Adit Hasan. All rights reserved.
//

#import "UIViewController+BaseController.h"
#import "UIBarButtonItem+UIBarButtonCategory.h"
#import "UIColor+UIColorCategory.h"
@implementation UIViewController (BaseController)

-(void)ChangeToSKController{

    self.navigationController.navigationBar.translucent=NO;
    [[UINavigationBar appearance] setTintColor:[[UIColor alloc] colorFromHexString:@"cc6633"]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"CommonBackground"]]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] addSKBarButton:@"Next" actionhandler:^{
        
        NSLog(@"Right Button Action");
    }];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] addSKBarButton:@"Back" actionhandler:^{
        
        NSLog(@"Left Button Action");
        
    }];

}
@end
