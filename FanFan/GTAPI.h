//
//  GTAPI.h
//  Potatso
//
//  Created by lewei on 17/1/7.
//  Copyright © 2017年 TouchingApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"
@interface GTAPI : NSObject
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;
+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;
@end
