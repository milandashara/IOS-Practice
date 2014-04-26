//
//  DetailViewController.m
//  CoreDataIosDemo
//
//  Created by student on 4/26/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
@synthesize groupNameTextField;
#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}
- (void)setDatabaseContext:(id)dbContext
{
    _managedObjectContext=dbContext;
}


- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
       // self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"groupName"] description];
        groupNameTextField.text= [[self.detailItem valueForKey:@"groupName"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:true];
    [self.detailItem setValue:groupNameTextField.text forKey:@"groupName"];
  
    NSError *error = nil;
    if (![_managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

@end
