//
//  ClassScheduleViewController.h
//  API Demos
//
//  Created by Blackbolt on 12/14/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MBAPI.h"

@interface ScheduleDetailViewController : UIViewController<MKMapViewDelegate>
{
    Visit *visit;
}

@property(nonatomic, strong) IBOutlet MKMapView *mkMap;
@property(nonatomic, strong) IBOutlet UILabel *lbTeacher;
@property(nonatomic, strong) IBOutlet UILabel *lbTime;
@property(nonatomic, strong) IBOutlet UILabel *lbType;

- (id)initWithVisit:(Visit*)vis;

@end
