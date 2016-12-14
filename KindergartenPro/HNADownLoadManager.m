//
//  HNADownLoadManager.m
//  HNAHRMPro
//
//  Created by 海峰 on 14-3-17.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "HNADownLoadManager.h"
#import "GDataXMLNode.h"
#import "XMLReader.h"
@implementation HNADownLoadManager
static HNADownLoadManager *downLoadManager;
+(HNADownLoadManager *)sharedDownLoadManager
{
    @synchronized(self)
    {
        if (downLoadManager == nil) {
            downLoadManager = [[self alloc] init];
        }
    }
    return downLoadManager;
}

//将得到的数据进行xml解析以获得json数据
-(NSString *) gainJSONStringFromRequest:(ASIHTTPRequest *) request
{
    NSLog(@"!!!%@!!!",request.responseString);
    NSString *dataStr = [NSString stringWithFormat:@"%@",request.responseString];
    if ([dataStr rangeOfString:@"<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"].location == NSNotFound) {
//        NSData * rootData = [request.responseString  dataUsingEncoding:NSUTF8StringEncoding];
        return request.responseString;
    }else{
        GDataXMLDocument *root = [[GDataXMLDocument alloc] initWithData:request.responseData options:0 error:nil];
        GDataXMLElement * rootElement = [root rootElement];
        NSString * rootStr = [rootElement stringValue];
//        NSString * rootJsonStr = [rootStr substringWithRange:NSMakeRange(1, rootStr.length-2)];
//        NSData * rootData = [rootStr  dataUsingEncoding:NSUTF8StringEncoding];
        return rootStr;
    }
}

-(void)cancelDelegate
{
    self.isCancelDelegate = YES;
}


//登录
-(void) loginWithUserName:(NSString *) userName andPassword:(NSString *) password andAutoLogin:(BOOL) autoLogin
{
    NSString *autoLoginString;
    if (autoLogin) {
        autoLoginString = @"true";
    }else{
        autoLoginString = @"false";
    }
    NSString *devdeIdString = [[HNAGeneral getKeychainIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    self.isCancelDelegate = NO;
    if ([HNAGeneral isConnectionAvailable]) {
        NSString *urlStr = [NSString stringWithFormat:@"%@/login/login!loginApp.action?loginName=%@&password=%@&autologin=%@&deviceid=%@&platform=ios",URL_BASE,userName,password,autoLoginString,devdeIdString];
//        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//        request.delegate = self;
//        request.tag = REQUEST_TAG_LOGIN;
//        [request startAsynchronous];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //申明返回的结果是json类型
//        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
//        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        //如果报接受类型不一致请替换一致text/html或别的
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
        [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        
        //增加https验证
        manager.securityPolicy.validatesDomainName = NO;
        
        [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"111");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self.delegate loginDelegate:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"333");
            [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
        }];
    }else{
        [HNAGeneral hidenHUD];
    }
}

//TODO:极光推送
-(void)sendJPushWithType:(NSString *) type andContent:(NSString *) msgContent andAlias:(NSArray *)aliasArray
{
    NSMutableString *aliasString = [NSMutableString stringWithFormat:@"\"alias\":["];
    for (NSString *aliasssString in aliasArray) {
        [aliasString appendFormat:@"\"%@\",",aliasssString];
    }
    NSMutableString *aliaString = [NSMutableString stringWithFormat:@"%@",[aliasString substringWithRange:NSMakeRange(0, aliasString.length - 1)]];
    [aliaString appendFormat:@"]"];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://api.jpush.cn/v3/push"];
    NSString *mbsae64String = [NSString stringWithFormat:@"%@:%@",JPUSHAPPKEY,JPUSHMASTERSECRET];
    NSString *base64 = [GTMBase64 stringByEncodingData:[mbsae64String dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *extras = [NSString stringWithFormat:@"{\"msgContent\":\"%@\",\"msgType\":\"%@\"}",msgContent,type];
    NSString *androids = [NSString stringWithFormat:@"\"android\":{\"alert\":\"%@\",\"title\":\"i宝贝\",\"builder_id\":1,\"extras\":%@},",msgContent,extras];
    NSString *jsonStr = [NSString stringWithFormat:@"{\"platform\":[\"android\",\"ios\"],\"audience\":{%@},\"notification\":{%@\"ios\":{\"alert\":\"%@\",\"extras\":%@,\"badge\":\"1\",\"sound\":\"default\"}},\"options\":{\"sendno\":1740932926,\"apns_production\": false}}",aliaString,androids,msgContent,extras];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request addRequestHeader:@"Authorization" value:[NSString stringWithFormat:@"Basic %@",base64]];
    [request setPostBody:[[NSMutableData alloc] initWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]]];
    request.delegate = self;
    request.tag = JPUSH_TAG;
    [request setRequestMethod:@"POST"];
    [request startAsynchronous];
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    //申明返回的结果是json类型
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    //申明请求的数据是json类型
//    manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    //如果报接受类型不一致请替换一致text/html或别的
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@",base64] forHTTPHeaderField:@"Authorization"];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
//    
//    [manager POST:urlStr parameters:jsonStr progress:^(NSProgress * _Nonnull uploadProgress) {
//         NSLog(@"sss");
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"sss");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//         NSLog(@"sss");
//    }];
//    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"111");
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [self.delegate loginDelegate:responseObject];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"333");
//    }];
}

#pragma mark - 宝宝端接口

//获取宝宝信息手册列表
-(void)downLoadBabyInfomationWith:(NSString *)pageNo
{
    self.isCancelDelegate = NO;
    if ([HNAGeneral isConnectionAvailable]) {
        NSString *urlStr = [NSString stringWithFormat:@"%@/infobook/baby-info-book!listApp.action?pageNo=%@&pageSize=100",URL_BASE,pageNo];
//        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//        request.delegate = self;
//        request.tag = REQUEST_TAG_BABYINFOMATION;
//        [request startAsynchronous];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //申明返回的结果是json类型
        //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
        //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
        //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        //如果报接受类型不一致请替换一致text/html或别的
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
        [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        //增加https验证
        manager.securityPolicy.validatesDomainName = NO;
        
        [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"111");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self.delegate downLoadBabyInfomationDelegate:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"333");
            [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
        }];
    }else{
        [HNAGeneral hidenHUD];
    }
}

//获取幼儿园公告列表
-(void) downLoadKindergartenNoticeWith:(NSString *)pageNo andbabyNoticeTypeId:(long) babyNoticeTypeId
{
    self.isCancelDelegate = NO;
    if ([HNAGeneral isConnectionAvailable]) {
        NSString *urlStr = [NSString stringWithFormat:@"%@/notice/baby-notice!listApp.action?babyNoticeTypeId=%lu&pageNo=%@&pageSize=100",URL_BASE,babyNoticeTypeId,pageNo];
//        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//        request.delegate = self;
//        request.tag = REQUEST_TAG_KINDERGARTENNOTICE;
//        [request startAsynchronous];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //申明返回的结果是json类型
        //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
        //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
        //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        //如果报接受类型不一致请替换一致text/html或别的
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
        [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        //增加https验证
        manager.securityPolicy.validatesDomainName = NO;
        [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"111");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self.delegate downLoadKindergartenNoticeDelegate:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"333");
            [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
        }];
    }else{
        [HNAGeneral hidenHUD];
    }
}

//获取宝宝签到时间列表
-(void) downLoadBabySignInWith:(NSString *) pageNo andBabyID:(NSString *) babyID
{
    self.isCancelDelegate = NO;
    if ([HNAGeneral isConnectionAvailable]) {
        NSString *urlStr;
        if (babyID) {
            NOWTIME;
            urlStr = [NSString stringWithFormat:@"%@/signin/baby-sign-in!listBabyApp.action?pageNo=%@&pageSize=100&babyId=%@&editDate=%@",URL_BASE,pageNo,babyID,nowTime];
        }else{
            urlStr = [NSString stringWithFormat:@"%@/signin/baby-sign-in!listApp.action?pageNo=%@&pageSize=100",URL_BASE,pageNo];
        }
       
//        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//        request.delegate = self;
//        request.tag = REQUEST_TAG_BABYSIGNIN;
//        [request startAsynchronous];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //申明返回的结果是json类型
        //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
        //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
        //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        //如果报接受类型不一致请替换一致text/html或别的
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        //增加https验证
        manager.securityPolicy.validatesDomainName = NO;
        [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"111");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self.delegate downLoadBabySignInDelegate:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"333");
            [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
        }];
    }else{
        [HNAGeneral hidenHUD];
    }
}

//获取每周信息列表
-(void) downLoadWeeklyInfomationWith:(NSString *)everyweekTypeId andPageNo:(NSString *) pageNo
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/everyweek/baby-everyweek!listApp.action?everyweekTypeId=%@&pageNo=%@&pageSize=100",URL_BASE,everyweekTypeId,pageNo];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_WEEKLY;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.delegate downLoadWeeklyInfomationDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//修改密码
-(void) downLoadModifyPasswordWithOldPassword:(NSString *)oldPassword andNewPassword:(NSString *) theNewPassword
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/login/login!updatePasswordApp.action?password=%@&newPassword=%@",URL_BASE,oldPassword,theNewPassword];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_MODIFYPASSWORD;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate downLoadModifyPasswordDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//获取每时每刻信息
-(void) downLoadWondefulMomentWithType:(NSInteger) type//0，学校 1，班级
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *url;
    url = [NSString stringWithFormat:@"%@%@?albumType=%ld&pageNo=1&pageSize=100",URL_BASE,@"/album/baby-photo!listApp.action",(long)type];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_PHOTOLIST;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate downLoadPWonderfulMomentDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

/**
 *  删除服务器的个人相册
 *
 *  @param idsArray 个人照片ID数组
 */
-(void) deleteServePersonalPhotosWithPhotoIdsArray:(NSArray *) idsArray
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSMutableString *urlStr = [NSMutableString stringWithFormat:@"%@/album/baby-photo!delsApp.action?",URL_BASE];
    for (NSString *ids in idsArray) {
        [urlStr appendFormat:@"ids=%@&",ids];
    }
    urlStr = (NSMutableString *)[urlStr substringWithRange:NSMakeRange(0, urlStr.length - 1)];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_DELETEPERSONALPHOTO;
//    [request setRequestMethod:@"POST"];
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate deleteServePersonalPhotosDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

/**
 *  获取指定宝宝的个人相册
 *
 *  @param babyId 宝宝id
 */
-(void) getSpecifyBabyPersonalPhotoWithBabyId:(NSString *) babyId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSMutableString *urlStr;
    if (babyId) {
        urlStr = [NSMutableString stringWithFormat:@"%@/album/baby-album!myAlbumBabyApp.action?babyId=%@",URL_BASE,babyId];
    }else{
        urlStr = [NSMutableString stringWithFormat:@"%@/album/baby-album!myAlbumBabyApp.action",URL_BASE];
    }
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_GETPERSONALPHOTOS;
//    [request setRequestMethod:@"POST"];
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate getSpecifyBabyPersonalPhotoDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//获取校内相册
-(void) getSchoolPhotos
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSMutableString *urlStr = [NSMutableString stringWithFormat:@"%@/album/baby-album!schoolAlbumApp.action",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_GETSCHOOLPHOTOS;
//    [request setRequestMethod:@"POST"];
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate getSchoolPhotosDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//上传照片到校内相册
-(void) addXiaoNeiTuServerWith:(NSString *) photoTitle andPhotoId:(NSString *) photoId andImage:(NSArray *) imageArray andAlbumId:(NSString *) albumId
{
    //    NSString *urlStr;
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/album/baby-photo!saveSchoolAllApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_ADDXIAONEIPHOTOTOSERVE;
    [request setRequestMethod:@"POST"];
    for (UIImage *image in imageArray) {
        NSData *imaData = UIImageJPEGRepresentation(image, 0.5f);
        NSString *imageStr = [GTMBase64 stringByEncodingData:imaData];
        [request addPostValue:imageStr forKey:@"base64Codes"];
    }
    [request setPostValue:@"png" forKey:@"expand"];
    [request setPostValue:photoTitle forKey:@"photoTitle"];
    if (albumId) {
        [request setPostValue:albumId forKey:@"albumId"];
    }
    [request startAsynchronous];
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    //申明返回的结果是json类型
//    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    //申明请求的数据是json类型
//    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    //如果报接受类型不一致请替换一致text/html或别的
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
//    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"111");
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        
//        [self.delegate getSchoolPhotosDelegate:responseObject];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"333");
//    }];
}


//添加/修改照片
-(void) addPhotoTuServerWith:(NSString *) photoTitle andPhotoId:(NSString *) photoId andImage:(NSArray *) imageArray andAlbumId:(NSString *) albumId
{
//    NSString *urlStr;
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/album/baby-photo!saveApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_ADDPHOTO;
    [request setRequestMethod:@"POST"];
    for (UIImage *image in imageArray) {
        NSData *imaData = UIImageJPEGRepresentation(image, 0.5f);
        NSString *imageStr = [GTMBase64 stringByEncodingData:imaData];
        [request addPostValue:imageStr forKey:@"base64Codes"];
    }
    [request setPostValue:@"png" forKey:@"expand"];
    [request setPostValue:photoTitle forKey:@"photoTitle"];
    if (albumId) {
        [request setPostValue:albumId forKey:@"albumId"];
    }
    [request startAsynchronous];
}

/**
 *  发送相片到个人相册或校内相册
 *
 *  @param photoTitle 图片标题
 *  @param photoId    图片ID
 *  @param imageArray 相片数组
 *  @param albumId    相册ID
 */
-(void) sendPersonalPhotosTuServerWith:(NSString *) photoTitle andPhotoId:(NSString *) photoId andImage:(NSArray *) imageArray andAlbumId:(NSString *) albumId
{
    //    NSString *urlStr;
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/album/baby-photo!saveAllApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_SENDPERSONALPHOTOTOSERVE;
    [request setRequestMethod:@"POST"];
    for (UIImage *image in imageArray) {
        NSData *imaData = UIImageJPEGRepresentation(image, 0.5f);
        NSString *imageStr = [GTMBase64 stringByEncodingData:imaData];
        [request addPostValue:imageStr forKey:@"base64Codes"];
    }
    [request setPostValue:@"png" forKey:@"expand"];
    [request setPostValue:photoTitle forKey:@"photoTitle"];
    if (albumId) {
        [request setPostValue:albumId forKey:@"babyId"];
    }
    [request startAsynchronous];
}

//亲子频道
-(void) downLoadFoundWithType:(NSInteger) type
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *url;
    url = [NSString stringWithFormat:@"%@%@",URL_BASE,@"/notice/baby-notice!listApp.action?babyNoticeTypeId=4&pageNo=1&pageSize=100"];
//    switch (type) {
//        case 1:
//        {
//            url = [NSString stringWithFormat:@"%@%@",URL_BASE,@"/lovechannel/baby-love-channel!listApp.action"];
//        }
//            break;
//        case 2:
//        {
//            url = [NSString stringWithFormat:@"%@%@",URL_BASE,@"/lovechannel/baby-love-channel!listTeacherApp.action"];
//        }
//            break;
//        case 3:
//        {
//            url = [NSString stringWithFormat:@"%@%@",URL_BASE,@"/lovechannel/baby-love-channel!listSchoolUserApp.action"];
//        }
//            break;
//            
//        default:
//            break;
//    }
    
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_FOUND;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate downLoadFoundDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}
//获取聊天信息
-(void) downLoadChatMessage:(NSString *) receiveUser andType:(NSString *) msgState
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!listApp.action?msgState=%@&pageNo=1&pageSize=1000",URL_BASE,msgState];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_MESSAGELIST;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate downLoadChatMessageDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}
//获取未读聊天信息
-(void) downLoadUnReadMessage
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!getNoReadMsgApp.action",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_UNREADMESSAGELIST;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate downLoadUnReadMessageDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}
//发送聊天信息
-(void) baySendChatMesageWithContent:(NSString *) messageContent andSouundFile:(NSData *) soundData andReceiverID:(NSString *) receiverID andMsgType:(NSString *) msgType
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!saveMsgApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_BABYSENDCHATMESSAGE;
    if (soundData != nil) {
        NSString *soundStr = [GTMBase64 stringByEncodingData:soundData];
        [request addPostValue:soundStr forKey:@"base64Code"];
        [request setPostValue:@"mp3" forKey:@"expand"];;
    }
    [request setPostValue:msgType forKey:@"msgType"];
    [request setPostValue:messageContent forKey:@"msgContent"];
    [request setPostValue:receiverID forKey:@"receiveUserId"];
    [request startAsynchronous];
}

//获取群聊信息
-(void) babyGetQunLiaoMessage
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!listMsgGroupApp.action?pageNo=1&pageSize=1000",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_BABYQUNLIAO;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate downLoadBabyGetQunliaoMessageDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//宝宝端发送群聊消息
-(void)babySendQunLiaoMessageWithmessage:(NSString *) message andSoundFile:(NSData *) soundData
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!sendMsgGroupByBabyApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_BABYSENDQUNLIAOMESAAGE;
    if (soundData != nil) {
        NSString *soundStr = [GTMBase64 stringByEncodingData:soundData];
        [request addPostValue:soundStr forKey:@"base64Code"];
        [request setPostValue:@"mp3" forKey:@"expand"];
    }
    [request setPostValue:message forKey:@"msgContent"];
    [request startAsynchronous];
}

//用户反馈
-(void) sendFeedbackToServeWithContent:(NSString *) feedBackContent
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/feedback/baby-feedback!saveApp.action?feedbackContent=%@",URL_BASE,[feedBackContent stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_USERFEEDBACK;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate sendFeedbackToServeDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//修改头像
-(void) changeHeaderImageWith:(UIImage *) headerImage
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/account/user!upLoadImgApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_CHANEHEADERIMAG;
    [request setRequestMethod:@"POST"];
    NSData *imaData = UIImageJPEGRepresentation(headerImage, 0.5f);
    NSString *imageStr = [GTMBase64 stringByEncodingData:imaData];
    [request setPostValue:imageStr forKey:@"base64Code"];
    [request setPostValue:@"png" forKey:@"expand"];
    [request startAsynchronous];
}

//获取摄像头信息
-(void) getCamearIDWithClassID:(NSNumber *) classId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/classes/baby-camera!listApp.action?classId=%d",URL_BASE,[classId intValue]];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_GETCAMERAINFOMATION;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate getCamearIDDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//第一次获取rtsp地址
-(void) getFirstRtsp:(NSString *) nonce andUserName:(NSString *) userName andPassword:(NSString *) password andCameraID:(NSString *) cameraId
{
//    NSString *nonce = nil;
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    self.password = password;
    self.userName = userName;
    self.cameraID = cameraId;
//    NSString *host = @"cs.test";
    NSString *host = [[userName componentsSeparatedByString:@"@"] objectAtIndex:1];
    NSString *url = @"http://111.47.111.168:8340/nvswsu/httpAction";
    NSString *username = [NSString stringWithFormat:@"%@",userName];//@"hwtest1@cs.test";
    NSString *passwd= password;//@"Huawei123";
   
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    request.delegate = self;
    NSString *postSoapMessage = [NSString stringWithFormat:
                                 @"<?xml version=\"1.0\" encoding=\"UTF-8\" ?><MESSAGE Version=\"1.0\"><CV_HEADER MsgType=\"MSG_GET_SC_INFO_REQ\" MsgSeq=\"12345678\" /> <SC_ID>%@</SC_ID><SC_TYPE>1</SC_TYPE></MESSAGE>",userName];
//    NSString *postSoapMessage = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\" ?><MESSAGE Version=\"1.0\"><CV_HEADER MsgType=\"MSG_GET_VCU_LIST_REQ\" MsgSeq=\"12345678\" /><USER_PROFILE ScId=\"001300000000021\"  StampTime=\"20140925095011500\"  GetProfileFlag=\"1\"  SCType=\"1\"  /></MESSAGE>"];
    NSLog(@"------------%@,%@,%@,%@",userName,password,cameraId,postSoapMessage);
    NSMutableData *poData = [NSMutableData dataWithData:[postSoapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Content-Type" value:@"Applicaiton/xml; charset=UTF-8"];
    [request setPostBody:poData];
//    [request appendPostData:[postSoapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    if (nonce != nil) {
         NSMutableString *postValue = [self getAuth:host and:nonce and:username and:url and:passwd];
        NSLog(@"=====%@",postValue);
        [request addRequestHeader:@"Authorization" value:postValue];
    }
    request.tag = FIRSTAUTH_RTSP;
    [request startAsynchronous];
}

-(void) getSecondRtsp:(NSString *) nextnonce
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
//    NSString *host = @"cs.test";
    NSString *host = [[_userName componentsSeparatedByString:@"@"] objectAtIndex:1];
    NSString *url = @"http://111.47.111.168:8340/nvswsu/httpAction";
    NSString *username = [NSString stringWithFormat:@"%@",self.userName];//@"hwtest1@cs.test";
    NSString *passwd=self.password;//@"Huawei123";
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    request.delegate = self;
    NSString *postSoapMessage = [NSString stringWithFormat:
                                 @"<?xml version=\"1.0\" encoding=\"UTF-8\" ?><MESSAGE Version=\"1.0\"><CV_HEADER MsgType=\"MSG_VCU_LIVE_REQ\" MsgSeq=\"1\" /> <CHANNEL CameraId=\"%@\" StreamID=\"1\" StreamType=\"1\" UrlType=\"1\" TranscodingFlag=\"true\" /></MESSAGE>",self.cameraID];
    NSMutableData *poData = [NSMutableData dataWithData:[postSoapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Content-Type" value:@"Applicaiton/xml; charset=UTF-8"];
    [request setPostBody:poData];
    NSMutableString *postValue = [self getAuth:host and:nextnonce and:username and:url and:passwd];
    [request addRequestHeader:@"Authorization" value:postValue];
    request.tag = SECONDREQUEST_RTSP;
    [request startAsynchronous];
}

-(NSMutableString *) getAuth:(NSString *) host and:(NSString *) nonce and:(NSString *)username and:(NSString *) url and:(NSString *) passwd
{
    NSMutableString *postValue = [[NSMutableString alloc] initWithString:@""];
    [postValue appendString:@" Digest realm=\""];
    [postValue appendFormat:@"%@",host];
    [postValue appendString:@"\", nonce=\""];
    [postValue appendFormat:@"%@",nonce];
    [postValue appendString:@"\", username=\""];
    [postValue appendFormat:@"%@",username];
    [postValue appendString:@"\", qop=auth,uri=\""];
    [postValue appendFormat:@"%@",url];
    [postValue appendString:@"\",response=\""];
    NSString *counce = @"99999999901";
    NSString *nc = @"00000005";
    NSString *a1 = [HNAGeneral md5:[NSString stringWithFormat:@"%@:%@:%@",username,host,passwd]];
    NSString *a2 = [HNAGeneral md5:[NSString stringWithFormat:@"POST:%@",url]];
    NSString *response = [HNAGeneral md5:[NSString stringWithFormat:@"%@:%@:%@:%@:auth:%@",a1,nonce,nc,counce,a2]];
    [postValue appendFormat:@"%@",response];
    [postValue appendString:@"\", cnonce=\""];
    [postValue appendFormat:@"%@",counce];
    [postValue appendString:@"\",  nc="];
    [postValue appendFormat:@"%@",nc];
    [postValue appendString:@",  algorithm=\"MD5\""];
    return postValue;
}

//获取摄像头列表
-(void) requestToGetCameraListWithClassId:(NSNumber *) classId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
//    NSString *urlStr = [NSString stringWithFormat:@"%@/camera/baby-camera-dazhong!listApp.action?classId=%d",URL_BASE,[classId intValue]];
    NSString *urlStr = [NSString stringWithFormat:@"%@/camera/baby-camera-dazhong!listApp.action",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_GETCAMERALIST;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate requestToGetCameraListDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}


//挂失考勤卡
-(void) reportCard
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/account/user!updateCardStatus.action?cardStatus=3",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_REPORTCARD;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate reportCardDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

#pragma mark - 教师端接口
//首页
-(void) downLoadTeacherHomePage
{
    [HNAGeneral showOnWindow:@"加载中"];
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/login/login!teacherIndexApp.action",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERHOMEPAGE;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate downLoadTeacherHomePageDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//根据宝宝ID获取包包信息手册
-(void) getBabyHandBookFromBabyID:(NSString *) babyId andEditDate:(NSString *) editDate
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/infobook/baby-info-book!listTeachApp.action?babyId=%@&editDate=%@",URL_BASE,babyId,editDate];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_GETBABYHANDBOOK;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate getBabyHandBookDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//发布宝宝信息手册接口
-(void) sendBabyHandWithBookID:(NSString *) bookId andBookTitle:(NSString *)bookTitle andBookContent:(NSString *) bookContent andBabyId:(NSString *) babyId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = nil;
    if (bookId == nil || [bookId isEqualToString:@""]) {
        urlStr = [[NSString stringWithFormat:@"%@/infobook/baby-info-book!saveInfoBookApp.action?bookTitle=%@&bookContent=%@&babyId=%@",URL_BASE,bookTitle,bookContent,babyId] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else{
        urlStr = [[NSString stringWithFormat:@"%@/infobook/baby-info-book!saveInfoBookApp.action?bookTitle=%@&bookContent=%@&babyId=%@&id=%@",URL_BASE,bookTitle,bookContent,babyId,bookId] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_SENDBABYHANDBOOK;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate sendBabyHandDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//发送宝宝信息手册接口
-(void) sendHandBookByID:(NSString *) bookId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/infobook/baby-info-book!sendInfoBookApp.action?id=%@",URL_BASE,bookId];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_SENDHANDBOOKBYID;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate sendHandBookByIDDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//删除宝宝信息手册接口
-(void) deleteHandBookByID:(NSString *) bookId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/infobook/baby-info-book!delInfoBookApp.action?id=%@",URL_BASE,bookId];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_DELETEHANDBOOK;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate deleteHandBookDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//发布宝宝入园离园信息
-(void) sendBabyStateWithID:(NSString *) babyId andState:(NSString *) state
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/signin/baby-sign-in!saveSignInApp.action?babyId=%@&inOut=%@",URL_BASE,babyId,state];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_SENDBABYSTATE;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate sendBabyStateDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//获取所有宝贝消息列表
-(void) teacherGetMessageListWithMsgType:(NSString *) msgType
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!listMsgUserApp.action?msgType=%@",URL_BASE,msgType];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_GETALLBABYMESSAGELIST;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherGetBabyMessageListDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//教师端发送群聊消息
-(void)teacherSendQunLiaoMessageWithmessage:(NSString *) message andSoundFile:(NSData *) soundData
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!sendMsgGroupByTeacherApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_TEACHERQUNLIAOMESSAGE;
    if (soundData != nil) {
        NSString *soundStr = [GTMBase64 stringByEncodingData:soundData];
        [request addPostValue:soundStr forKey:@"base64Code"];
        [request setPostValue:@"mp3" forKey:@"expand"];
    }
    [request setPostValue:message forKey:@"msgContent"];
    [request startAsynchronous];
}

/**
 *  教师端发送教师群聊
 *
 *  @param message   群聊文字内容
 *  @param soundData 群聊音频文件
 */
-(void)teacherSendTeacherQunLiaoMessageWithmessage:(NSString *) message andSoundFile:(NSData *) soundData
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!sendTeacherMsgGroupApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_TEACHERSENDTEACHERQUNLIAOMESSAGE;
    if (soundData != nil) {
        NSString *soundStr = [GTMBase64 stringByEncodingData:soundData];
        [request addPostValue:soundStr forKey:@"base64Code"];
        [request setPostValue:@"mp3" forKey:@"expand"];
    }
    [request setPostValue:message forKey:@"msgContent"];
    [request startAsynchronous];
}

/**
 *  教师端获取教师群聊消息
 */
-(void) teacherGetTeacherQunLiaoMessage
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!listTeacherMsgGroupApp.action?pageNo=1&pageSize=1000",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERGETTEACHERQUNLIAOMESSAGE;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherGetTeacherQunLiaoMessageDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//根据宝宝ID获取对话消息
-(void)teacherGetMessageByBabyID:(NSString *) roleID andMsgType:(NSString *) msgType
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/msg/baby-msg!listMsgRelApp.action?relId=%@&msgType=%@&pageNo=1&pageSize=1000",URL_BASE,roleID,msgType];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERGETIDBABYMESSAGE;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherGetMessageByBabyIDDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//获取所在班级所有宝宝
-(void)teacherGetAllBaby
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/classes/baby-class!listClassUserBayTeacher.action",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERALLBABYLIST;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherGetAllBabyDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

/**
 *  获取所有老师列表
 */
-(void)teacherGetAllTeacher
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/classes/baby-class!listSchoolUserBayTeacher.action",URL_BASE];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERGETTEACHERLIST;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherGetAllTeacherDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//教师端获取园内公告
-(void) teacherGetKindergartenNoticeWithBabyNoticeTypeID:(long) babyNoticeTypeId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/notice/baby-notice!listTeacherApp.action?babyNoticeTypeId=%lu",URL_BASE,babyNoticeTypeId];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERGETKINDERNOTICE;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherGetKindergartenNoticeDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//教师端保存或修改园内公告
-(void) teacherSaveKindergartenNoticeWithID:(long) ids andNoticeTitle:(NSString *) noticeTitle andNoticeContent:(NSString *) noticeContent andBabyNoticeTypeId:(long) babyNoticeTypeId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = nil;
    if (ids == -1) {
        urlStr = [NSString stringWithFormat:@"%@/notice/baby-notice!saveTeacherApp.action?noticeTitle=%@&noticeContent=%@&babyNoticeTypeId=%lu",URL_BASE,noticeTitle,noticeContent,babyNoticeTypeId];
    }else{
        urlStr = [NSString stringWithFormat:@"%@/notice/baby-notice!saveTeacherApp.action?id=%lu&noticeTitle=%@&noticeContent=%@&babyNoticeTypeId=%lu",URL_BASE,ids,noticeTitle,noticeContent,babyNoticeTypeId];
    }
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERSAVEKONDERNOTICE;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherSaveKindergartenNoticeDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//教师端回去每周活动
-(void) teacherGetWeekInfomationListWithEveryweekTypeId:(long) everyweekTypeId
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/everyweek/baby-everyweek!listTeacherApp.action?everyweekTypeId=%lu",URL_BASE,everyweekTypeId];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERGETWEEKACTIVELIST;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherGetWeekInfomationListDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//教师端保存食谱
-(void) teacherSaveWeekFoodWithActivityTitle:(NSString *) activityTitle andActivityContent:(NSString *) activityContent andMealType:(NSString *) mealType andActivityDate:(NSString *) activityDate andImageArray:(NSArray *) imageArray
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/everyweek/baby-everyweek!saveTeacherApp.action",URL_BASE];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    request.tag = REQUEST_TAG_TEACHERSAVEWEEKFOOD;
    if (imageArray.count != 0) {
        for (UIImage *image in imageArray) {
            NSData *imaData = UIImageJPEGRepresentation(image, 0.5f);
            NSString *imageStr = [GTMBase64 stringByEncodingData:imaData];
            [request addPostValue:imageStr forKey:@"base64Codes"];
        }
    }
    [request setPostValue:@"png" forKey:@"expand"];
    [request setPostValue:activityTitle forKey:@"activityTitle"];
    [request setPostValue:activityContent forKey:@"activityContent"];
    [request setPostValue:mealType forKey:@"mealType"];
    [request setPostValue:activityDate forKey:@"activityDate"];
    [request setPostValue:[NSNumber numberWithLong:2] forKey:@"everyweekTypeId"];
    [request startAsynchronous];
}

//教师端保存每周活动
-(void) teacherSaveWeekActivityWithActivityTitle:(NSString *) activityTitle andActivityContent:(NSString *) activityContent andActivityDate:(NSString *) activityDate andActivityTime:(NSString *) activityTime
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/everyweek/baby-everyweek!saveTeacherApp.action?everyweekTypeId=1&activityTitle=%@&activityContent=%@&activityDate=%@&activityTime=%@",URL_BASE,activityTitle,activityContent,activityDate,activityTime];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_TEACHERSAVEWEEKACTIVE;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherSaveWeekActivityDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

//教师端修改自己的姓名
-(void) teacherModifyNameWithNameText:(NSString *) textName
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@/account/user!updateName.action?name=%@",URL_BASE,textName];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_MODIFYNAME;
//    [request startAsynchronous];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self.delegate teacherModifyNameWithNameTextDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

/**
 *  批量签到
 *
 *  @param inOut       签到状态
 *  @param babyIdarray 宝宝ID数组
 */
-(void) piLiangQiandaoWithState:(NSString *) inOut andBabyIdArray:(NSArray *) babyIdarray
{
    self.isCancelDelegate = NO;
    if (![HNAGeneral isConnectionAvailable]) {
        [HNAGeneral hidenHUD];
        return;
    }
    NSMutableString *idsString = [NSMutableString string];
    for (NSNumber *babyId in babyIdarray) {
        [idsString appendFormat:@"babyIds=%@&",babyId];
    }
    idsString = (NSMutableString *)[idsString substringWithRange:NSMakeRange(0, idsString.length - 1)];
    NSString *urlStr = [NSString stringWithFormat:@"%@/signin/baby-sign-in!saveSignInsApp.action?%@&inOut=%@",URL_BASE,idsString,inOut];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//    request.delegate = self;
//    request.tag = REQUEST_TAG_PILIANGQIANDAO;
//    [request startAsynchronous];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    //        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    //        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    //增加https验证
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"111");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        [self.delegate piLiangQiandaoDelegate:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"333");
        [HNAGeneral showTipTextOnWindow:@"获取数据失败！"];
    }];
}

#pragma mark - 返回结果
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog( @"----------------------\n%@",request.responseString);
    if (!self.isCancelDelegate) {
        if (request.tag == JPUSH_TAG) {
            
        }
        if (request.tag == FIRSTAUTH_RTSP) {
            NSString *ai = [request.responseHeaders valueForKey:@"Authentication-Info"];
            NSArray *air = [ai componentsSeparatedByString:@"="];
            NSString *nextnonce = [air objectAtIndex:2];
            [self getSecondRtsp:nextnonce];
        }
        if (request.tag == SECONDREQUEST_RTSP) {
            NSString * rtspStr = [self gainJSONStringFromRequest:request];
            [self.delegate getRtspDelegate:rtspStr];
        }
        NSDictionary * rootDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
        if (rootDic == nil) {
            [HNAGeneral hidenHUD];
            if (request.tag != FIRSTAUTH_RTSP && request.tag != SECONDREQUEST_RTSP) {
//                [HNAGeneral showAlertViewWithTitle:nil andMessage:@"服务器内部发生错误"];
                [HNAGeneral showTipTextOnWindow:@"服务器内部发生错误！"];
            }
            
        }
        NSDictionary *dataMap = [rootDic valueForKey:@"dataMap"];
        if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
            if ([[dataMap valueForKey:@"stateMsg"] isEqualToString:@"用户未登录"]) {
//                [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
                [HNAGeneral showTipTextOnWindow:[dataMap valueForKey:@"stateMsg"]];
                kqAppDelegate *appdelegate = (kqAppDelegate *)[UIApplication sharedApplication].delegate;
                kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
                loginVC.delegate = appdelegate;
                appdelegate.window.rootViewController = loginVC;
                [loginVC setRemeber:NO andShow:NO];
                NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                NSDictionary *userInfo = [ud objectForKey:@"login"];
                if (userInfo != nil) {
                    NSString *userName = [userInfo valueForKey:@"userName"];
                    NSString *password = [userInfo valueForKey:@"password"];
                    loginVC.userNameTextField.text = userName;
                    loginVC.passwordTextField.text = password;
                    NSNumber *isRemeber = [userInfo valueForKey:@"remeber"];
                    NSNumber *isShow = [userInfo valueForKey:@"show"];
                    [loginVC setRemeber:[isRemeber boolValue] andShow:[isShow boolValue]];
                }
            }
        }

        //登录
        if (request.tag == REQUEST_TAG_LOGIN) {
            if ([self.delegate respondsToSelector:@selector(loginDelegate:)]) {
                [self.delegate loginDelegate:rootDic];
            }
        }
        if (REQUEST_TAG_GETCAMERAINFOMATION == request.tag) {
            if ([self.delegate respondsToSelector:@selector(getCamearIDDelegate:)]) {
                [self.delegate getCamearIDDelegate:rootDic];
            }
        }
#pragma mark - 宝宝端接口
        //获取宝宝信息手册
        if (request.tag == REQUEST_TAG_BABYINFOMATION) {
            if ([self.delegate respondsToSelector:@selector(downLoadBabyInfomationDelegate:)]) {
                [self.delegate downLoadBabyInfomationDelegate:rootDic];
            }
        }
        //获取幼儿园公告列表
        if (request.tag == REQUEST_TAG_KINDERGARTENNOTICE) {
            if ([self.delegate respondsToSelector:@selector(downLoadKindergartenNoticeDelegate:)]) {
                [self.delegate downLoadKindergartenNoticeDelegate:rootDic];
            }
        }
        //获取宝宝签到时间列表
        if (request.tag == REQUEST_TAG_BABYSIGNIN) {
            if ([self.delegate respondsToSelector:@selector(downLoadBabySignInDelegate:)]) {
                [self.delegate downLoadBabySignInDelegate:rootDic];
            }
        }
        //获取每周信息列表
        if (request.tag == REQUEST_TAG_WEEKLY) {
            if ([self.delegate respondsToSelector:@selector(downLoadWeeklyInfomationDelegate:)]) {
                [self.delegate downLoadWeeklyInfomationDelegate:rootDic];
            }
        }
        //修改密码
        if (request.tag == REQUEST_TAG_MODIFYPASSWORD) {
            if ([self.delegate respondsToSelector:@selector(downLoadModifyPasswordDelegate:)]) {
                [self.delegate downLoadModifyPasswordDelegate:rootDic];
            }
        }
        //获取每时每刻信息
        if (REQUEST_TAG_PHOTOLIST == request.tag) {
            if ([self.delegate respondsToSelector:@selector(downLoadPWonderfulMomentDelegate:)]) {
                [self.delegate downLoadPWonderfulMomentDelegate:rootDic];
            }
        }
        //添加修改照片
        if (REQUEST_TAG_ADDPHOTO == request.tag) {
            if ([self.delegate respondsToSelector:@selector(addPhotoDelegate:)]) {
                [self.delegate addPhotoDelegate:rootDic];
            }
        }
        //亲子频道
        if (REQUEST_TAG_FOUND == request.tag) {
            if ([self.delegate respondsToSelector:@selector(downLoadFoundDelegate:)]) {
                [self.delegate downLoadFoundDelegate:rootDic];
            }
        }
        //获取消息
        if (REQUEST_TAG_MESSAGELIST == request.tag) {
            if ([self.delegate respondsToSelector:@selector(downLoadChatMessageDelegate:)]) {
                [self.delegate downLoadChatMessageDelegate:rootDic];
            }
        }
        //获取未读消息
        if (REQUEST_TAG_UNREADMESSAGELIST == request.tag) {
            if ([self.delegate respondsToSelector:@selector(downLoadUnReadMessageDelegate:)]) {
                [self.delegate downLoadUnReadMessageDelegate:rootDic];
            }
        }
        //发送消息
        if (REQUEST_TAG_BABYSENDCHATMESSAGE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(downLoadBabySendMessageDelegate:)]) {
                [self.delegate downLoadBabySendMessageDelegate:rootDic];
            }
        }
        //获取群聊消息
        if (REQUEST_TAG_BABYQUNLIAO == request.tag) {
            if ([self.delegate respondsToSelector:@selector(downLoadBabyGetQunliaoMessageDelegate:)]) {
                [self.delegate downLoadBabyGetQunliaoMessageDelegate:rootDic];
            }
        }
        //宝宝端发送群聊消息
        if (REQUEST_TAG_BABYSENDQUNLIAOMESAAGE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(downLoadBabySendQunLiaoMessage:)]) {
                [self.delegate downLoadBabySendQunLiaoMessage:rootDic];
            }
        }
        //用户反馈
        if (REQUEST_TAG_USERFEEDBACK == request.tag) {
            if ([self.delegate respondsToSelector:@selector(sendFeedbackToServeDelegate:)]) {
                [self.delegate sendFeedbackToServeDelegate:rootDic];
            }
        }
        //修改头像
        if (REQUEST_TAG_CHANEHEADERIMAG == request.tag) {
            if ([self.delegate respondsToSelector:@selector(changeHeaderImageDelegate:)]) {
                [self.delegate changeHeaderImageDelegate:rootDic];
            }
        }
        //获取摄像头列表
        if (REQUEST_TAG_GETCAMERALIST == request.tag) {
            if ([self.delegate respondsToSelector:@selector(requestToGetCameraListDelegate:)]) {
                [self.delegate requestToGetCameraListDelegate:rootDic];
            }
        }
        //挂失考勤卡
        if (REQUEST_TAG_REPORTCARD == request.tag) {
            if ([self.delegate respondsToSelector:@selector(reportCardDelegate:)]) {
                [self.delegate reportCardDelegate:rootDic];
            }
        }
#pragma mark - 教师端接口
        //首页
        if (REQUEST_TAG_TEACHERHOMEPAGE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(downLoadTeacherHomePageDelegate:)]) {
                [self.delegate downLoadTeacherHomePageDelegate:rootDic];
            }
        }
        //根据宝宝ID回去宝宝信息手册
        if (REQUEST_TAG_GETBABYHANDBOOK == request.tag) {
            if ([self.delegate respondsToSelector:@selector(getBabyHandBookDelegate:)]) {
                [self.delegate getBabyHandBookDelegate:rootDic];
            }
        }
        //发布宝宝信息手册
        if (REQUEST_TAG_SENDBABYHANDBOOK == request.tag) {
            if ([self.delegate respondsToSelector:@selector(sendBabyHandDelegate:)]) {
                [self.delegate sendBabyHandDelegate:rootDic];
            }
        }
        //发送宝宝信息手册
        if (REQUEST_TAG_SENDHANDBOOKBYID == request.tag) {
            if ([self.delegate respondsToSelector:@selector(sendHandBookByIDDelegate:)]) {
                [self.delegate sendHandBookByIDDelegate:rootDic];
            }
        }
        //删除宝宝信息手册
        if (REQUEST_TAG_DELETEHANDBOOK == request.tag) {
            if ([self.delegate respondsToSelector:@selector(deleteHandBookDelegate:)]) {
                [self.delegate deleteHandBookDelegate:rootDic];
            }
        }
        //发布宝宝入园离园状态
        if (REQUEST_TAG_SENDBABYSTATE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(sendBabyStateDelegate:)]) {
                [self.delegate sendBabyStateDelegate:rootDic];
            }
        }
        //获取与所有宝贝消息列表
        if (REQUEST_TAG_GETALLBABYMESSAGELIST == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherGetBabyMessageListDelegate:)]) {
                [self.delegate teacherGetBabyMessageListDelegate:rootDic];
            }
        }
        //教师端发送群聊消息
        if (REQUEST_TAG_TEACHERQUNLIAOMESSAGE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherSendQunLiaoMessageWithmessageDelegate:)]) {
                [self.delegate teacherSendQunLiaoMessageWithmessageDelegate:rootDic];
            }
        }
        //教师端根据宝宝ID获取消息
        if (REQUEST_TAG_TEACHERGETIDBABYMESSAGE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherGetMessageByBabyIDDelegate:)]) {
                [self.delegate teacherGetMessageByBabyIDDelegate:rootDic];
            }
        }
        //教师端获取所有宝宝
        if (REQUEST_TAG_TEACHERALLBABYLIST == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherGetAllBabyDelegate:)]) {
                [self.delegate teacherGetAllBabyDelegate:rootDic];
            }
        }
        //教师端获取园内公告
        if (REQUEST_TAG_TEACHERGETKINDERNOTICE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherGetKindergartenNoticeDelegate:)]) {
                [self.delegate teacherGetKindergartenNoticeDelegate:rootDic];
            }
        }
        //教师端保存修改园内公告
        if (REQUEST_TAG_TEACHERSAVEKONDERNOTICE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherSaveKindergartenNoticeDelegate:)]) {
                [self.delegate teacherSaveKindergartenNoticeDelegate:rootDic];
            }
        }
        //教师端获取每周活动列表
        if (REQUEST_TAG_TEACHERGETWEEKACTIVELIST == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherGetWeekInfomationListDelegate:)]) {
                [self.delegate teacherGetWeekInfomationListDelegate:rootDic];
            }
        }
        //教师端保存食谱
        if (request.tag == REQUEST_TAG_TEACHERSAVEWEEKFOOD) {
            if ([self.delegate respondsToSelector:@selector(teacherSaveWeekFoodDelegate:)]) {
                [self.delegate teacherSaveWeekFoodDelegate:rootDic];
            }
        }
        //教师端保存每周活动
        if (REQUEST_TAG_TEACHERSAVEWEEKACTIVE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherSaveWeekActivityDelegate:)]) {
                [self.delegate teacherSaveWeekActivityDelegate:rootDic];
            }
        }
        //教师端修改自己的名字
        if (REQUEST_TAG_MODIFYNAME == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherModifyNameWithNameTextDelegate:)]) {
                [self.delegate teacherModifyNameWithNameTextDelegate:rootDic];
            }
        }
        //教师端发送教师群聊消息
        if (REQUEST_TAG_TEACHERSENDTEACHERQUNLIAOMESSAGE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherSendTeacherQunLiaoMessageDelegate:)]) {
                [self.delegate teacherSendTeacherQunLiaoMessageDelegate:rootDic];
            }
        }
        //教师端接收教师群聊消息
        if (REQUEST_TAG_TEACHERGETTEACHERQUNLIAOMESSAGE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherGetTeacherQunLiaoMessageDelegate:)]) {
                [self.delegate teacherGetTeacherQunLiaoMessageDelegate:rootDic];
            }
        }
        //教师端获取教师列表
        if (REQUEST_TAG_TEACHERGETTEACHERLIST == request.tag) {
            if ([self.delegate respondsToSelector:@selector(teacherGetAllTeacherDelegate:)]) {
                [self.delegate teacherGetAllTeacherDelegate:rootDic];
            }
        }
        //删除个人相册
        if (REQUEST_TAG_DELETEPERSONALPHOTO == request.tag) {
            if ([self.delegate respondsToSelector:@selector(deleteServePersonalPhotosDelegate:)]) {
                [self.delegate deleteServePersonalPhotosDelegate:rootDic];
            }
        }
        //获取指定宝宝的个人相册
        if (REQUEST_TAG_GETPERSONALPHOTOS == request.tag) {
            if ([self.delegate respondsToSelector:@selector(getSpecifyBabyPersonalPhotoDelegate:)]) {
                [self.delegate getSpecifyBabyPersonalPhotoDelegate:rootDic];
            }
        }
        //获取校内相册
        if (REQUEST_TAG_GETSCHOOLPHOTOS == request.tag) {
            if ([self.delegate respondsToSelector:@selector(getSchoolPhotosDelegate:)]) {
                [self.delegate getSchoolPhotosDelegate:rootDic];
            }
        }
        //上传相片到个人相册
        if (REQUEST_TAG_SENDPERSONALPHOTOTOSERVE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(sendPersonalPhotosTuServerDelegate:)]) {
                [self.delegate sendPersonalPhotosTuServerDelegate:rootDic];
            }
        }
        //上传到校内相册
        if (REQUEST_TAG_ADDXIAONEIPHOTOTOSERVE == request.tag) {
            if ([self.delegate respondsToSelector:@selector(addXiaoNeiTuServerDelegate:)]) {
                [self.delegate addXiaoNeiTuServerDelegate:rootDic];
            }
        }
        //批量签到
        if (REQUEST_TAG_PILIANGQIANDAO == request.tag) {
            if ([self.delegate respondsToSelector:@selector(piLiangQiandaoDelegate:)]) {
                [self.delegate piLiangQiandaoDelegate:rootDic];
            }
        }
    }
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    
    NSLog(@"-------------%@",request.error.userInfo);
    NSString *errorReason = [request.error.userInfo valueForKey:@"NSLocalizedDescription"];
    NSError *underlyingError = [request.error.userInfo valueForKey:@"NSUnderlyingError"];
    NSLog(@"-------------%@",[underlyingError description]);
    if ([errorReason isEqualToString:@"The request timed out"]) {
        [HNAGeneral hidenHUD];
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"连接超时！"];
        [HNAGeneral showTipTextOnWindow:@"连接超时！"];
        return;
    }
    if ([errorReason isEqualToString:@"A connection failure occurred"]) {
        [HNAGeneral hidenHUD];
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"发生连接故障！"];
        [HNAGeneral showTipTextOnWindow:@"发生连接故障！"];
        return;
    }
    if (request.tag == FIRSTAUTH_RTSP) {
        if (request.responseStatusCode == 401) {
            NSString *ww = [request.responseHeaders valueForKey:@"Www-Authenticate"];
            NSArray *arr = [ww componentsSeparatedByString:@"\""];
            NSString *nonce = [arr objectAtIndex:3];
            [self getFirstRtsp:nonce andUserName:self.userName andPassword:self.password andCameraID:self.cameraID];
            return;
        }
    }
    [HNAGeneral hidenHUD];
    //登录
    if (REQUEST_TAG_LOGIN == request.tag) {
        NSLog(@"-------------%@",request.responseString);
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"登录失败"];
        [HNAGeneral showTipTextOnWindow:@"登录失败！"];
        return;
    }
    //获取宝宝信息手册
    if (request.tag == REQUEST_TAG_BABYINFOMATION) {
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"获取宝宝信息手册失败"];
        [HNAGeneral showTipTextOnWindow:@"获取宝宝信息手册失败！"];
        return;
    }
    //获取幼儿园公告列表
    if (request.tag == REQUEST_TAG_KINDERGARTENNOTICE) {
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"获取幼儿园公告列表失败"];
        [HNAGeneral showTipTextOnWindow:@"获取幼儿园公告列表失败！"];
        return;
    }
    //获取宝宝签到时间列表
    if (request.tag == REQUEST_TAG_BABYSIGNIN) {
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"获取宝宝签到时间列表失败"];
        [HNAGeneral showTipTextOnWindow:@"获取宝宝签到时间列表失败！"];
        return;
    }
    //获取每周信息列表
    if (request.tag == REQUEST_TAG_BABYSIGNIN) {
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"获取列表失败"];
        [HNAGeneral showTipTextOnWindow:@"获取列表失败！"];
        return;
    }
    //修改密码
    if (request.tag == REQUEST_TAG_MODIFYPASSWORD) {
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请求修改密码失败"];
        [HNAGeneral showTipTextOnWindow:@"请求修改密码失败！"];
        return;
    }
    if (request.tag != FIRSTAUTH_RTSP && request.tag != SECONDREQUEST_RTSP) {
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"服务器内部发生错误"];
        [HNAGeneral showTipTextOnWindow:@"服务器内部发生错误！"];
    }
}

- (void)mediaPlayer:(VMediaPlayer *)player didPrepared:(id)arg
{
    if ([self.delegate respondsToSelector:@selector(mediaPlayer:didPreparedDelegate:)]) {
        [self.delegate mediaPlayer:player didPreparedDelegate:arg];
    }
}

- (void)mediaPlayer:(VMediaPlayer *)player playbackComplete:(id)arg
{
    if ([self.delegate respondsToSelector:@selector(mediaPlayer:playbackCompleteDelegate:)]) {
        [self.delegate mediaPlayer:player playbackCompleteDelegate:arg];
    }
}

- (void)mediaPlayer:(VMediaPlayer *)player error:(id)arg
{
    if ([self.delegate respondsToSelector:@selector(mediaPlayer:errorDelegate:)]) {
        [self.delegate mediaPlayer:player errorDelegate:arg];
    }
}

@end
