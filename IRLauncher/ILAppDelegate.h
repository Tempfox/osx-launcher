//
//  ILVersionChecker.m
//  IRLauncher
//
//  Created by Masakazu Ohtsuka on 2014/01/30.
//  Copyright (c) 2014年 Masakazu Ohtsuka. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IRSearcher.h"
#import "ILMenu.h"

@interface ILAppDelegate : NSObject <NSApplicationDelegate,IRSearcherDelegate,NSMenuDelegate,ILMenuDelegate>

- (IBAction) showHelp: (id)sender;
- (IBAction) terminate: (id)sender;

@end
