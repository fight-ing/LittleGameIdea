//
//  BeginViewController.m
//  LittleGameIdea
//
//  Created by zp_liufei on 14-5-14.
//  Copyright (c) 2014年 zp_liufei. All rights reserved.
//

#import "BeginViewController.h"

#import "GameViewController.h"
#import "PlayerCell.h"
#define BUTTON_TAG_BEGIN1 100
@interface BeginViewController ()

@end

@implementation BeginViewController

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
    
    playerDataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    NSArray *btnArray = [NSArray arrayWithObjects:@"添加用户",@"完成", nil];
    for (int i = 0; i < btnArray.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10+190*i, 30, 100, 50);
        [button setTitle:[btnArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor lightGrayColor]];
        [button addTarget:self action:@selector(addNewPlayer:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = BUTTON_TAG_BEGIN1 + i;
        [self.view addSubview:button];
    }
    
    listTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 90, 300, 400) style:UITableViewStylePlain];
    listTableView.dataSource = self;
    listTableView.delegate = self;
    [self.view addSubview:listTableView];
    
}
-(void)addNewPlayer:(UIButton *)btn {
    
    CATransition *mCatran = [CATransition animation];
    [mCatran setDuration:1.5];
    [mCatran setType:@"ripple"];
    [self.view.layer addAnimation:mCatran forKey:nil];
    
    switch (btn.tag) {
        case BUTTON_TAG_BEGIN1:
        {
            AddPlayerViewController *addVC = [[AddPlayerViewController alloc] init];
            addVC.delegate = self;
            addVC.number = playerDataArray.count;
            [self presentViewController:addVC animated:YES completion:nil];
        }
            break;
        case BUTTON_TAG_BEGIN1+1:
        {
            GameViewController *gameVC = [[GameViewController alloc] init];
            gameVC.dataArray = playerDataArray;
            [self presentViewController:gameVC animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
    
}

-(void)reloadDataWithNewPlayer:(PlayerItem *)newPlayer {
    [playerDataArray addObject:newPlayer];
    [listTableView reloadData];
}

#pragma TableView Delegate 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return playerDataArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"cellName";
    PlayerCell *cell = (PlayerCell *)[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[PlayerCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
    }
    PlayerItem *item = [playerDataArray objectAtIndex:indexPath.row];
    cell.pHeadImageView.image = item.pImage;
    cell.pNameLabel.text = item.pName;
    cell.pNumberLabel.text = item.pNumber;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
