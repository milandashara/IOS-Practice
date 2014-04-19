//
//  ViewController.m
//  Single View Application
//
//  Created by student on 4/19/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    textFieldPrincipal.text=@"10000";
    textFieldNumberOfYears.text=[NSString stringWithFormat:@"%d",(int)sliderNumOfYears.value];
    textFieldIR.text=[NSString stringWithFormat:@"%d",(int)sliderIR.value];
    textFieldPrincipal.delegate=self;
    textFieldIR.delegate=self;
    textFieldNumberOfYears.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderNumberOfYearsChanged:(id)sender{
    int value=sliderNumOfYears.value;
    textFieldNumberOfYears.text=[NSString stringWithFormat:@"%d",value];
    [self displayAmount];
    
}

-(IBAction)sliderIRChanged:(id)sender{
    float value=sliderIR.value;
    textFieldIR.text=[NSString stringWithFormat:@"%0.02f",value];
    [self displayAmount];
    
}
-(IBAction)displayAmount{
    float pa=textFieldPrincipal.text.floatValue;
    int numOfYear=[textFieldNumberOfYears.text intValue];
    float ir=textFieldIR.text.floatValue/100;
    float finalAmt=pa *pow(1+ir, numOfYear);
    NSLog(@"%0.02f",finalAmt);
    labelAmount.text=[NSString stringWithFormat:@"%0.02f",finalAmt];
    [textFieldPrincipal resignFirstResponder];

}

- (void) textFieldDidEndEditing:(UITextField *) myTextField
{
    [self displayAmount];
}



@end
