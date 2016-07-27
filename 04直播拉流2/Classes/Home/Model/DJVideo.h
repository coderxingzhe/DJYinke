//
//  DJVideo.h
//  DJYinke
//
//  Created by Mac on 16/7/22.
//  Copyright © 2016年 DJ. All rights reserved.
//
/*
 "dm_error" = 0;
 "error_msg" = "\U64cd\U4f5c\U6210\U529f";
 "expire_time" = 5;
 lives =     (
 {
 city = "\U574e\U6606";
 creator =             {
 birth = "1996-01-01";
 description = "wumengmeng93 \U7c89\U4e1d\U7fa4";
 emotion = "\U5355\U8eab";
 gender = 0;
 gmutex = 0;
 hometown = "\U706b\U661f&";
 id = 8833877;
 "inke_verify" = 0;
 level = 32;
 location = "\U574e\U6606";
 nick = "\U5434\U840c\U840c";
 portrait = "NDQ2MjMxNDY4NjM4NjQy.jpg";
 profession = "";
 "rank_veri" = 5;
 "third_platform" = 1;
 "veri_info" = "\U5c0f\U516c\U4e3e";
 verified = 0;
 "verified_reason" = "";
 };
 group = 1;
 id = 1469232180599956;
 image = "";
 link = 0;
 multi = 0;
 name = "";
 "online_users" = 16247;
 optimal = 0;
 "pub_stat" = 1;
 "room_id" = 454629861;
 rotate = 0;
 "share_addr" = "http://live4.a8.com/s/?uid=8833877&liveid=1469232180599956&ctime=1469232180";
 slot = 6;
 status = 1;
 "stream_addr" = "http://pull99.a8.com/live/1469232180599956.flv?ikHost=ws&ikOp=1&CodecInfo=8192";
 version = 0;
 },

*/

#import <Foundation/Foundation.h>

@interface DJVideo : NSObject

@property (nonatomic, strong)NSString * ID;

@property (nonatomic, strong)NSString * city;

@property (nonatomic, strong)NSString * name;

@property (nonatomic, strong)NSString * portrait;

@property (nonatomic, assign)int  online_users;

@property (nonatomic, strong)NSString * url;

- (id)initWithDictionary:(NSDictionary *)dic;

+ (void)loadVideosWithResult:(void(^)(NSArray *)) completion;

@end
