//
//  WebView.h
//  GoogleSearchJSON
//
//  Created by Ouh Eng Lieh on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchResults;
@interface GoogleResultWebViewController : UIViewController <UIWebViewDelegate,UITextFieldDelegate> {
	UIWebView *webView;
}
@property (strong, nonatomic) IBOutlet UITextField *urlTextField;
@property(strong,nonatomic) SearchResults *searchResults;

@property(strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)backBtnClicked:(id)sender;
@end
