//
//  Course.m
//  Master Detail Application
//
//  Created by student on 4/19/14.
//  Copyright (c) 2014 ISS. All rights reserved.
//

#import "Course.h"

@implementation Course
@synthesize courseDesc,courseId,lecturer;

+ (NSMutableArray *) getExistingCourses{
    
    NSMutableArray *courses=[[NSMutableArray alloc] init];
   
    [courses addObject:[[Course alloc]initWithId:@"S-OOAD"]];
    [courses addObject:[[Course alloc]initWithId:@"S-PMIS"]];
    [courses addObject:[[Course alloc]initWithId:@"S-JAVA EE"]];
    [courses addObject:[[Course alloc]initWithId:@"S-CSCRUM"]];
    return courses;
     
}

- (id) initWithId:(NSString *)myId{
    self=[super init];
    if(self)
    {
        self.courseId=myId;
        return self;
    }
    return self;
}
@end
