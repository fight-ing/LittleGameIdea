//
//  AddPlayerViewController.m
//  LittleGameIdea
//
//  Created by zp_liufei on 14-5-14.
//  Copyright (c) 2014年 zp_liufei. All rights reserved.
//

#import "AddPlayerViewController.h"

@interface AddPlayerViewController ()
{
    UIImage *headImage;
}
@end

@implementation AddPlayerViewController
@synthesize delegate = _delegate,number;
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
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 260, 50)];
    numberLabel.backgroundColor = [UIColor clearColor];
    numberLabel.text = [NSString stringWithFormat:@"玩家编号:   %d",self.number];
    [self.view addSubview:numberLabel];
    UILabel *numberLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 80, 50)];
    numberLabel1.backgroundColor = [UIColor clearColor];
    numberLabel1.text = [NSString stringWithFormat:@"玩家名号:   "];
    [self.view addSubview:numberLabel1];
    
    nameText = [[UITextField alloc] initWithFrame:CGRectMake(110, 150, 260, 50)];
    nameText.placeholder = @"默认为 玩家+编号";
    nameText.backgroundColor = [UIColor grayColor];
    nameText.delegate = self;
    [self.view addSubview:nameText];
    
    headButton= [UIButton buttonWithType:UIButtonTypeCustom];
    headButton.frame = CGRectMake(100, 220, 100, 100);
    [headButton setBackgroundColor:[UIColor greenColor]];
    [headButton addTarget:self action:@selector(photoSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headButton];


    UIButton *finishBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    finishBtn.frame = CGRectMake(200, 350, 100, 50);
    [finishBtn setBackgroundColor:[UIColor greenColor]];
    [finishBtn setTitle:@"提交" forState:UIControlStateNormal];
    [finishBtn addTarget:self action:@selector(finishBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:finishBtn];
}

-(void)finishBtnClicked:(UIButton *)btn {
    PlayerItem *item = [[PlayerItem alloc] init];
    item.pName = nameText.text.length==0? [NSString stringWithFormat:@"玩家%d",self.number]:nameText.text;
    item.pNumber = [NSString stringWithFormat:@"%d",self.number];
    item.pImage = headImage;
    if ([_delegate respondsToSelector:@selector(reloadDataWithNewPlayer:)]) {
        [_delegate reloadDataWithNewPlayer:item];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [nameText resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)photoSelect:(UIButton *)btn {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentModalViewController:imagePicker animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查设备摄像头是否正常或是否已同意本应用使用照相机" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [headButton setImage:[info objectForKey:UIImagePickerControllerEditedImage] forState:UIControlStateNormal];
    headImage = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
