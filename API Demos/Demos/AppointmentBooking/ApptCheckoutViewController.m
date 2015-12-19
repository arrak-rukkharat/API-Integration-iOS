

#import "ApptCheckoutViewController.h"
#import "AppCheckoutConfirmViewController.h"

@implementation ApptCheckoutViewController

- (id)initWithSessionTypeID:(NSString*)sessID ClientID:(NSString*)clientID schduleItem:(ScheduleItem*)scheduleItem
{
    if (self = [super init])
    {
        [self setTitle:@"Buy & Book"];
        
        sessionTypeID = sessID;
        currentClientID = clientID;
        schedule = scheduleItem;
        sessionTypes = [[NSArray alloc] init];
        
        progressDialog = [[UIAlertView alloc] init];
        progressDialog.message = @"Processing...";
        [self loadServices];
        
    }
    return self;
}

- (void)loadServices
{
    NSMutableArray *stids = [NSMutableArray new];
    [stids addObject:sessionTypeID];
    
    [SaleService GetServicesBySessionTypeIDs:stids withBlock:^(ServicesResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (result.ErrorCode == 200)
            {
                sessionTypes = result.Services;
                [self.tableView reloadData];
            }
        });
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (sessionTypes.count == 0)
    {
        return 1;
    }
    return sessionTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    if (sessionTypes.count > 0)
    {
        Service *item = (Service*)[sessionTypes objectAtIndex:indexPath.row];
        cell.textLabel.text = item.Name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"$ %@", item.OnlinePrice];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }
    else
    {
        cell.textLabel.text = @"No service for sale for this session";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [progressDialog show];
    
    Service *item = (Service*)[sessionTypes objectAtIndex:indexPath.row];
    cartItems = [NSMutableArray new];
    CartItem *ci = [CartItem new];
    ci.Quantity = 1;
    ci.Item = item;
    [cartItems addObject:ci];
    
    currentPassID = item.ID;
    
    [SaleService GetCartTotal:cartItems clientID:currentClientID promo:nil withBlock:^(ReceiptResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [progressDialog dismissWithClickedButtonIndex:UNDEFINED animated:YES];
            
            if (result.ErrorCode == 200)
            {
                grandTotal = result.Receipt.GrandTotal;
                AppCheckoutConfirmViewController *t = [[AppCheckoutConfirmViewController alloc] initWithScheduleItem:schedule clientID:currentClientID serviceID:currentPassID total:grandTotal];
                [self.navigationController pushViewController:t animated:YES];
            }
            else
            {
            }
        });
    }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
}


@end