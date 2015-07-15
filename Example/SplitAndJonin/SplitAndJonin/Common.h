//
//  Common.h
//  SplitAndJonin
//
//  Created by ThanhDV on 6/3/15.
//  Copyright (c) 2015 ThanhDV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject
+ (void)splitFile:(NSString*)filePath withSize:(NSInteger)size;
+ (void)joinFiles:(NSArray*)filePathArray andWriteToPath:(NSString*)outputPath;
+ (NSMutableArray*)getArrayFile:(NSString*)path;
+(NSDate*)getDateModifiedWithPath:(NSString*)path;
@end
