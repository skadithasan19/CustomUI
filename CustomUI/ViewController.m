//
//  ViewController.m
//  CustomUI
//
//  Created by Adit Hasan on 2/21/14.
//  Copyright (c) 2014 Adit Hasan. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+BaseController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    [self ChangeToSKController];
    
    /*Either you can change you UIViewcontroller using this category or you can Inherit MainCustomeUI Controller*/
    
     NSLog(@"This first viewcontroller");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
