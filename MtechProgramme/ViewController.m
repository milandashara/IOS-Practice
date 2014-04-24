//
//  ViewController.m
//  Support
//
//  Created by student on 24/4/14.
//  Copyright (c) 2014 Milan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)emailSupport{
    MFMailComposeViewController *evc=[[MFMailComposeViewController alloc]init];
    
    evc.mailComposeDelegate=self;
    [evc setSubject:@"Subject"];
    [evc setMessageBody:@"Message Body" isHTML:NO];
    [self presentViewController:evc animated:YES completion:nil];
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [controller dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)callSupport{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel:81354048"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
