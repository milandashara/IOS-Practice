//
//  LoginViewController.m
//  Login
//
//  Created by student on 4/12/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginModel.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginModel,userID,password;

-(IBAction)login:(id)sender{
    [userID resignFirstResponder];
    [password resignFirstResponder];
    NSString *name =userID.text;
    NSString *pass=password.text;
    NSLog(@"User name is %@ and password is %@",name,pass);
    BOOL result=[loginModel verifyUser:name andPassword:pass];
    if(!result)
    {
        [self printMessage:@"Incorrect usr Id or password"];
    }
    else
    {
        [self printMessage:@"Welcome to the application!"];
    }
}

-(void) printMessage:(NSString *)name{
    UIAlertView *alertPopup=[[UIAlertView alloc] initWithTitle:@"Alert" message:name delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertPopup show];
    NSLog(@"The message is %@",name);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [userID resignFirstResponder];
    [password resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    userID.delegate=self;
    password.delegate=self;
    loginModel=[[LoginModel alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
