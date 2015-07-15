//
//  Common.m
//  SplitAndJonin
//
//  Created by ThanhDV on 6/3/15.
//  Copyright (c) 2015 ThanhDV. All rights reserved.
//

#import "Common.h"

@implementation Common

#pragma mark Split And Join file
+ (void)splitFile:(NSString*)filePath withSize:(NSInteger)size

{
    
    NSInputStream *inputStream = [[NSInputStream alloc] initWithFileAtPath:filePath];
    
    [inputStream open];
    
    int part = 0;
    
    while ([inputStream hasBytesAvailable])
        
    {
        
        part++;
        
        NSMutableData *obuffer = [[NSMutableData alloc] init];
        
        [obuffer setLength:size * 1024];
        
        NSInteger len = [inputStream read:[obuffer mutableBytes] maxLength:[obuffer length]];
        
        if (len) {
            
            [obuffer setLength:len];
            
            [obuffer writeToFile:[NSString stringWithFormat:@"%@.part%d",filePath,part] atomically:YES];
            
        }
    }
    
    [inputStream close];
    inputStream = nil;
    
}


//and for joining small chunks to create a single file:

+ (void)joinFiles:(NSMutableArray*)filePathArray andWriteToPath:(NSString*)outputPath

{
    
    NSOutputStream *outputStream = [[NSOutputStream alloc] initToFileAtPath:[NSString stringWithFormat:@"%@",outputPath] append:NO];
    [outputStream open];
    for (NSString *file in filePathArray) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:file];
        const uint8_t *buffer = [data bytes];
        NSUInteger length = [data length];
        NSInteger nwritten = [outputStream write:buffer maxLength:length];
        if (-1 == nwritten) {
            NSLog(@"Error writing to stream %@: %@", outputStream, [outputStream streamError]);
        } else {
            NSLog(@"Wrote %ld bytes to stream %@.", (long)nwritten, outputStream);
        }
    }
    [outputStream close];
    
    
//    /*
    
//    NSOutputStream *outputStream = [[NSOutputStream alloc] initToFileAtPath:@"/Users/thanhdv/Desktop/Chunk2" append:YES];
//    
//    [outputStream open];
//    
//    for (NSString *file in filePathArray)
//        
//    {
//        NSData *buffer = [[NSData alloc] initWithContentsOfFile:file];
//        
//       [outputStream write:[buffer bytes] maxLength:[buffer length]];
//        
//    }
//    
//    [outputStream close];
//    
//    outputStream = nil;
    
    
}
+(NSMutableArray*)getArrayFile:(NSString*)path {
    NSString *str = [NSString stringWithFormat:@"%@",path];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *fileList = [manager contentsOfDirectoryAtPath:str
                                                     error:nil];
    
    NSMutableArray *arrFile = [NSMutableArray array];
    for (NSString *strFile in fileList) {
        if ([strFile isEqualToString:@".DS_Store"]) continue;
        [arrFile addObject:[NSString stringWithFormat:@"%@/%@",path,strFile]];
    }
    return arrFile;
}
#pragma mark - Get Date Modified
+(NSDate*)getDateModifiedWithPath:(NSString*)path {
    NSDate * fileLastModifiedDate = nil;
    
    NSError * error = nil;
    NSDictionary * attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
    if (attrs && !error)
    {
        fileLastModifiedDate = [attrs fileModificationDate];
       
    }
    return fileLastModifiedDate;
}
@end
