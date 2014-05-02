//
//  FirstViewController.m
//  GoogleSearchJSON
//
//  Created by Ouh Eng Lieh on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//005134986919924311185:xeenulwntoq
#import "GoogleSearchViewController.h"
#import "SearchResults.h"
@implementation GoogleSearchViewController

@synthesize searchString, activityIndicatorView, buffer,searchResults;

- (IBAction) search {
    [activityIndicatorView startAnimating];
    self.buffer=[NSMutableData data];
    NSURLSessionConfiguration *defaultConfig=[NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:defaultConfig delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    [[session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.googleapis.com/customsearch/v1?key=AIzaSyD9sseAh8CyOC6e8sAeevgm_U1eK9R9mSw&cx=005134986919924311185:xeenulwntoq&q=%@&alt=json",searchString.text]]]resume];
    
   
}
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data
{
    [buffer appendData:data];
}
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error
{
    if(error == nil)
    {
        NSLog(@"Download is Succesfull");
        NSLog(@"Done with bytes %d", [buffer length]);
        
        [self processResponse:buffer];
    }
    else
        NSLog(@"Error %@",[error userInfo]);
    [activityIndicatorView stopAnimating];

}

- (void) processResponse:(NSMutableData *)data {
	NSError *e=nil;
    NSDictionary *results=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
    NSArray *items=[results objectForKey:@"items"];
    
    for (NSDictionary *item in items) {
        NSString *title=[item objectForKey:@"title"];
        [self.searchResults.searchTitles addObject:(title.length > 0 ? title:@"Untitled")];
        
        NSString *link=[item objectForKey:@"link"];
       
        [self.searchResults.searchLinks addObject:link];
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SwitchResultView" object:nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


@end
