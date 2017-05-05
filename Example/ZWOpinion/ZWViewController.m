//
//  ZWViewController.m
//  ZWOpinion
//
//  Created by weizhangCoder on 05/05/2017.
//  Copyright (c) 2017 weizhangCoder. All rights reserved.
//

#import "ZWViewController.h"
#import "OpinionView.h"

@interface ZWViewController ()

@end

@implementation ZWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    OpinionView *opinion = [[OpinionView alloc]initWithFrame:CGRectMake(10, 50, self.view.frame.size.width - 20, 130)];
    opinion.opinionTextView.maxCount = 200;
    opinion.opinionTextView.myPlaceholder = @"请输入默认文字";
    opinion.opinionTextView.myPlaceholderColor = [UIColor lightGrayColor];
    opinion.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:opinion];
    [opinion.opinionTextView setTextViewBlock:^(NSString *text) {
        
        
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
