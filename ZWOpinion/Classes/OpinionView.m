//
//  OpinionView.m
//  HomeHealth
//
//  Created by zhangwei on 17/3/30.
//  Copyright © 2017年 ChiJian. All rights reserved.
//

#import "OpinionView.h"


@implementation OpinionView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.opinionTextView = [[ZWTextView alloc]initWithFrame:CGRectMake(10, 7, frame.size.width - 2 * 10, frame.size.height - 2 * 7)];
        self.opinionTextView.backgroundColor = self.backgroundColor;
        self.opinionTextView.myPlaceholder = @"请留下对我们的意见反馈吧";
        self.opinionTextView.myPlaceholderColor = [UIColor lightGrayColor];
        [self addSubview:self.opinionTextView];
        
    }
    return self;
}
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    self.opinionTextView.backgroundColor = self.backgroundColor;
}

@end
