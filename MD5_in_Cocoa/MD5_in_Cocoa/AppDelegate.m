//
//  AppDelegate.m
//  MD5_in_Cocoa
//
//  Created by Kiarash Kiani on 11/10/13.
//  Copyright (c) 2013 kiarash kiani. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *path = @"/Application/iTunes.app";
    
    NSLog(@"%@", [self MD5File:path]);
}

-(NSString *)MD5File:(NSString  *)path{
    
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    NSData *data = [NSData dataWithContentsOfFile:path];
    CC_MD5(data.bytes, (int)data.length, md5Buffer);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

@end
