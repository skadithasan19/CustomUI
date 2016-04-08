//
//  UIControl+SKTargetEventBlock.h
//  CustomUI
//
//  Created by Adit Hasan on 1/24/15.
//  Copyright (c) 2015 Adit Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SKEventHandler)(id sender,UIEvent *event);

@interface UIControl (SKTargetEventBlock)

-(void)addControlEventHandler:(SKEventHandler)skhandler forControlEvent:(UIControlEvents)controlEvent;
-(void)removeEventHandlerFromExistingEvent:(UIControlEvents)controlEvent;

@end
