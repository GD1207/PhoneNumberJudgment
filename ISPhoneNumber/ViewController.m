//
//  ViewController.m
//  ISPhoneNumber
//
//  Created by hosa on 15/12/23.
//  Copyright © 2015年 xiaoyu. All rights reserved.
//

#import "ViewController.h"
#import "JCheckPhoneNumber.h"
#import "UIView+WHC_Toast.h"
#import "UIView+WHC_Loading.h"

@interface ViewController ()
{
    UITextField *tf;
    
    UILabel *label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tf = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
    tf.backgroundColor = [UIColor grayColor];
    [self.view addSubview:tf];
    tf.text = @"123456789011";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 400, 100, 30);
    [btn setTitle:@"大白，点我" forState:0];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(100, 250, 300, 40)];
    [self.view addSubview:label];
    
//    [self.view startLoading];
//    [self.view startLoadingWithTxt:@"哼哼"];
//    [self.view startLoadingWithTxtUser:@"哼哼"];
//      [self.view startLoadingWithUser];
}
-(void)btnClick
{
    
    BOOL isOrNot = [JCheckPhoneNumber isMobileNumber:tf.text];
    
    switch (isOrNot) {
        case 0:
            NSLog(@"不是");
            label.text = @"NO , it's not phone number";
            label.textColor = [UIColor redColor];
            [self.view toast:@"错了，么么哒！" during:1.0f postion:MIDDLE type:GRAY_BACK];
            break;
        case 1:
            NSLog(@"是");
            label.text = @"YES, it's phone number";
            label.textColor = [UIColor greenColor];
            [self.view toast:@"对啦，吼得~！" during:1.0f postion:MIDDLE type:GRAY_BACK];

            break;
        default:
            break;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
