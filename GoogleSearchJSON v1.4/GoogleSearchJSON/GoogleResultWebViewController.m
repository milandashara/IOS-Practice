    //
//  WebView.m
//  GoogleSearchJSON
//
//  Created by Ouh Eng Lieh on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GoogleResultWebViewController.h"
#import "SearchResults.h"
@implementation GoogleResultWebViewController

@synthesize webView,searchResults,urlTextField;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
//	NSLog(@"Loading view");
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    webView.delegate = self;
    urlTextField.delegate=self;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString *urlAddress=searchResults.selectedLink;
    
    NSURL *url=[NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj=[NSURLRequest requestWithURL:url];
    
    [webView loadRequest:requestObj];
    urlTextField.text=urlAddress;
    webView.delegate=self;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSURL *url=[NSURL URLWithString:textField.text];
    NSURLRequest *requestObj=[NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    return YES;
}

- (IBAction)backBtnClicked:(id)sender {
   // urlTextField.text=webView.request.URL.absoluteString;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
     urlTextField.text=webView.request.URL.absoluteString;
}

@end


