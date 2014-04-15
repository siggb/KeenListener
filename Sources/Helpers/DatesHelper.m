//
//  DatesHelper.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "DatesHelper.h"

@implementation DatesHelper

+ (NSDateFormatter*)UTCDateTimeFormatter
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.locale = [NSLocale currentLocale];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [df setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    return df;
}

@end
