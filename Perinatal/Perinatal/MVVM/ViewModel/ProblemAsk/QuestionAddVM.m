//
//  QuestionAddVM.m
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "QuestionAddVM.h"

@implementation QuestionAddVM

+(void)addQuestionWithDoctorId:(NSString *)doctorId questionContent:(NSString *)content questionCategoryId:(NSString *)categoryId cost:(NSString *)cost isOpen:(BOOL)isOpen questionImages:(NSArray *)images sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeProblemPublish];
    NSDictionary *multipartDic = @{@"doctorId":doctorId,
                                   @"questionContent":content,
                                   @"questionCategoryId":categoryId,
                                   @"cost":cost,
                                   @"isOpen":[NSString stringWithFormat:@"%d",isOpen]};
    if (url) {
        [[APIClient sharedClient] POST:url parameters:multipartDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            if (images) {
                int i = 0;
                for (UIImage *image in images){
                    [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:[NSString stringWithFormat:@"%d",i] fileName:[NSString stringWithFormat:@"%d.jpg",i] mimeType:@"image/jpeg"];
                    i ++;
                }
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"response=%@",responseObject);
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error = %@",error.debugDescription);
            
        }];
    }
}

@end
