//
//  WWAPI.h
//  WWCareLink
//
//  Created by apple on 3/16/16.
//  Copyright © 2016 WW. All rights reserved.
//



//MARK: 映客接口
#define VideoDatas [NSString stringWithFormat:@"http://service.ingkee.com/api/live/gettop?imsi=&uid=17800399&proto=5&idfa=A1205EB8-0C9A-4131-A2A2-27B9A1E06622&lc=0000000000000026&cc=TG0001&imei=&sid=20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3&cv=IK3.1.00_Iphone&devi=bcb94097c7a3f3314be284c8a5be2aaeae66d6ab&conn=Wifi&ua=iPhone&idfv=DEBAD23B-7C6A-4251-B8AF-A95910B778B7&osversion=ios_9.300000&count=5&multiaddr=1"]


//MARK: 测试用账户
#define API_UserID 1000089
#define API_UserToken @"985c96ce43bb5ef69de3e1ad8afaa83f"


//MARK: 用户信息保存地址
#define API_UserFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user.plist"]



////MARK:API 接口 
#define API_BaseURLString @"http://"
//MARK:  百度天气
#define BDWeather_KEY @"17IvzuqmKrK1cGwNL6VQebF9"
#define BDWeather_URLString @"http://api.map.baidu.com/telematics/v3/weather"

//MARK:  SMSSDK 短信验证
#define SMSSDK_APPKey @"109b973a41879"
#define SMSSDK_APPSecret @"95185689e8b09114aea2e87472bc3cba"

//MARK:  友盟社会化分享
#define UMSocial_APPKey @"56ee4e4f67e58e9b5c0003cf"

