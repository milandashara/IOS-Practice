//
//  DetailViewController.h
//  CoreDataIosDemo
//
//  Created by student on 4/26/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    UITextField *groupNameTextField;
}
@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextField *groupNameTextField;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)setDatabaseContext:(id)dbContext;


@end
