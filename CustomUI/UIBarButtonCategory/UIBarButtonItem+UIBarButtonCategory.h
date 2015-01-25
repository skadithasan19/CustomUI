//
//  UIBarButtonItem+UIBarButtonCategory.h
//  CustomUI
//
//  Created by Adit Hasan on 1/24/15.
//  Copyright (c) 2015 Adit Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (UIBarButtonCategory)

-(UIBarButtonItem *)addSKBarButton:(NSString *)buttonTitle actionhandler:(void(^)())actionhandlered;
@end
