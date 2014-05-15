//
//  RootViewController.m
//  LittleGameIdea
//
//  Created by zp_liufei on 14-5-14.
//  Copyright (c) 2014年 zp_liufei. All rights reserved.
//

#import "RootViewController.h"
#import "BeginViewController.h"
#import "QuitViewController.h"
#import "HelpViewController.h"
#define BUTTON_TAG_BEGIN 1000
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 80)];
    label.text = @"敢么？";
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:label];
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"敢",@"算了",@"求助", nil];
    int i = 0;
    for (NSString *str in titleArray) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 100, 40);
        button.center = CGPointMake(160, 160+50*i);
        [button setTitle:str forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blueColor]];
        [button addTarget:self action:@selector(resultOfSelect:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = BUTTON_TAG_BEGIN + i;
        [self.view addSubview:button];
        i ++;
    }
    
}

-(void)resultOfSelect:(UIButton *)btn {
    CATransition *mCat = [CATransition animation];
    [mCat setDuration:2];
    [mCat setType:@"ripple"];
    [self.view.layer addAnimation:mCat forKey:nil];
    
    switch (btn.tag) {
        case BUTTON_TAG_BEGIN:
        {
            BeginViewController *beginVC = [[BeginViewController alloc] init];
            [self presentViewController:beginVC animated:YES completion:nil];
        }
            break;
        case BUTTON_TAG_BEGIN+1:
        {
            QuitViewController *quitVC = [[QuitViewController alloc] init];
            [self  presentViewController:quitVC animated:YES completion:nil];
        }
            break;
        case BUTTON_TAG_BEGIN+2:
        {
            HelpViewController *helpVC = [[HelpViewController alloc] init];
            [self presentViewController:helpVC animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
