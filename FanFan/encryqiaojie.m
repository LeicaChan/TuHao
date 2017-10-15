//
//  encryqiaojie.m
//  Potatso
//
//  Created by lewei on 16/12/29.
//  Copyright © 2016年 TouchingApp. All rights reserved.
//

#import "encryqiaojie.h"

@implementation encryqiaojie
+(void)testdd:(NSString*)message{
    NSLog(@"加密前%@",message);
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
     Byte *byteArray = (Byte *)[data bytes];
    
    unsigned char decrypted[(int)data.length];
    
   chacha20test(byteArray,(int)data.length,decrypted);
 
    NSData *newdata = [NSData dataWithBytes:decrypted length:sizeof(decrypted) / sizeof(Byte)];
    
   NSString *result = [[NSString alloc] initWithData:newdata  encoding:NSUTF8StringEncoding];
    NSLog(@"%@",result);

   }

@end
