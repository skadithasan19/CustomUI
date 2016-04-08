//
//  UIControl+SKTargetEventBlock.m
//  CustomUI
//
//  Created by Adit Hasan on 1/24/15.
//  Copyright (c) 2015 Adit Hasan. All rights reserved.
//

#import "UIControl+SKTargetEventBlock.h"
#import <objc/runtime.h>
////////////////////////Event Wrapper/////////////////

@interface SKEventWrapper : NSObject
@property(nonatomic,assign)UIControlEvents controlEvent;
@property(nonatomic,copy)SKEventHandler blkhandler;
@end

@implementation SKEventWrapper
-(void)sender:(id)sender forAnEvent:(UIEvent *)event{
    if (self.blkhandler) {
        self.blkhandler(sender,event);
    }
    
}

-(void)dealloc{

    objc_removeAssociatedObjects(self);
}
@end

////////////////////////Event Wrapper/////////////////

@implementation UIControl (SKTargetEventBlock)
static char *eventWrapListKey;

-(NSMutableArray *)eventWrapList{

    NSMutableArray *list = objc_getAssociatedObject(self, &eventWrapListKey);
    if (!list) {
        list = [NSMutableArray array];
        objc_setAssociatedObject(self, &eventWrapListKey, list, OBJC_ASSOCIATION_RETAIN);
    }
    return list;
}

-(void)addControlEventHandler:(SKEventHandler)skhandler forControlEvent:(UIControlEvents)controlEvent{

    SKEventWrapper *skwrapper = [[SKEventWrapper alloc] init];
    skwrapper.controlEvent = controlEvent;
    skwrapper.blkhandler = skhandler;
    [self addTarget:skwrapper action:@selector(sender:forAnEvent:) forControlEvents:controlEvent];
    [[self eventWrapList] addObject:skwrapper];

}

-(void)removeEventHandlerFromExistingEvent:(UIControlEvents)controlEvent{

    __block __weak UIControl *wkSelf = self;
    [[self eventWrapList] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    
    SKEventWrapper *wrapObj = obj;
    if (wrapObj.controlEvent == controlEvent) {
        [wkSelf removeTarget:wrapObj action:NULL forControlEvents:controlEvent];
    }
}];
    
    
}
@end
