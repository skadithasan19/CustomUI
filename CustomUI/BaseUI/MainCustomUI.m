//
//  MainCustomUI.m
//  CustomUI
//
//  Created by Adit Hasan on 2/21/14.
//  Copyright (c) 2014 Adit Hasan. All rights reserved.
//

#import "MainCustomUI.h"
#import "UIColor+UIColorCategory.h"
#import "UIBarButtonItem+UIBarButtonCategory.h"
@interface MainCustomUI ()

@end

@implementation MainCustomUI



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
     self.navigationController.navigationBar.translucent=NO;
    [[UINavigationBar appearance] setTintColor:[[UIColor alloc] colorFromHexString:@"cc6633"]];
   
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"CommonBackground"]]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] addSKBarButton:@"Next" actionhandler:^{
        
        if ([self.navigationController.viewControllers count]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
         NSLog(@"Right Button Action");
    }];

    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] addSKBarButton:@"Back" actionhandler:^{
        
        NSLog(@"Left Button Action");
        
    }];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
