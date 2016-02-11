//
//  StaffScheduleViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "StaffScheduleViewController.h"
#import "MBAPI.h"

@interface StaffScheduleViewController ()

@end

@implementation StaffScheduleViewController


- (id)initWithStaffID:(NSString*)staffID
{
    if (self = [super init])
    {
        [self setTitle:@"Staff Appointments"];
        list = [[NSArray alloc] init];
        currentStaffID = staffID;
        noItemText = @"";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSDate *today = [NSDate date];
    NSDate *endDate = [NSDate dateWithTimeInterval:FUTURE_TIME sinceDate:today];
    
    [AppointmentService GetStaffAppointmentsWithStaffID:currentStaffID betweenDate:today andDate:endDate withBlock:^(AppointmentsResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (result.ErrorCode == 200)
            {
                list = result.Appointments;
                [self.tableView reloadData];
                noItemText = @"No schedule";
            }
        });
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (list.count == 0)
    {
        return 1;
    }
    
    return list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }

    if (list.count == 0)
    {
        cell.textLabel.text =  noItemText;
    }
    else
    {
        Appointment *appt = (Appointment*)[list objectAtIndex:indexPath.row];
        NSString *dateString = [Utils dateToString:appt.StartDateTime format:@"hh:mm - yyyy/MM/dd"];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", appt.SessionType.Name];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, with %@ %@", dateString, appt.Client.FirstName, appt.Client.LastName];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
