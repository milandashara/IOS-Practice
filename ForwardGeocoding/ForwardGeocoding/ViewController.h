//
//  ViewController.h
//  ForwardGeocoding
//
//  Created by student on 4/26/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *textFieldLocation;
    IBOutlet UILabel *labelLatitude;
    IBOutlet UILabel *labelLongitude;
    
    
}
@end
