//
//  ViewController.m
//  CocoaPodsDemo_github
//
//  Created by blackJokerZhou on 16/4/12.
//  Copyright © 2016年 blackJokerZhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)loginBtnClick:(id)sender {
    UIAlertController *loginAlertCon = [UIAlertController alertControllerWithTitle:@"登录帐号" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [loginAlertCon addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入帐号";
    }];
    [loginAlertCon addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入密码";
        textField.secureTextEntry = YES;
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *UUIDString = [[UIDevice currentDevice].identifierForVendor UUIDString];
        
        NSDictionary *paraDic = @{@"CT":@"2",
                                  @"version":@"1.1",
                                  @"IMEI":UUIDString,
                                  @"username":loginAlertCon.textFields.firstObject.text,
                                  @"password":loginAlertCon.textFields.lastObject.text
                                  };
        [HttpManager httpRequestToLoginWithParaDictionary:paraDic withBlock:^(id data) {
            int status = [[data objectForKey:@"status"] intValue];
            if (status == 0) {
                NSLog(@"登录成功，想干嘛干嘛去");
            }
        }];
    }];
    [loginAlertCon addAction:cancleAction];
    [loginAlertCon addAction:okAction];
    [self presentViewController:loginAlertCon animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
