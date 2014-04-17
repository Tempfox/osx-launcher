//
//  ILMenu.h
//  IRLauncher
//
//  Created by Masakazu Ohtsuka on 2014/01/30.
//  Copyright (c) 2014年 Masakazu Ohtsuka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILMenuCheckboxView.h"
#import "ILMenuButtonView.h"

@interface ILMenu : NSMenu<NSMenuDelegate>

@property (nonatomic, weak) id<ILMenuCheckboxViewDelegate> checkboxDelegate;
@property (nonatomic, weak) id<ILMenuButtonViewDelegate> buttonDelegate;

- (void)setSignalHeaderTitle:(NSString*)title animating:(BOOL)animating;
- (void)setPeripheralHeaderTitle:(NSString*)title animating:(BOOL)animating;
- (void)setUSBHeaderTitle:(NSString*)title animating:(BOOL)animating;
- (void)addSignalMenuItem: (NSMenuItem*)item;
- (void)addPeripheralMenuItem: (NSMenuItem*)item;

@end
