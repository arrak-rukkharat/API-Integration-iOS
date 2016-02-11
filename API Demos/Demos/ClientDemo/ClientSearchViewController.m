//
//  ClientSearchViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/24/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientSearchViewController.h"
#import "ClientViewController.h"
#import "MBAPI.h"

@interface ClientSearchViewController ()

@end

@implementation ClientSearchViewController

- (id)init
{
    if (self = [super init])
    {
        [self setTitle:@"Search Client"];
        self.results = [[NSArray alloc] init];
        progressDialog = [[UIAlertView alloc] init];
        progressDialog.message = @"Loading...";
        
        [self createSearchBar];
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
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createSearchBar
{
    float screenwidth = [[UIScreen mainScreen] bounds].size.width;
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, screenwidth, 64.0f)];
    searchBar.placeholder = @"Search name and email";
    searchBar.delegate = self;
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    searchDisplayController.searchBar.tintColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = searchBar;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xCell"];
    
    Client *client = [self.results objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", client.LastName, client.FirstName];
    cell.detailTextLabel.text = client.ID;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Client *client = (Client*)self.results[indexPath.row];
    
    ClientViewController *t = [[ClientViewController alloc] initWithClientID:client.ID];
    [self.navigationController pushViewController:t animated:YES];
}

#pragma mark - UISearchDisplay delegates

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    if (![searchBar.text isEqualToString:@""])
    {
        [progressDialog show];
        [ClientService SearchClientsWithText:searchBar.text resultLimit:50 withBlock:^(ClientsResult *result)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 [progressDialog dismissWithClickedButtonIndex:0 animated:YES];
                 
                 if (result.ErrorCode == 200)
                 {
                     self.results = result.Clients;
                     [self.tableView reloadData];
                     [self.searchDisplayController setActive:NO animated:YES];
                 }
             });
         }];
    }
}
@end
