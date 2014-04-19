//
//  DetailViewController.h
//  Master Detail Application
//
//  Created by student on 4/19/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Course;
@interface DetailViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *idField;
    IBOutlet UITextField *descField;
    IBOutlet  UITextField *lecturerField;
    Course *editingCourse;
}

@property (strong, nonatomic) id detailItem;
@property(weak,nonatomic) IBOutlet UITextField *idField;
@property(weak,nonatomic) IBOutlet UITextField *descField;
@property(weak,nonatomic) IBOutlet UITextField *lecturerField;
@property(nonatomic,assign) Course *editingCourse;


@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
