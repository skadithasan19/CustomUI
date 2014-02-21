//
//  MainCustomUI.h
//  CustomUI
//
//  Created by Adit Hasan on 2/21/14.
//  Copyright (c) 2014 Adit Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCustomUI : UIViewController
- (UIColor *) colorFromHexString:(NSString *)hexString;
+ (MainCustomUI *) instance;
@end
