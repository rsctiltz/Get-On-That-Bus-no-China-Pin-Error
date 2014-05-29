//
//  ViewController.m
//  Get On That Bus
//
//  Created by Philipe Castilho on 5/28/14.
//  Copyright (c) 2014 Philipe's Productions. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "DetailViewController.h"
#import "BusStopAnnotation.h"

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        NSArray *arrayOfStops = dictionary[@"row"];

        for (NSDictionary *dictionary in arrayOfStops)
        {
            BusStopAnnotation *annotation = [[BusStopAnnotation alloc] init];

            annotation.jsonDictionary = dictionary;

            [self.mapView addAnnotation:annotation];
        }

        [self.mapView showAnnotations:self.mapView.annotations animated:YES];

    }];
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    BusStopAnnotation *annotation = view.annotation;
    NSDictionary *selectedDictionary = annotation.jsonDictionary;

    [self performSegueWithIdentifier:@"DetailSegue" sender:selectedDictionary];


}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSDictionary *)sender
{
    DetailViewController *nextViewController = segue.destinationViewController;
    nextViewController.informationOfStop = sender;

}

    //attempted to change the color of stops with inter modals.
//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//
//    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
//
//    for (NSDictionary *dictionary in self.arrayOfStops) {
//        if ([dictionary[@"inter_modal"] isEqualToString:@"Metra"]) {
//            pin.pinColor = MKPinAnnotationColorGreen;
//
//        }
//
//    }
//
//    return pin;
//}



@end
