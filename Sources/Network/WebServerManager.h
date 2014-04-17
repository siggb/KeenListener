//
//  WebServerManager.h
//  KeenListener
//
//  Created by Ildar Sibagatov on 17.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServerManager : NSObject

- (void)start;

- (void)stop;

- (BOOL)isRunning;

@end
