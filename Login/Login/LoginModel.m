//
//  LoginModel.m
//  Login
//
//  Created by student on 4/12/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

-(BOOL) verifyUser:(NSString *)userId andPassword:(NSString *)password{
    if ([userId isEqualToString:password]) {
        return true;
    }
    else
    {
        return false;
    }
}
@end
