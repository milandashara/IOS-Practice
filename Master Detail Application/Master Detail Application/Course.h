//
//  Course.h
//  Master Detail Application
//
//  Created by student on 4/19/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
{
    NSString *courseId;
    NSString *courseDesc;
    NSString *lecturer;
}

@property(nonatomic,copy) NSString *courseId;
@property(nonatomic,copy) NSString *courseDesc;
@property(nonatomic,copy) NSString *lecturer;

+ (NSMutableArray *) getExistingCourses;
- (id) initWithId:(NSString *) myId;



@end
