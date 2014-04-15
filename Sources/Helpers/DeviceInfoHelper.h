//
//  DeviceInfoHelper.h
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfoHelper : NSObject

/** Определение версии iOS */
+ (float)iOSVersion;

/** Определение модели устройства */
+ (NSString*)deviceModel;

/** Метод для проверки соединения с сетью Интернет */
+ (BOOL)connectedToNetwork;

@end
