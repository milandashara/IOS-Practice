//
//  ViewController.h
//  Support
//
//  Created by student on 24/4/14.
//  Copyright (c) 2014 Milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate>

-(IBAction)emailSupport;
-(IBAction)callSupport;

@end
