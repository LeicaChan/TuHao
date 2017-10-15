//
//  encryptionmanger.h
//  Potatso
//
//  Created by lewei on 16/12/28.
//  Copyright © 2016年 TouchingApp. All rights reserved.
//

#ifndef encryptionmanger_h
#define encryptionmanger_h

#include <stdio.h>
#include "sodium.h"
#include "string.h"
void chacha20test(unsigned char * arr,int length ,unsigned char decrypted[]);
#endif /* encryptionmanger_h */
