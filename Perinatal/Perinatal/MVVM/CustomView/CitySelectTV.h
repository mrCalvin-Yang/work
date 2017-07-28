//
//  CitySelectTV.h
//  Perinatal
//
//  Created by OY on 2017/7/27.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "BaseTV.h"

@interface CitySelectTV : BaseTV
@property(nonatomic,strong)NSDictionary *cityDic;
@property(nonatomic,strong)NSMutableArray *letterArray;
@property(nonatomic,copy)NSString *cityName;
@end
