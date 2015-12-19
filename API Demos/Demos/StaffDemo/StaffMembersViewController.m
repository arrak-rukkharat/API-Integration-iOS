//
//  StaffMembersViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "StaffMembersViewController.h"
#import "MBAPI.h"

@interface StaffMembersViewController ()

@end

@implementation StaffMembersViewController

- (id)init
{
    if (self = [super init])
    {
        [self setTitle:@"All Staff"];
        progressDialog = [[UIAlertView alloc] init];
        progressDialog.message = @"Loading...";
        self.staffList = [[NSArray alloc] init];
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
    [progressDialog show];
    [StaffService GetAllStaffWithBlock:^(StaffMembersResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [progressDialog dismissWithClickedButtonIndex:0 animated:YES];
            if (result.ErrorCode == 200)
            {
                self.staffList = result.StaffMembers;
                [self.tableView reloadData];
            }
        });
    }];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.staffList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    Staff *staff = (Staff*)[self.staffList objectAtIndex:indexPath.row];

    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", staff.LastName, staff.FirstName];
    
    if (staff.ImageURL)
    {
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:staff.ImageURL]];
        [cell.imageView setImage:[UIImage imageWithData:imgData scale:1.0]];
    }
    else
    {
        [cell.imageView setImage:[UIImage imageNamed:@"User"]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Staff *staff = [self.staffList objectAtIndex:indexPath.row];
    StaffViewController *vc = [[StaffViewController alloc] initWithStaff:staff];
    [self.navigationController pushViewController:vc animated:YES];
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
