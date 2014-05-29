//
//  DetailViewController.m
//  Get On That Bus
//
//  Created by Philipe Castilho on 5/28/14.
//  Copyright (c) 2014 Philipe's Productions. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *busRoutes;
@property (weak, nonatomic) IBOutlet UILabel *intermodalLabel;

@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = self.informationOfStop[@"cta_stop_name"];
    self.addressLabel.text = [NSString stringWithFormat:@"%@", self.informationOfStop[@"_address"]];
    self.busRoutes.text = [NSString stringWithFormat:@"%@", self.informationOfStop[@"routes"]];

    if (self.informationOfStop[@"inter_modal"] == nil) {
        self.intermodalLabel.text = @"None";
    }
    else
    {
        
        self.intermodalLabel.text = self.informationOfStop[@"inter_modal"];
    }


}



@end
