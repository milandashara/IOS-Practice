//
//  LoginViewController.h
//  Login
//
//  Created by student on 4/12/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginModel;
@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property(strong,nonatomic) LoginModel *loginModel;
@property(strong,nonatomic) IBOutlet UITextField *userID;
@property(strong,nonatomic) IBOutlet UITextField *password;

-(IBAction)login:(id)sender;
-(void) printMessage:(NSString *) name;


@end
