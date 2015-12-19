//
//  SessionsViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 12/3/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "SessionsViewController.h"
#import "BookablesViewController.h"
#import "MBAPI.h"
@interface SessionsViewController ()

@end

@implementation SessionsViewController

- (id)initWithClientIDOrNil:(NSString*)cltID programID:(NSString*)prgID title:(NSString*)title
{
    if (self = [super init])
    {
        [self setTitle:title];
        clientID = cltID;
        programID = prgID;
        header = title;
        sessions = [NSArray new];
        
        NSMutableArray *prgIDs = [NSMutableArray new];
        [prgIDs addObject:programID];
        [SiteService GetSessionTypesByserviceCategoryIDs:prgIDs withBlock:^(SessionTypesResult *result)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (result.ErrorCode == 200)
                 {
                     sessions = (NSArray*)result.SesstionTypes;
                     [self.tableView reloadData];
                 }
             });
         }];
    }
    [self.navigationItem.backBarButtonItem setTitle:@""];
    return self;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sessions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    SessionType *sess = [sessions objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", sess.Name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Tab the class for booking
    if (clientID)
    {
        SessionType *st = [sessions objectAtIndex:indexPath.row];
        BookablesViewController *t = [[BookablesViewController alloc] initWithClientIDOrNil:clientID sessiontypeID:st.ID sessionTitle:st.Name pageTitle:header];
        [self.navigationController pushViewController:t animated:YES];
    }
}

@end
