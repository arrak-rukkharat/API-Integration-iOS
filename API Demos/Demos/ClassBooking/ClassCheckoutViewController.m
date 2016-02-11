

#import "ClassCheckoutViewController.h"
#import "MBAPI.h"
#import "ClassPassViewController.h"

@interface ClassCheckoutViewController ()

@end

@implementation ClassCheckoutViewController

- (id)initWithClass:(C1ass*)class ClientID:(NSString*)clientID
{
    if (self = [super init])
    {
        [self setTitle:@"Buy Class Pass"];
        
        currentClientID = clientID;
        currentClass = class;
        
        services = [[NSArray alloc] init];
        
        progressDialog = [[UIAlertView alloc] init];
        progressDialog.message = @"Processing...";
        
        [self loadServices];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *btMyPasses = [[UIBarButtonItem alloc] initWithTitle:@"My Passes" style:UIBarButtonItemStylePlain target:self action:@selector(useExsistingPasses)];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects: btMyPasses, nil];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)useExsistingPasses
{
    ClassPassViewController *t = [[ClassPassViewController alloc] initWithClassID:currentClass.ID ClientID:currentClientID];
    [self.navigationController pushViewController:t animated:YES];
}

- (void)loadServices
{
    
    [SaleService GetServicesByClassID:currentClass.ID withBlock:^(ServicesResult *result)
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
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [progressDialog show];
    Service *service = [services objectAtIndex:indexPath.row];
    cartItems = [NSMutableArray new];
    CartItem *ci = [CartItem new];
    ci.Quantity = 1;
    ci.Item = service;
    [cartItems addObject:ci];
    
    [SaleService GetCartTotalWithCartItems:cartItems clientID:currentClientID promo:nil withBlock:^(ReceiptResult *result)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             
             [progressDialog dismissWithClickedButtonIndex:0 animated:YES];
             
             if (result.ErrorCode == 200)
             {
                 ClassCheckoutConfirmViewController *t = [[ClassCheckoutConfirmViewController alloc] initWithClass:currentClass clientID:currentClientID service:service total:result.Receipt.GrandTotal];
                 [self.navigationController pushViewController:t animated:YES];
             }
             else
             {
             }
         });
     }];
    

}

@end