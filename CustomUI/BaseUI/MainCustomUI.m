//
//  MainCustomUI.m
//  CustomUI
//
//  Created by Adit Hasan on 2/21/14.
//  Copyright (c) 2014 Adit Hasan. All rights reserved.
//

#import "MainCustomUI.h"

@interface MainCustomUI ()

@end

@implementation MainCustomUI

- (id) initSingleton
{
    if ((self = [super init]))
    {
 
    }
    
    return self;
}

+ (MainCustomUI *) instance
{
    // Persistent instance.
    static MainCustomUI *_default = nil;
    
    // Small optimization to avoid wasting time after the
    // singleton being initialized.
    if (_default != nil)
    {
        return _default;
    }
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
    // Allocates once with Grand Central Dispatch (GCD) routine.
    // It's thread safe.
    static dispatch_once_t safer;
    dispatch_once(&safer, ^(void)
                  {
                      _default = [[MainCustomUI alloc] initSingleton];
                  });
#else
    // Allocates once using the old approach, it's slower.
    // It's thread safe.
    @synchronized([MySingleton class])
    {
        // The synchronized instruction will make sure,
        // that only one thread will access this point at a time.
        if (_default == nil)
        {
            _default = [[MySingleton alloc] initSingleton];
        }
    }
#endif
    return _default;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
     self.navigationController.navigationBar.translucent=NO;
    [[UINavigationBar appearance] setTintColor:[[MainCustomUI instance] colorFromHexString:@"cc6633"]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"CommonBackground"]]];
    [self addBackButton];
    [self addRightButton];
}


-(void)viewUIButtonChanges{

    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            UIButton *Button=(UIButton*)subviewbutton;
            
            if (Button.tag==0) {
                
    [Button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
             
            }
            
        }
    }
}
- (void)addRightButton {
    
    // Custom Navigation Bar Back Button
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 30);
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"yOrrange.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
   
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}
-(void)rightbuttonAction:(id)sender{

    

}

- (void)addBackButton {
    
    // Custom Navigation Bar Back Button
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(-20, 0, 50, 50);
    [button setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [button addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    UIView * view = [[UIView alloc] initWithFrame:button.bounds];//CGRectMake(0, 0, backButtonImage.size.width,
    [view addSubview:button];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
}



- (UIColor *) colorFromHexString:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
