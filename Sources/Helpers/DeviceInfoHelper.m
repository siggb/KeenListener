//
//  DeviceInfoHelper.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "DeviceInfoHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import <sys/utsname.h>

@implementation DeviceInfoHelper


+ (float)iOSVersion;
{
    NSString *ver = [[UIDevice currentDevice] systemVersion];
    return [ver floatValue];
}

+ (NSString*)deviceModel
{
    static NSString *device_model = nil;
    
    if (device_model != nil)
        return device_model;
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *str = @(systemInfo.machine);
    
    if ([str isEqualToString:@"i386"] || [str isEqualToString:@"x86_64"]) {
        device_model = @"Simulator iOS";
    }
    else if ([str isEqualToString:@"iPod1,1"]) {
        device_model = @"iPod Touch - 1st Generation";
    }
    else if ([str isEqualToString:@"iPod2,1"]) {
        device_model = @"iPod Touch - 2nd Generation";
    }
    else if ([str isEqualToString:@"iPod3,1"]) {
        device_model = @"iPod Touch - 3rd Generation";
    }
    else if ([str isEqualToString:@"iPod4,1"]) {
        device_model = @"iPod Touch - 4th Generation";
    }
    else if ([str isEqualToString:@"iPhone1,1"]) {
        device_model = @"iPhone";
    }
    else if ([str isEqualToString:@"iPhone1,2"]) {
        device_model = @"iPhone 3G";
    }
    else if ([str isEqualToString:@"iPhone2,1"]) {
        device_model = @"iPhone 3GS";
    }
    else if ([str isEqualToString:@"iPhone3,1"]) {
        device_model = @"iPhone 4 AT&T";
    }
    else if ([str isEqualToString:@"iPhone3,2"] || [str isEqualToString:@"iPhone3,3"]) {
        device_model = @"iPhone 4 GSM/SDMA";
    }
    else if ([str isEqualToString:@"iPhone4,1"]) {
        device_model = @"iPhone 4S";
    }
    else if ([str isEqualToString:@"iPhone5,2"]) {
        device_model = @"iPhone 5";
    }
    else if ([str isEqualToString:@"iPad1,1"]) {
        device_model = @"iPad WiFi";
    }
    else if ([str isEqualToString:@"iPad1,2"]) {
        device_model = @"iPad GSM";
    }
    else if ([str isEqualToString:@"iPad2,1"]) {
        device_model = @"iPad 2 WiFi";
    }
    else if ([str isEqualToString:@"iPad2,2"] || [str isEqualToString:@"iPad2,3"]) {
        device_model = @"iPad 2 GSM/CDMA";
    }
    else if ([str isEqualToString:@"iPad3,1"]) {
        device_model = @"iPad 3 WiFi";
    }
    else if ([str isEqualToString:@"iPad3,2"] || [str isEqualToString:@"iPad3,3"]) {
        device_model = @"iPad 3 GSM/CDMA";
    }
    
    return device_model;
}

/**
 *  Метод для проверки соединения с сетью Интернет
 */
+ (BOOL)connectedToNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"google.com"];
    NetworkStatus remote_host_status = [reachability currentReachabilityStatus];
    BOOL rv = NO;
    
    if(remote_host_status == NotReachable) {
        // nothing to do here..
    }
    else if (remote_host_status == ReachableViaWWAN) {
        rv = YES;
    }
    else if (remote_host_status == ReachableViaWiFi) {
        rv = YES;
    }
    
    DPLogFast(@"internet status: %@", (rv)?@"connected":@"not connected");
    return rv;
}

@end

