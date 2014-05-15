//
//  BeginViewController.h
//  LittleGameIdea
//
//  Created by zp_liufei on 14-5-14.
//  Copyright (c) 2014年 zp_liufei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPlayerViewController.h"
@interface BeginViewController : UIViewController <AddPlayerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *playerDataArray;
    UITableView *listTableView;
}
@end
