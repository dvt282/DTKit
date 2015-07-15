//
//  AppDelegate.m
//  SplitAndJonin
//
//  Created by ThanhDV on 6/3/15.
//  Copyright (c) 2015 ThanhDV. All rights reserved.
//

#import "AppDelegate.h"
#import "Common.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//    [Common splitFile:@"/Users/thanhdv/Desktop/Chunk/Nhac.mp3" withSize:1024];    
//    NSLog(@"Split success");
    
//   NSMutableArray *arrFile = [Common getArrayFile:@"/Users/thanhdv/Desktop/Chunk"];
//    [Common joinFiles:arrFile andWriteToPath:@"/Users/thanhdv/Desktop/Chunk/NhacFX.mp3"];
//    NSLog(@"Join success");

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT +7"]];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSString *strDateF = [dateFormatter stringFromDate:[Common getDateModifiedWithPath:@"/Users/thanhdv/Desktop/Chunk/NhacFX.mp3"]];
     [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSDate *dateFF = [dateFormatter dateFromString:strDateF];
    NSLog(@"Date:%@",dateFF.description);
    NSDate *dateF = [dateFormatter dateFromString:strDateF];
    NSTimeInterval timeInterval = [dateF timeIntervalSince1970];
    NSLog(@"TimeStamp:%.0f",timeInterval);
    
    NSDate *dateConver = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSLog(@"Date convert:%@",dateConver.description);
    
    
    
    
//    NSLog(@"%@",[Common getDateModifiedWithPath:@"/Users/thanhdv/Desktop/Chunk/NhacFX.mp3"].description);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end 
