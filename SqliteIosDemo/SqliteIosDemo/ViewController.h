//
//  ViewController.h
//  SqliteIosDemo
//
//  Created by student on 4/26/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface ViewController : UIViewController
{
    UITextField *name;
    UITextField *address;
    UITextField *phone;
    UILabel *status;

    
    sqlite3 *contactDB;
    sqlite3_stmt *insertStatement;
    sqlite3_stmt *updateStatement;
    sqlite3_stmt *deleteStatment;
    sqlite3_stmt *selectStatment;
    
    
}

@property(retain,nonatomic) IBOutlet UITextField *name;
@property(retain,nonatomic) IBOutlet UITextField *address;
@property(retain,nonatomic) IBOutlet UITextField *phone;
@property(retain,nonatomic) IBOutlet UILabel *status;

-(IBAction) createContact;
-(IBAction) findContact;
-(IBAction) updateContact;
-(IBAction) deleteContact;
- (void) prepareStatement;

@end
