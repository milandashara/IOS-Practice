//
//  ModulesModel.m
//  Modules
//
//  Created by student on 24/4/14.
//  Copyright (c) 2014 Milan. All rights reserved.
//

#import "ModulesModel.h"

@implementation ModulesModel
@synthesize arrayData;

-(id) init
{
    self = [super init];
    arrayData = [[NSMutableArray alloc] initWithObjects:@"ISS Mtech",@"SG4002" ,nil];
    return  self;
}
@end
