

#import "ClassPassViewController.h"
#import "MBAPI.h"

@interface ClassPassViewController ()

@end

@implementation ClassPassViewController

- (id)initWithClassID:(NSString*)classID ClientID:(NSString*)clientID
{
    if (self = [super init])
    {
        [self setTitle:@"Pay with Pass"];
        
        currentClassID = classID;
        currentClientID = clientID;
        
        services = [[NSArray alloc] init];
        
        progressDialog = [[UIAlertView alloc] init];
        progressDialog.message = @"Processing...";
        
        [SiteService GetServiceCategoriesTypeClassWithBlock:^(ServiceCategoriesResult *result)
         {
             [self loadServices:result.Programs :clientID :classID];
         }];
    }
    return self;
}

- (void)loadServices:(NSMutableArray*)programs :(NSString*)clientID :(NSString*)classID
{
    // Get client's passes
    NSMutableArray *programIDs = [NSMutableArray new];
    for (ServiceCategory *obj in programs)
    {
        [programIDs addObject:obj.ID];
    }
    
    // Results from today to 2020
    NSDate *start = [Utils convertISOToDate:@"2010-01-01T00:00:00"];
    NSDate *end = [Utils convertISOToDate:@"2020-01-01T00:00:00"];
    
    [ClientService GetClientServicesWithClientID:clientID classID:classID serviceCategoryIDs:programIDs startDate:start endDate:end withBlock:^(ClientServicesResult *result)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             if (result.ErrorCode == 200)
             {
                 services = (NSArray*)result.Services;
                 [self.tableView reloadData];
             }
         });
     }];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return services.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    Service *item = (Service*)[services objectAtIndex:indexPath.row];
    cell.textLabel.text = item.Name;
    
    NSString *active = [Utils dateToString:item.ActiveDate format:@"yyyy/MM/dd"];
    NSString *expired = [Utils dateToString:item.ExpirationDate format:@"yyyy/MM/dd"];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", active, expired];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Service *item = (Service*)[services objectAtIndex:indexPath.row];
    currentPassID = item.ID;
    UIAlertView *confirmDialog = [[UIAlertView alloc] initWithTitle:@"Confirm and Pay"
                                        message:[NSString stringWithFormat:@"Do you want to use '%@' to pay for the class?", item.Name]
                                       delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"No", @"Yes", nil];
    [confirmDialog show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Pay
    if (buttonIndex == 1)
    {
        [progressDialog show];
        [ClassService AddClientToClassWithClientID:currentClientID classID:currentClassID serviceID:currentPassID sendClientEmail:NO  withBlock:^(ClassResult *result)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [progressDialog dismissWithClickedButtonIndex:123 animated:YES];
                
                if (result.ErrorCode == 200)
                {
                    UIAlertView *confirmDialog = [[UIAlertView alloc] initWithTitle:@"Done"
                                                                            message:@"Enrollment completed!"
                                                                           delegate:self
                                                                  cancelButtonTitle:@"Close"
                                                                  otherButtonTitles:nil];
                    [confirmDialog setTag:99];
                    [confirmDialog show];
                }
                else
                {
                    UIAlertView *confirmDialog = [[UIAlertView alloc] initWithTitle:@"Fail"
                                                                            message:@"Problem occured while booking."
                                                                           delegate:self
                                                                  cancelButtonTitle:@"Close"
                                                                  otherButtonTitles:nil];
                    [confirmDialog setTag:99];
                    [confirmDialog show];
                }
            });
        }];
    }
    else if (alertView.tag == 99)
    {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
    else
    {
        currentPassID = nil;
    }
}


@end