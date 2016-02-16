//
//  ClickTerm.m
//  ClickTerm
//
//  Created by Eric Lanini on 2/15/16.
//  Copyright © 2016 Eric Lanini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Opee/Opee.h>

@interface TDesktopView : NSView
-(void)rightMouseDown:(NSEvent *)theEvent;
@end

ZKSwizzleInterface($_RightClickOverride, TDesktopView, NSView)
@implementation $_RightClickOverride

-(void)rightMouseDown:(NSEvent *)theEvent
{
    if ([theEvent modifierFlags] & NSCommandKeyMask) {
        NSDictionary* errorDict;
        NSAppleEventDescriptor* returnDescriptor = NULL;
        NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource:
                                       [NSString stringWithFormat:@"\
                                       tell application \"Terminal\"\n\
                                       set newTab to do script\n\
                                       set the origin of front window to {%f, %f}\n\
                                       activate\n\
                                       end tell", theEvent.locationInWindow.x, theEvent.locationInWindow.y]];
        
        returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
        if (returnDescriptor == NULL) {
            NSLog(@"%@", errorDict);
        }
    } else {
        ZKOrig(void, theEvent);
    }
};
@end
