//
//  MessageModel.h
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property(nonatomic, copy) NSString *dateOfPregnancy;

@property(nonatomic, copy) NSString *babyImageUrl;

@property(nonatomic, copy) NSString *pregnantWomanNote;

@property(nonatomic, copy) NSString *prenatalEducation;

@property(nonatomic, copy) NSString *babyNote;

@property(nonatomic)NSInteger sectionNumber;

@property(nonatomic)CGFloat cellHeight;




@end
