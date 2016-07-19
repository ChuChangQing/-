//
//  YXNetManager.m
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXNetManager.h"

@implementation YXNetManager
+(id)getWeatherDataCity:(NSString *)city completionHandler:(void (^)(YXWeatherModel *, NSError *))completionHandler{
    city = [city stringByURLEncode];
    NSString *path = [NSString stringWithFormat:@"/data/otherWeather?city=%@", city];
//    NSString *path = @"/data/otherWeather?city=%e4%b8%8a%e6%b5%b7";
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXWeatherModel parseJSON:jsonObject], error);
    }];
}
+ (id)getStarDataWithName:(NSString *)starName Completionhandler:(void (^)(YXStarModel *, NSError *))completionHandler{
    starName = [starName stringByURLEncode];
    NSString *path = [NSString stringWithFormat:@"/star/api/v2/getKeywordInfo.php?dev=android&devid=AtaVkENPKwXLw9DlSgDwa1c804oUWj04BcirfvMH6%2BO4gj98eeZpv17S4zLgd0Hw%0A&keyword=%@&locale=0&appid=ff8080813340aca1013346708efc0003&ver=3.2", starName];
    return [self GET:@"http://star.mooker.cn" path:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXStarModel parseJSON:jsonObject], error);
    }];
}
+ (id)getStarRecommendDataWithOffset:(NSInteger)offset Completionhandler:(void (^)(YXStarRecommendModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"/star/api/v2/getStarNews.php?category=&dev=android&devid=AtaVkENPKwXLw9DlSgDwa1c804oUWj04BcirfvMH6%2BO4gj98eeZpv17S4zLgd0Hw%0A&locale=0&star=0&appid=ff8080813340aca1013346708efc0003&ver=3.2&len=21&offset=%ld", offset];
    return [self GET:@"http://star.mooker.cn" path:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXStarRecommendModel parseJSON:jsonObject], error);
    }];
}
+ (id)getStarPaihangDataCompletionhandler:(void (^)(YXStarPaihangModel *, NSError *))completionHandler{
    NSString *path = @"/star/api/v2/getStarList.php?dev=android&devid=AtaVkENPKwXLw9DlSgDwa1c804oUWj04BcirfvMH6%2BO4gj98eeZpv17S4zLgd0Hw%0A&locale=0&appid=ff8080813340aca1013346708efc0003&ver=3.2";
    return [self GET:@"http://star.mooker.cn" path:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXStarPaihangModel parseJSON:jsonObject], error);
    }];
}
+ (id)getGameDataWithStar1:(NSInteger)star1 andStar2:(NSInteger)star2 completionHandler:(void (^)(YXGameModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"/star/api/v2/getEatInfo.php?star2=%ld&dev=android&devid=AtaVkENPKwXLw9DlSgDwa1c804oUWj04BcirfvMH6%2BO4gj98eeZpv17S4zLgd0Hw%0A&locale=0&appid=ff8080813340aca1013346708efc0003&ver=3.2&star1=%ld", star2, star1];
    return [self GET:@"http://star.mooker.cn" path:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXGameModel parseJSON:jsonObject], error);
    }];
}
+ (id)getPipeiDataWithStar1:(NSInteger)star1 andStar2:(NSInteger)star2 completionHandler:(void (^)(YXPipeiModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"/star/api/v2/getPairInfo.php?star2=%ld&dev=android&devid=AtaVkENPKwXLw9DlSgDwa1c804oUWj04BcirfvMH6%2BO4gj98eeZpv17S4zLgd0Hw%0A&locale=0&sex2=f&appid=ff8080813340aca1013346708efc0003&ver=3.2&star1=%ld&sex1=m", star2, star1];
    return [self GET:@"http://star.mooker.cn" path:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXPipeiModel parseJSON:jsonObject], error);
    }];
}
+ (id)getRecommendUserDatacompletionHandler:(void (^)(YXRecommendModel *, NSError *))completionHandler{
    NSString *path = @"/?build=4.3.1&appVersion=505&ch=360&openudid=865290020531167&screen=1440x2400&device=android&id=267672&limit=30&loc=%E5%A4%A9%E4%B9%89%E5%B0%8F%E5%8C%BA&method=item.getComments&geo=31.218918%2C121.414174&offset=30";
    return [self GET:@"http://211.155.84.158" path:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXRecommendModel parseJSON:jsonObject], error);
    }];
}
+ (id)getPictureDataWithOffset:(NSInteger)offset Completionhandler:(void (^)(YXPictureModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"/?build=4.3.1&appVersion=505&ch=360&openudid=865290020531167&screen=1440x2400&device=android&offset=%ld&limit=60&id=803&method=recommend.get", offset];
    return [self GET:@"http://211.155.84.158" path:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXPictureModel parseJSON:jsonObject], error);
    }];
}
@end
