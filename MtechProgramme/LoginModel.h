//
//  LoginModel.h
//  Login
//
//  Created by student on 4/12/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

- (BOOL) verifyUser:(NSString *) userId andPassword:(NSString *) password;

@end
