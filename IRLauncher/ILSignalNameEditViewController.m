//
//  ILSignalNameEditViewController.m
//  IRLauncher
//
//  Created by Masakazu Ohtsuka on 2014/06/17.
//  Copyright (c) 2014年 Masakazu Ohtsuka. All rights reserved.
//

#import "ILSignalNameEditViewController.h"
#import "ILLog.h"
#import "IRConst.h"

@interface ILSignalNameEditViewController ()

@property (nonatomic) id textObserver;

@end

@implementation ILSignalNameEditViewController

- (void) awakeFromNib {
    ILLOG_CURRENT_METHOD;

    __weak typeof(self) _self = self;
    _textObserver             = [[NSNotificationCenter defaultCenter] addObserverForName: NSControlTextDidChangeNotification
                                                                                  object: _inputTextField
                                                                                   queue: nil
                                                                              usingBlock:^(NSNotification *note) {
        NSString *input = _self.inputTextField.stringValue;
        if ([input isEqualToString: @""]) {
            input = @"aircon-off"; // this is what's shown in placeholder
        }
        NSString *format = NSLocalizedString(@"IR signal data will be saved as:\n~/.irkit.d/signals/%@.json\n\nSearch for \"%@\"\nin Quicksilver or Alfred 2", @"ILSignalNameEditViewController guide message");
        NSString *guideMessage = [NSString stringWithFormat: format, input, input ];
        _self.guideTextField.stringValue = guideMessage;
    }];
    [_inputTextField setDelegate: self];
}

- (void) dealloc {
    ILLOG_CURRENT_METHOD;
    [_inputTextField setDelegate: nil];
    [[NSNotificationCenter defaultCenter] removeObserver: _textObserver];
}

- (void)animationDidFinish {
    // activate and show blinking carret
    [self.view.window makeFirstResponder: _inputTextField];

    // we can make the carret blinking calling setString: ,
    // but this makes the blue border blink once, which looks weird.
    // I prefer not showing the carret blinking than the border blinking.
    // [[_inputTextField currentEditor] setString: @""];
}

- (IBAction) returnKeyPressed:(id)sender {
    ILLOG_CURRENT_METHOD;

    [self saveButtonPressed: sender];
}

- (IBAction) saveButtonPressed:(id)sender {
    ILLOG_CURRENT_METHOD;

    _signal.name = _inputTextField.stringValue;
    [_delegate signalNameEditViewController: self
                          didFinishWithInfo: @{ IRViewControllerResultType : IRViewControllerResultTypeDone,
                                                IRViewControllerResultSignal : _signal,
                                                IRViewControllerResultText : _inputTextField.stringValue }];
}

- (IBAction) cancelButtonPressed:(id)sender {
    ILLOG_CURRENT_METHOD;

    [_delegate signalNameEditViewController: self
                          didFinishWithInfo: @{ IRViewControllerResultType: IRViewControllerResultTypeCancelled }];
}

#pragma mark - NSTextFieldDelegate

- (NSArray *)control:(NSControl *)control textView:(NSTextView *)textView completions:(NSArray *)words forPartialWordRange:(NSRange)charRange indexOfSelectedItem:(NSInteger *)index {
    return nil;
}

@end
