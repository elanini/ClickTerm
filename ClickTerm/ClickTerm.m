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
-(void)viewWillDraw;
@end

ZKSwizzleInterface($_RightClickOverride, TDesktopView, NSView)
@implementation $_RightClickOverride
-(void)viewWillDraw
{
    ZKOrig(void);
    NSLog(@"fuck shit upsdlfjsldkjflsdkjflsdkjl.KJLJKJLJKLJLKJLKJDSLFKSNLCNWOEINVOLIJK");
}

-(void)rightMouseDown:(NSEvent *)theEvent
{
    NSDictionary* errorDict;
    NSAppleEventDescriptor* returnDescriptor = NULL;
    NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource:
                                   @"\
                                   tell application \"Terminal\"\n\
                                   do script \" \"\n\
                                   activate\n\
                                   end tell"];
    
    returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
    if (returnDescriptor == NULL) {
        NSLog(@"%@", errorDict);
    }
    NSLog(@"fuck shit upsdlfjsldkjflsdkjflsdkjl.KJLJKJLJKLJLKJLKJDSLFKSNLCNWOEINVOLIJK");
    ZKOrig(void, theEvent);
};
@end
