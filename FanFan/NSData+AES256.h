//
//  NSData+AES256.h
//  Potatso
//
//  Created by lewei on 16/12/28.
//  Copyright © 2016年 TouchingApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
@interface NSData (AES256)
-(NSData *) aes256_encrypt:(NSString *)key;
-(NSData *) aes256_decrypt:(NSString *)key;
@end
