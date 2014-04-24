//
//  DetailViewController.h
//  Modules
//
//  Created by student on 24/4/14.
//  Copyright (c) 2014 Milan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
