//
//  ZWTextView.h
//  HomeHealth
//
//  Created by zhangwei on 17/3/30.
//  Copyright © 2017年 ChiJian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWTextView : UITextView

@property(nonatomic,copy) NSString *myPlaceholder;  //默认文字

@property(nonatomic,strong) UIColor *myPlaceholderColor; //默认文字颜色

@property (nonatomic , assign) NSInteger  maxCount;//输入文字的最长个数 默认200

@property (nonatomic , copy) void (^textViewBlock)(NSString *text);
@end
