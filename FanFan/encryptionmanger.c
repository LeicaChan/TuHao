//
//  encryptionmanger.c
//  Potatso
//
//  Created by lewei on 16/12/28.
//  Copyright © 2016年 TouchingApp. All rights reserved.
//

#include "encryptionmanger.h"


unsigned char nonce[crypto_aead_chacha20poly1305_NPUBBYTES];
unsigned char key[crypto_aead_chacha20poly1305_KEYBYTES];

//加密字符
unsigned long long ciphertext_len;
void chacha20test(unsigned char * arr,int length ,unsigned char decrypted[]){
    randombytes_buf(key, sizeof key);
    randombytes_buf(nonce, sizeof nonce);
  unsigned char ciphertext1[length + crypto_aead_chacha20poly1305_ABYTES];
    crypto_aead_chacha20poly1305_encrypt(ciphertext1, &ciphertext_len,
                                         arr, length,
                                         0, 0,
                                         NULL, nonce, key);
    printf("chacha20加密数据:%s ",ciphertext1);
   
    unsigned long long decrypted_len;
    if (crypto_aead_chacha20poly1305_decrypt(decrypted, &decrypted_len,
                                             NULL,
                                             ciphertext1, ciphertext_len,
                                             0,
                                             0,
                                             nonce, key) != 0) {
        /* message forged! */
    
    }
    printf("chacha20解密数据:%s",decrypted);

    
}
