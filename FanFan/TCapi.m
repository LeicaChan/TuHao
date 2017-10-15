//
//  TCapi.m
//  FanFan
//
//  Created by 陈世杰 on 17/7/20.
//  Copyright © 2017年 lewei. All rights reserved.
//

#import "TCapi.h"

@implementation TCapi
static TCapi *api;
#pragma mark - 数据网络方法
+(TCapi *)share{
    if (!api){
        api = [[TCapi alloc]init];
        api.userinfo  = [[TCUserinfo alloc]init];
    }
    return api;
}
-(void)setItemsAdress:(NSString *)adress AndKey:(NSString *)key{
    if(_userinfo){
        self.userinfo.severadress = adress;
        self.userinfo.key = key;
    }
    else{
        _userinfo = [[TCUserinfo alloc]init];
        _userinfo.severadress = adress;
        _userinfo.key = key;
        
    }
}
-(void)setToken:(NSString *)token{
    if(_userinfo){
        self.userinfo.access_token = token;
    }else
    {
        _userinfo = [[TCUserinfo alloc]init];
        _userinfo.access_token = token;
    }
}
-(void)requstUeserinfoandcallback:(TCCallBack)callback{

    
    NSString *path = [NSString stringWithFormat:@"http://%@/api/user_info",self.userinfo.severadress];
       // 2.创建一个网络请求，分别设置请求方法、请求参数
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    request.HTTPMethod = @"POST";
    NSString *args = [NSString stringWithFormat:@"access_token=%@&params_en=1",self.userinfo.access_token];
    request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];
      NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [sesion dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"请求错误");
            callback(@{@"errorload":@"1"});
            return ;
            
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if(httpResponse.statusCode == 200){
            NSError *err;
            
            NSDictionary *dicever = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

            
            if(err) {
                
                NSLog(@"json解析失败：%@",err);
                callback(@{@"errorload":@"3"});
                
                
            }
            else{
                NSLog(@"%@",dicever);
                callback(dicever);
            }
            
            
        }
        else{
            NSLog(@"请求错误%ld",(long)httpResponse.statusCode);
            
            callback(@{@"errorload":@"2"});
        }
        
    }];
    
    [task resume];
}
-(void)requstMetadata:(NSString*)is_recommend Andoffset:(NSString*)offset Andlimit:(NSString*)limit andcallback:(TCCallBack)callback{
    
    
    //    NSLog(@"%@",[AES128 AES128Decrypt:@"CWfUaAx+Ltrh5mNRTh9Oe9/krNmwrtp+qqguZh2MAm5RD06ZZW13okk+xsblRgqtO/nkHe1Te4pRQE/iPV99WXjFTMSOla4UuUh4ee1Br8bAcUb4LS/xZGd2yWG7KBtkJnzDy6GM3WdnWTWnMKMJlsiS9nvbe7zGJ1rvpTl71DghceTIUMA43WohpxGq0E3W" withKey:@"JONMG5O2MOFR1VHN"]);
    
    NSString *path = [NSString stringWithFormat:@"http://%@/api/posts",self.userinfo.severadress];
    
    //    NSDictionary *paramse = @{@"phone": smsname};
    
    // 2.创建一个网络请求，分别设置请求方法、请求参数
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    request.HTTPMethod = @"POST";
    NSString *args = [NSString stringWithFormat:@"access_token=%@&offset=%@&limit=%@&is_recommend=%@&params_en=1",self.userinfo.access_token,offset,limit,is_recommend];
    request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];
    
    //    //调用系统设置生成请求路径
    //    //    NSString * encodingString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    NSString *path = [NSString stringWithFormat:@"http://%@/auth/login?",self.userinfo.severadress];
    //    NSDictionary *paramse = @{@"phone": username ,@"sms_code":password,@"device_info":deviceinfo,@"device_name":devicename,@"device_type":type};
    //
    //    NSError *parseError = nil;
    //
    //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramse options:NSJSONWritingPrettyPrinted error:&parseError];
    //
    //    NSString *enstr =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //    //进行url请求
    //    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    //
    //    NSLog(@"%@",self.userinfo.key);
    //    NSString *ba = [AES128 AES128Encrypt:enstr withKey:self.userinfo.key];
    //    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //
    //
    //
    //
    //    NSString *_page = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)ba, nil, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    //
    //    NSString *params = [[NSString alloc] initWithFormat:@"sign=%@",_page];
    //    NSData *nsdata_params = [params dataUsingEncoding:NSUTF8StringEncoding];
    //    [request setHTTPBody:nsdata_params];
    //    NSLog(@"%@",request.HTTPBody);
    //    [request setHTTPMethod:@"POST"];
    //    request.timeoutInterval = 30;
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [sesion dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"请求错误");
            callback(@{@"errorload":@"1"});
            return ;
            
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if(httpResponse.statusCode == 200){
            NSError *err;
            
            NSDictionary *dicever = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //            NSString *ok = [AES128 AES128Decrypt:[dicever objectForKey:@"sign"] withKey:self.userinfo.key];
            //            if (ok == nil) {
            //                callback(@{@"errorload":@"1"});
            //                return;
            //
            //            }
            //
            //            NSData *jsonData = [ok dataUsingEncoding:NSUTF8StringEncoding];
            //
            //            NSError *err;
            //
            //            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
            //
            //                                                                options:NSJSONReadingMutableContainers
            //
            //                                                                  error:&err];
            
            if(err) {
                
                NSLog(@"json解析失败：%@",err);
                callback(@{@"errorload":@"3"});
                
                
            }
            else{
                NSLog(@"%@",dicever);
                callback(dicever);
            }
            
            
        }
        else{
            NSLog(@"请求错误%ld",(long)httpResponse.statusCode);
            
            callback(@{@"errorload":@"2"});
        }
        
    }];
    
    [task resume];
}
//登录
//参数 username - 用户名 Password - 密码 Deviceinfo - 设备信息 DeviceName - 设备名称 Devicetype - 设备类型 callback - 回调
-(void)WujilianloadUsername:(NSString*)username AndPassWord:(NSString*)password AndDeviceInfo:(NSString*)deviceinfo AndDeviceName:(NSString*)devicename AndDevicetype:(NSString*)type AndCallback:(TCCallBack)callback{
    
    
    //    NSLog(@"%@",[AES128 AES128Decrypt:@"CWfUaAx+Ltrh5mNRTh9Oe9/krNmwrtp+qqguZh2MAm5RD06ZZW13okk+xsblRgqtO/nkHe1Te4pRQE/iPV99WXjFTMSOla4UuUh4ee1Br8bAcUb4LS/xZGd2yWG7KBtkJnzDy6GM3WdnWTWnMKMJlsiS9nvbe7zGJ1rvpTl71DghceTIUMA43WohpxGq0E3W" withKey:@"JONMG5O2MOFR1VHN"]);
    
    NSString *path = [NSString stringWithFormat:@"http://%@/auth/login",self.userinfo.severadress];
    
    //    NSDictionary *paramse = @{@"phone": smsname};
    
    // 2.创建一个网络请求，分别设置请求方法、请求参数
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    request.HTTPMethod = @"POST";
    NSString *args = [NSString stringWithFormat:@"phone=%@&params_en=1&sms_code=%@&device_info=%@&device_name=%@&device_type=%@",username,password,deviceinfo,devicename,type];
    request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];

//    //调用系统设置生成请求路径
//    //    NSString * encodingString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *path = [NSString stringWithFormat:@"http://%@/auth/login?",self.userinfo.severadress];
//    NSDictionary *paramse = @{@"phone": username ,@"sms_code":password,@"device_info":deviceinfo,@"device_name":devicename,@"device_type":type};
//    
//    NSError *parseError = nil;
//    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramse options:NSJSONWritingPrettyPrinted error:&parseError];
//    
//    NSString *enstr =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    //进行url请求
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
//    
//    NSLog(@"%@",self.userinfo.key);
//    NSString *ba = [AES128 AES128Encrypt:enstr withKey:self.userinfo.key];
//    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    
//    
//    
//    
//    NSString *_page = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)ba, nil, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
//    
//    NSString *params = [[NSString alloc] initWithFormat:@"sign=%@",_page];
//    NSData *nsdata_params = [params dataUsingEncoding:NSUTF8StringEncoding];
//    [request setHTTPBody:nsdata_params];
//    NSLog(@"%@",request.HTTPBody);
//    [request setHTTPMethod:@"POST"];
//    request.timeoutInterval = 30;
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [sesion dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"请求错误");
            callback(@{@"errorload":@"1"});
            return ;
            
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if(httpResponse.statusCode == 200){
            NSError *err;

            NSDictionary *dicever = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            NSString *ok = [AES128 AES128Decrypt:[dicever objectForKey:@"sign"] withKey:self.userinfo.key];
//            if (ok == nil) {
//                callback(@{@"errorload":@"1"});
//                return;
//                
//            }
//            
//            NSData *jsonData = [ok dataUsingEncoding:NSUTF8StringEncoding];
//            
//            NSError *err;
//            
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
//                                 
//                                                                options:NSJSONReadingMutableContainers
//                                 
//                                                                  error:&err];
            
            if(err) {
                
                NSLog(@"json解析失败：%@",err);
                callback(@{@"errorload":@"3"});
                
                
            }
            else{
                NSLog(@"%@",dicever);
                callback(dicever);
                          }
            
            
        }
        else{
            NSLog(@"请求错误%ld",(long)httpResponse.statusCode);
            
            callback(@{@"errorload":@"2"});
        }
        
    }];
    
    [task resume];
}
//短信
-(void)requstduanxin:(NSString*)smsname andcallback:(TCCallBack)callback{
    NSString *path = [NSString stringWithFormat:@"http://%@/auth/send_sms?",self.userinfo.severadress];
    
//    NSDictionary *paramse = @{@"phone": smsname};
    
       // 2.创建一个网络请求，分别设置请求方法、请求参数
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    request.HTTPMethod = @"POST";
    NSString *args = [NSString stringWithFormat:@"phone=%@&params_en=1",smsname];
    request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *parseError = nil;
//    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramse options:NSJSONWritingPrettyPrinted error:&parseError];
//    
//    NSString *enstr =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    
//    //进行url请求
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
//    
//    NSLog(@"%@",self.userinfo.key);
//    NSString *ba = [AES128 AES128Encrypt:enstr withKey:self.userinfo.key];
//    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    
//    
//    NSString *_page = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)ba, nil, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
//    
//    NSString *params = [[NSString alloc] initWithFormat:@"sign=%@",_page];
//    NSData *nsdata_params = [params dataUsingEncoding:NSUTF8StringEncoding];
//    [request setHTTPBody:nsdata_params];
//    NSLog(@"%@",request.HTTPBody);
//    [request setHTTPMethod:@"POST"];
//    request.timeoutInterval = 30;
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [sesion dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"请求错误");
            callback(@{@"errorload":@"1"});
            return ;
            
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if(httpResponse.statusCode == 200){
                NSError *err;
            NSDictionary *dicever = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
//            NSString *ok = [AES128 AES128Decrypt:[dicever objectForKey:@"sign"] withKey:self.userinfo.key];
//            if (ok == nil) {
//                callback(@{@"errorload":@"1"});
//                return;
//                
//            }
//            
//            NSData *jsonData = [ok dataUsingEncoding:NSUTF8StringEncoding];
//            
//            NSError *err;
//            
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
//                                 
//                                                                options:NSJSONReadingMutableContainers
//                                 
//                                                                  error:&err];
//            
            if(err) {
                
                NSLog(@"json解析失败：%@",err);
                callback(@{@"errorload":@"4"});
                
                
            }
            else{
                NSLog(@"%@",dicever);
                callback(dicever);
            }
            
            
        }
        else{
            NSLog(@"请求错误%ld",(long)httpResponse.statusCode);
            
            callback(@{@"errorload":@"3"});
        }
        
    }];
    
    [task resume];
    

}
//钥匙串保存
+(NSString*)guolvpage:(NSString*)guolv{
    NSString *_page = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)guolv, nil, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    return _page;
    
}
+(BOOL)isIncludeSpecialCharact: (NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~#￥&*（）——+|《》$_€!"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

static NSString * const kRHDictionaryKey = @"com.xxxx.dictionaryKey";
static NSString * const kRHKeyChainKey = @"com.xxxx.keychainKey";

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}


#pragma mark - 界面类公开方法
//外部主线程 显示控制器
+(void)PushMainView:(UIViewController*)view WithVC:(UIViewController*)vc{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [vc presentViewController:view animated:YES completion:^{
            
        }];
});
}
@end
