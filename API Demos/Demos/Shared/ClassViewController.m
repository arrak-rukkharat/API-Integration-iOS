//
//  ClassViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 12/1/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClassViewController.h"
#import "ClassPassViewController.h"
#import "ClassCheckoutViewController.h"

@implementation ClassViewController

- (id)initWithClientIDOrNil:(NSString*)clientIDForBooking
{
    if (self = [super init])
    {
        [self setTitle:@"Classes"];
        clientID = clientIDForBooking;
        [self initilize];
    }
    return self;
}

- (void)initilize
{
    progressDialog = [[UIAlertView alloc] init];
    progressDialog.message = @"Loading...";
    
    classes = [NSArray new];
    [self loadToday];
}

- (void)loadClasses
{
    [progressDialog show];
    [ClassService GetClassesBetweenDate:startDate andDate:endDate withinSchedulingWindow:YES withBlock:^(ClassesResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [progressDialog dismissWithClickedButtonIndex:0 animated:YES];
            
            if (result.ErrorCode == 200)
            {
                classes = result.Classes;
                [self.tableView reloadData];
            }
        });
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *btToday = [[UIBarButtonItem alloc] initWithTitle:@"Today" style:UIBarButtonItemStylePlain target:self action:@selector(loadToday)];
    UIBarButtonItem *btNext = [[UIBarButtonItem alloc] initWithTitle:@">" style:UIBarButtonItemStylePlain target:self action:@selector(loadNextDay)];
    UIBarButtonItem *btPrev = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStylePlain target:self action:@selector(loadPreviousDay)];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects: btNext, btPrev, btToday, nil];
    
    if (clientID == nil)
    {
        self.tableView.allowsSelection = NO;
    }
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)loadToday
{
    startDate = [NSDate date];
    endDate = startDate;
    [self loadClasses];
}

- (void)loadNextDay
{
    startDate = [NSDate dateWithTimeInterval:DAY_INCREMENT sinceDate:startDate];
    endDate = startDate;
    [self loadClasses];
}

- (void)loadPreviousDay
{
    startDate = [NSDate dateWithTimeInterval:-DAY_INCREMENT sinceDate:startDate];
    endDate = startDate;
    [self loadClasses];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [Utils dateToString:startDate format:@"MMMM dd, yyyy"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return classes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListCellId";
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = (ListCell*)[ListCell cellFromNibNamed:@"ListCell"];
    }
    
    C1ass *class = [classes objectAtIndex:indexPath.row];
    cell.lbCapacity.text = [NSString stringWithFormat:@"%d/%d", class.TotalBooked, class.MaxCapacity];
    cell.title.text = class.ClassDescription.Name;
    
    NSString *dateString = [Utils dateToString:class.StartDateTime format:@"hh:mm a"];
    cell.subtitle.text = [NSString stringWithFormat:@"%@ with %@ %@", dateString, class.Staff.FirstName, class.Staff.LastName];
    float progressValue = ((float)class.TotalBooked / (float)class.MaxCapacity);
    [cell.pvCapacity setProgress:progressValue animated:YES];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Tab the class for booking
    if (clientID)
    {
        C1ass *class = [classes objectAtIndex:indexPath.row];
        ClassCheckoutViewController *t = [[ClassCheckoutViewController alloc] initWithClass:class ClientID:clientID];
        [self.navigationController pushViewController:t animated:YES];
    }
}

@end
