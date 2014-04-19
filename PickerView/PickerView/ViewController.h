//
//  ViewController.h
//  PickerView
//
//  Created by student on 4/19/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *textFieldTextCode;
    NSMutableArray *courseList;
    NSDictionary *courseDict;
    UIPickerView *coursePicker;
}

-(IBAction)textFieldDidBeginEditing:(UITextField *)textField;
-(IBAction)coursePicked:()sender;

@end
