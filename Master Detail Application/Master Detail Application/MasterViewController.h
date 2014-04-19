//
//  MasterViewController.h
//  Master Detail Application
//
//  Created by student on 4/19/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController
{
    NSMutableArray *courses;
}
@property (nonatomic,assign) NSMutableArray *courses;

@end
