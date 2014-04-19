//
//  ViewController.m
//  PickerView
//
//  Created by student on 4/19/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    courseList=[[NSMutableArray alloc]init];
    [courseList addObject:@"Milan"];
    [courseList addObject:@"Milan"];
    [courseList addObject:@"Milan"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    
}

@end
