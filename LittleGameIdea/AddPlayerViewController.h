//
//  AddPlayerViewController.h
//  LittleGameIdea
//
//  Created by zp_liufei on 14-5-14.
//  Copyright (c) 2014年 zp_liufei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerItem.h"
@protocol AddPlayerDelegate;
@interface AddPlayerViewController : UIViewController <UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    id <AddPlayerDelegate> _delegate;
    UITextField *nameText;
    UIButton *headButton;
}
@property (nonatomic) id <AddPlayerDelegate> delegate;
@property (nonatomic) int number;
@end
@protocol AddPlayerDelegate <NSObject>

-(void)reloadDataWithNewPlayer:(PlayerItem *)newPlayer;

@end