//
//  BusStopAnnotation.m
//  Get On That Bus
//
//  Created by MM Driver on 5/29/14.
//  Copyright (c) 2014 Philipe's Productions. All rights reserved.
//

#import "BusStopAnnotation.h"

@implementation BusStopAnnotation

-(NSString *)title
{
    return self.jsonDictionary[@"cta_stop_name"];
}

-(NSString *)subtitle
{
    return self.jsonDictionary[@"routes"];
}

-(CLLocationCoordinate2D)coordinate
{
    double latitude = [self.jsonDictionary[@"latitude"] doubleValue];
    double longitude = [self.jsonDictionary[@"longitude"] doubleValue];

    longitude = -fabs(longitude);

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    return coordinate;
}

@end
