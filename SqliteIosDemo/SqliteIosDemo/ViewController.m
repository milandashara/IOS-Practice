//
//  ViewController.m
//  SqliteIosDemo
//
//  Created by student on 4/26/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *databasePath;
}
@end

@implementation ViewController
@synthesize name,address,phone,status;



-(void) prepareStatement{
    
    NSString *sqlString;
    const char *sql_stmt;
    
    sqlString=[NSString stringWithFormat:@"INSERT INTO CONTACTS(name,address,phone) VALUES(?,?,?)"];
    sql_stmt = [sqlString UTF8String];
    sqlite3_prepare_v2(contactDB, sql_stmt, -1, &insertStatement, NULL);
    
    sqlString=[NSString stringWithFormat:@"UPDATE CONTACTS set address=?,phone=? where name=?"];
    sql_stmt = [sqlString UTF8String];
    sqlite3_prepare_v2(contactDB, sql_stmt, -1, &updateStatement, NULL);
    
    sqlString=[NSString stringWithFormat:@"DELETE FROM CONTACTS where name=?"];
    sql_stmt = [sqlString UTF8String];
    sqlite3_prepare_v2(contactDB, sql_stmt, -1, &deleteStatment, NULL);
    
    sqlString=[NSString stringWithFormat:@"SELECT address,phone FROM CONTACTS where name=?"];
    sql_stmt = [sqlString UTF8String];
    sqlite3_prepare_v2(contactDB, sql_stmt, -1, &selectStatment, NULL);
    
    
}

-(void) createContact{
    sqlite3_bind_text(insertStatement, 1, [name.text UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insertStatement, 2, [address.text UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insertStatement, 3, [phone.text UTF8String], -1, SQLITE_TRANSIENT);
    
    if (sqlite3_step(insertStatement) == SQLITE_DONE) {
        status.text=@"Contact Added";
        name.text=@"";
        address.text=@"";
        phone.text=@"";
    }
    else{
        NSLog(@"%s",sqlite3_errmsg(contactDB));
        status.text=@"Failed to add contact";
    }
    sqlite3_reset(insertStatement);
    sqlite3_clear_bindings(insertStatement);
    
}

-(void) updateContact{
    sqlite3_bind_text(updateStatement, 1, [address.text UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updateStatement, 2, [phone.text UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updateStatement, 3, [name.text UTF8String], -1, SQLITE_TRANSIENT);
    
    if (sqlite3_step(updateStatement) == SQLITE_DONE) {
        status.text=@"Contact Updated";
        name.text=@"";
        address.text=@"";
        phone.text=@"";
    }
    else{
        NSLog(@"%s",sqlite3_errmsg(contactDB));
        status.text=@"Failed to Update contact";
    }
    sqlite3_reset(updateStatement);
    sqlite3_clear_bindings(updateStatement);
    
}
-(void) deleteContact{
    sqlite3_bind_text(deleteStatment, 1, [name.text UTF8String], -1, SQLITE_TRANSIENT);
   
    
    if (sqlite3_step(deleteStatment) == SQLITE_DONE) {
        status.text=@"Contact Deleteed";
        name.text=@"";
        address.text=@"";
        phone.text=@"";
    }
    else{
        NSLog(@"%s",sqlite3_errmsg(contactDB));
        status.text=@"Failed to Delete contact";
    }
    sqlite3_reset(deleteStatment);
    sqlite3_clear_bindings(deleteStatment);
    
}
-(void) findContact{
    sqlite3_bind_text(selectStatment, 1, [name.text UTF8String], -1, SQLITE_TRANSIENT);
    
    
    if (sqlite3_step(selectStatment) == SQLITE_ROW) {
        
        NSString *toAddressField=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(selectStatment, 0)];
        address.text=toAddressField;
        
        NSString *phoneField=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(selectStatment, 1)];
        phone.text=phoneField;
        
        status.text=@"Contact Found";
       
    }
    else{
        NSLog(@"%s",sqlite3_errmsg(contactDB));
        status.text=@"Failed to Find contact";
        address.text=@"";
        phone.text=@"";
    }
    sqlite3_reset(selectStatment);
    sqlite3_clear_bindings(selectStatment);
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *docsDir;
    docsDir=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    databasePath=[[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"contacts.sqlite"]];
    const char *dbPath=[databasePath UTF8String];
    
    if (sqlite3_open(dbPath, &contactDB)==SQLITE_OK) {
        char *errMsg;
        const char *sql_stmt="create table if not exists contacts (ID Integer primary key autoincrement, name text,address text,phone text)";
        if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg)) {
            status.text=@"Failed to create Table";
        }
    }
    else{
        status.text=@"Failed to open/create database";
    }
    [self prepareStatement];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
