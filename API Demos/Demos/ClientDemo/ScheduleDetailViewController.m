//
//  ClassScheduleViewController.m
//  API Demos
//
//  Created by Blackbolt on 12/14/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ScheduleDetailViewController.h"

@interface ScheduleDetailViewController ()

@end

@implementation ScheduleDetailViewController


- (id)initWithVisit:(Visit*)vis
{
    if (self = [super init])
    {
        
        visit = vis;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:visit.Name];
    
    NSString *dateString = [Utils dateToString:visit.StartDateTime format:@"MM/dd/yyyy - hh:mm a"];
    self.lbTime.text = [NSString stringWithFormat:@"%@", dateString];
    
    if (visit.Staff)
    {
        self.lbTeacher.text = [NSString stringWithFormat:@"%@ %@", visit.Staff.FirstName, visit.Staff.LastName];
    }
    
    self.lbType.text = ![visit.AppointmentID isEqualToString:@"0"] ? @"Appointment" : @"Class";
    
    
    [SiteService GetLocationsWithBlock:^(LocationsResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (result.ErrorCode == 200)
            {
                NSArray *locations = (NSArray*)result.Locations;
                
                for (Location *loc in locations)
                {
                    if ([visit.Location.ID isEqualToString:loc.ID])
                    {
                        visit.Location = loc;
                    }
                }
                
                [self pinMap:visit.Location.Latitude :visit.Location.Longitude :0 :visit.Location.Name];
            }
        });
    }];
    

}

- (void)pinMap:(double)lat :(double)lng :(int)pinId :(NSString*)title
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = CLLocationCoordinate2DMake(lat, lng);
    pin.title = title;
    //pin.subtitle = @"here";
    
    [self.mkMap addAnnotation:pin];
    
    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake(lat, lng);

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1.0, 1.0);
    [self.mkMap setRegion:viewRegion animated:YES];
    
    //[self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate];
    [[self.mkMap viewForAnnotation:pin] setTag:pinId];
}
/*
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //7
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //8
    static NSString *identifier = @"anotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mkMap dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        //9
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorRed;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }
    else
    {
        annotationView.annotation = annotation;
    }
    //annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}*/

@end
