//
//  ViewController.h
//  LocationManagerIosDemo
//
//  Created by student on 4/26/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    IBOutlet UITextView *textView;
    CLLocationManager *locationManager;
    NSUInteger noUpdates;
}

//@property(strong,nonatomic) IBOutlet UITextView *textVie;

@end
