//
//  Created by Dmitry Ivanenko on 15.04.14.
//  Copyright (c) 2014 Dmitry Ivanenko. All rights reserved.
//

#import "JZDatepickerDateView.h"
#import "JZDatepickerCircleView.h"


const CGFloat kJZDatepickerItemWidth = 42.;
const CGFloat kJZDatepickerBackgroundCircleWidth = 42.;


@interface JZDatepickerCell ()

@property (strong, nonatomic) UILabel *dayLabel;
@property (strong, nonatomic) UILabel *topLabel;
@property (nonatomic, strong) JZDatepickerCircleView *circleView;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSLayoutConstraint *circleViewWidthConstraint;

@end


@implementation JZDatepickerCell

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self setup];
    }
    
    return self;
}

- (void)tintColorDidChange
{
    [super tintColorDidChange];
    self.circleView.bgColor = self.tintColor;
}

- (void)setup
{
    // topLabel
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(1);
        make.left.offset(15);
        make.right.offset(-16);
        make.height.offset(16);
    }];
    
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(13);
        make.right.offset(-13);
        make.top.mas_equalTo(self.topLabel.mas_bottom).with.offset(3);
        make.bottom.offset(-2);
    }];
    
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [self setSelected:NO];
    self.circleView.alpha = 0.0;
}

#pragma mark - Setters

- (void)setDate:(NSDate *)date
{
    _date = date;
    
    [self.dateFormatter setDateFormat:@"d"];
    NSString *dayFormattedString = [self.dateFormatter stringFromDate:date];
    
    [self.dateFormatter setDateFormat:@"EEE"];
    NSString *dayInWeekFormattedString = [self.dateFormatter stringFromDate:date];
    dayInWeekFormattedString = [dayInWeekFormattedString substringFromIndex:1];
    
    self.dayLabel.text = dayFormattedString;
//    if ( [self isToday:date]) {
//        self.topLabel.text = [NSLocalizedString(@"today", nil) uppercaseString];
//    } else {
//        
//    }
    self.topLabel.text = [dayInWeekFormattedString uppercaseString];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.circleView.alpha = self.isSelected ? 1 : .5;
    } else {
        self.circleView.alpha = self.isSelected ? 1 : 0.0;
    }
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.circleView.alpha = 1.0f;
        self.dayLabel.textColor = [UIColor orangeColor];
        self.topLabel.textColor = self.dayLabel.textColor;
    } else {
        self.circleView.alpha = 0.0f;
        self.dayLabel.textColor = [UIColor whiteColor];
        self.topLabel.textColor = [UIColor whiteColor];
    }
}

#pragma mark - Getters

- (UILabel *)dayLabel
{
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
        _dayLabel.textColor = [UIColor whiteColor];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_dayLabel];
    }
    return _dayLabel;
}

- (UILabel *)topLabel
{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:11];
        _topLabel.textAlignment = NSTextAlignmentCenter;
        _topLabel.textColor = [UIColor whiteColor];
        [self addSubview:_topLabel];
    }
    return _topLabel;
}

- (UIView *)circleView
{
    if (!_circleView) {
        _circleView = [[JZDatepickerCircleView alloc] init];
        _circleView.alpha = 0.0f;
        _circleView.bgColor = [UIColor whiteColor];
        _circleView.backgroundColor = [UIColor whiteColor];
        _circleView.opaque = NO;
        _circleView.layer.masksToBounds = YES;
        _circleView.layer.cornerRadius = 21.;
        [self addSubview:_circleView];
        [self sendSubviewToBack:_circleView];
    }
    
    return _circleView;
}

- (NSDateFormatter *)dateFormatter
{
    if(!_dateFormatter){
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    
    return _dateFormatter;
}

#pragma mark - Helper Methods

- (BOOL)isWeekday:(NSDate *)date
{
    NSInteger day = [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:date] weekday];
    
    const NSInteger kSunday = 1;
    const NSInteger kSaturday = 7;
    
    BOOL isWeekdayResult = day == kSunday || day == kSaturday;
    
    return isWeekdayResult;
}

- (BOOL)isToday:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
    NSDate *otherDate = [cal dateFromComponents:components];
    
    if([today isEqualToDate:otherDate]) {
        return YES;
    } else {
        return NO;
    }
}

@end
