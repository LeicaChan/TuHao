//
//  AES128.h
//  Potatso
//
//  Created by lewei on 17/1/9.
//  Copyright © 2017年 TouchingApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AES128 : NSObject
+(NSString *)AES128Encrypt:(NSString *)plainText withKey:(NSString *)key;
+(NSString *)AES128Decrypt:(NSString *)encryptText withKey:(NSString *)key;
@end
