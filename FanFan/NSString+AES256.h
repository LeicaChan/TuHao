//
//  NSString+AES256.h
//  Potatso
//
//  Created by lewei on 16/12/28.
//  Copyright © 2016年 TouchingApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "NSData+AES256.h"
@interface NSString (AES256)
-(NSString *) aes256_encrypt:(NSString *)key;
-(NSString *) aes256_decrypt:(NSString *)key;
@end
