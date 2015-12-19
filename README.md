# API-Integration-iOS
MINDBODY SOAP API integration in Objective-C

This is a SOAP API facade and a demo for the API. This wrapper lets you integrate with the SOAP API with ease. The layer provides easy setup for the data access information and lets you build your own functions to fit your needs.

##Key features:
- Demonstrates simple API workflows including user validation, class booking, appointment booking, account payment processing, purchasing services, client and staff information, client schedules, and more!
- Easy integration (SDK like)
- Comes with documentation and guildlines
- Takes care of data parsing and object mapping, so you don't have to :)
- Uses block to handle response
- Flexibile, easily adjustible
- No dependencies! Built off the system libraries

##How to run
In the AppDelegate.m, define your source credentials there.

```Objective-C
    SourceCredentials *src = [SourceCredentials sharedInstance];
    src.SourceName = @"SourceName"; 
    src.Password = @"password"; 
    src.SiteID = @"-"; 
    
    // Only do this once unless you want to change the credentials along the way
    UserCredentials *user = [UserCredentials sharedInstance];
    user.Username = @"Username"; // Consumer/Staff/Owner credentials
    user.Password = @"password";
    user.SiteID = @"-";
```
Click 'Run'

You're all set.

##Use Example
- Copy "MINDBODY API" folder to your project. Then import "MBAPI.h".
- Define source credentials like above
- This is what it looks like when you make a call

```Objective-C
    [ClassService GetClassesFromDate:startDate toDate:endDate showOnlyEnrollables:YES withBlock:^(ClassesResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (result.ErrorCode == 200)
            {
                classes = result.Classes;
                // Update UI
            }
        });
    }];
```

##Notes:
- The UI is optimized for iPhone 5 (4.0inch).
- You only need to import "MBAPI.h" for each view controller.
- In Util.h, NSDateFormatter currently uses local. Modify the formatter as you wish. 

Enjoy building your own integration!
