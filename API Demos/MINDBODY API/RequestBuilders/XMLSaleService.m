//
//  XMLSaleService.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "XMLSaleService.h"

@implementation XMLSaleService

+ (NSURLRequest*) SOAPGetServicesByClassID:(NSString*)classID byClassScheduleID:(NSString*)scheduleID byserviceCategoryIDs:(NSArray*)serviceCategoryIDs bySessionTypeIDs:(NSArray*)sessionTypeIDs byServiceIDs:(NSArray*)serviceIDs
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetServices xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    
    if (classID) [soap appendString:[NSString stringWithFormat:@"<ClassID>%@</ClassID>", classID]];
    if (scheduleID) [soap appendString:[NSString stringWithFormat:@"<ClassScheduleID>%@</ClassScheduleID>", scheduleID]];
    
    // Filter by service category  IDs
    if (serviceCategoryIDs)
    {
        [soap appendString:@"<ProgramIDs>"];
        for (NSString *ID in serviceCategoryIDs)
        {
            [soap appendString:@"<int>"];
            [soap appendString:ID];
            [soap appendString:@"</int>"];
        }
        [soap appendString:@"</ProgramIDs>"];
    }
    
    // Filter by session type IDs
    if (sessionTypeIDs)
    {
        [soap appendString:@"<SessionTypeIDs>"];
        for (NSString *ID in sessionTypeIDs)
        {
            [soap appendString:@"<int>"];
            [soap appendString:ID];
            [soap appendString:@"</int>"];
        }
        [soap appendString:@"</SessionTypeIDs>"];
    }
    
    // Filter by service IDs
    if (serviceIDs)
    {
        [soap appendString:@"<ServiceIDs>"];
        for (NSString *ID in serviceIDs)
        {
            [soap appendString:@"<int>"];
            [soap appendString:ID];
            [soap appendString:@"</int>"];
        }
        [soap appendString:@"</ServiceIDs>"];
    }
    [soap appendString:@"<SellOnline>true</SellOnline>"];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetServices></soapenv:Body></soapenv:Envelope>"];
    
    //NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SALE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetServices"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*) SOAPGetSalesFromDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime filterByPaymentMethodID:(NSString*)paymentMethodID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetSales xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    if (paymentMethodID) [soap appendString:[NSString stringWithFormat:@"<PaymentMethodID>%@</PaymentMethodID>", paymentMethodID]];
    
    [soap appendString:[NSString stringWithFormat:@"<StartSaleDateTime>%@</StartSaleDateTime>", [Utils convertDateToISO:startDateTime]]];
    [soap appendString:[NSString stringWithFormat:@"<EndSaleDateTime>%@</EndSaleDateTime>", [Utils convertDateToISO:endDateTime]]];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetSales></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SALE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetSales"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*) SOAPGetPackagesOnlineOnly:(BOOL)onlineOnly
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetPackages xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    [soap appendString:[NSString stringWithFormat:@"<SellOnline>%@</SellOnline>", onlineOnly ? @"true" : @"false"]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetPackages></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SALE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetPackages"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*) SOAPGetProducts:(NSString*)searchText byCategoryIDs:(NSArray*)categoryIDs bySubCategoryIDs:(NSArray*)subCategoryIDs byProductIDs:(NSArray*)productIDs
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetProducts xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    
    if (searchText)
    {
        [soap appendString:[NSString stringWithFormat:@"<SearchText>%@</SearchText>", searchText]];
        [soap appendString:@"<SearchDomain>Name</SearchDomain>"];
    }
    
    if (categoryIDs && categoryIDs.count > 0)
    {
        [soap appendString:@"<CategoryIDs>"];
        for (NSString *ID in categoryIDs)
        {
            [soap appendString:@"<int>"];
            [soap appendString:ID];
            [soap appendString:@"</int>"];
        }
        [soap appendString:@"</CategoryIDs>"];
    }
    
    if (subCategoryIDs && subCategoryIDs.count > 0)
    {
        [soap appendString:@"<SubCategoryIDs>"];
        for (NSString *ID in subCategoryIDs)
        {
            [soap appendString:@"<int>"];
            [soap appendString:ID];
            [soap appendString:@"</int>"];
        }
        [soap appendString:@"</SubCategoryIDs>"];
    }
    
    if (productIDs && productIDs.count > 0)
    {
        [soap appendString:@"<ProductIDs>"];
        for (NSString *ID in productIDs)
        {
            [soap appendString:@"<int>"];
            [soap appendString:ID];
            [soap appendString:@"</int>"];
        }
        [soap appendString:@"</ProductIDs>"];
    }
    
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetProducts></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SALE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetProducts"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*) SOAPCheckoutCartItems:(NSArray*)cartItems clientID:(NSString*)clientID payment:(PaymentInfo*)payment visitIDOrNil:(NSString*)visitID scheduleItem:(ScheduleItem*)sch classID:(NSString*)classID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<CheckoutShoppingCart xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    [soap appendString:[NSString stringWithFormat:@"<ClientID>%@</ClientID>", clientID]];
    
    if (payment.SendEmail)
    {
        [soap appendString:[NSString stringWithFormat:@"<SendEmail>%@</SendEmail>", payment.SendEmail ? @"true" : @"false"]];
    }
    
    if (payment.Promocode)
    {
        [soap appendString:[NSString stringWithFormat:@"<PromotionCode>%@</PromotionCode>", payment.Promocode]];
    }
    
    // Render cart items in XML
    if (cartItems && cartItems.count > 0)
    {
        [soap appendString:@"<CartItems>"];
        for (CartItem *cartItem in cartItems)
        {
            [soap appendString:@"<CartItem>"];
            [soap appendString:[NSString stringWithFormat:@"<Quantity>%d</Quantity>", cartItem.Quantity]];
            [soap appendString:[NSString stringWithFormat:@"<Item xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xsi:type=\"%@\">", NSStringFromClass([cartItem.Item class])]];
            [soap appendString:[NSString stringWithFormat:@"<ID>%@</ID>", cartItem.Item.ID]];
            [soap appendString:@"</Item>"];
            // Reconcile unpaid
            if (visitID) [soap appendString:[NSString stringWithFormat:@"<VisitIDs><int>%@</int></VisitIDs>", visitID]];
            
            // Buy and book in one step (appointment)
            if (sch)
            {
                [soap appendString:@"<Appointments><Appointment>"];
                [soap appendString:[NSString stringWithFormat:@"<StartDateTime>%@</StartDateTime>", [Utils convertDateToISO:sch.StartDateTime]]];
                [soap appendString:[NSString stringWithFormat:@"<Location><ID>%@</ID></Location>", sch.Location.ID]];
                [soap appendString:[NSString stringWithFormat:@"<Staff><ID>%@</ID></Staff>", sch.Staff.ID]];
                [soap appendString:[NSString stringWithFormat:@"<SessionType><ID>%@</ID></SessionType>", sch.SessionType.ID]];
                [soap appendString:@"</Appointment></Appointments>"];
            }
            
            // Buy and enroll in one step (class)
            else if (classID)
            {
                [soap appendString:[NSString stringWithFormat:@"<ClassIDs><int>%@</int></ClassIDs>", classID]];
            }
            
            [soap appendString:@"</CartItem>"];
        }
        [soap appendString:@"</CartItems>"];
    }
    
    // Payment info
    // Credit card
    if ([payment isKindOfClass:[PaymentInfoCard class]])
    {
        PaymentInfoCard *pmt = (PaymentInfoCard*)payment;
        ClientCreditCard *card = pmt.card;
        [soap appendString:@"<Payments>"];
        [soap appendString:@"<PaymentInfo xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xsi:type=\"CreditCardInfo\">"];
        [soap appendString:[NSString stringWithFormat:@"<CreditCardNumber>%@</CreditCardNumber>", card.CardNumber]];
        [soap appendString:[NSString stringWithFormat:@"<Amount>%@</Amount>", pmt.AmountTotal]];
        [soap appendString:[NSString stringWithFormat:@"<BillingAddress>%@</BillingAddress>", card.Address]];
        [soap appendString:[NSString stringWithFormat:@"<BillingCity>%@</BillingCity>", card.City]];
        [soap appendString:[NSString stringWithFormat:@"<BillingState>%@</BillingState>", card.State]];
        [soap appendString:[NSString stringWithFormat:@"<BillingPostalCode>%@</BillingPostalCode>", card.PostalCode]];
        [soap appendString:[NSString stringWithFormat:@"<ExpYear>%@</ExpYear>", card.ExpYear]];
        [soap appendString:[NSString stringWithFormat:@"<ExpMonth>%@</ExpMonth>", card.ExpMonth]];
        [soap appendString:[NSString stringWithFormat:@"<BillingName>%@</BillingName>", card.CardHolder]];
        [soap appendString:@"</PaymentInfo>"];
        [soap appendString:@"</Payments>"];
    }
    
    else if ([payment isKindOfClass:[PaymentInfoGiftCard class]])
    {
        PaymentInfoGiftCard *pmt = (PaymentInfoGiftCard*)payment;
        [soap appendString:@"<Payments>"];
        [soap appendString:@"<PaymentInfo xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xsi:type=\"GiftCardInfo\">"];
        [soap appendString:[NSString stringWithFormat:@"<CardNumber>%@</CardNumber>", pmt.GiftCardNumber]];
        [soap appendString:[NSString stringWithFormat:@"<Amount>%@</Amount>", pmt.AmountTotal]];
        [soap appendString:@"</PaymentInfo>"];
        [soap appendString:@"</Payments>"];
    }
    
    else if ([payment isKindOfClass:[PaymentInfoAccount class]])
    {
        PaymentInfoAccount *pmt = (PaymentInfoAccount*)payment;
        [soap appendString:@"<Payments>"];
        [soap appendString:@"<PaymentInfo xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xsi:type=\"DebitAccountInfo\">"];
        [soap appendString:[NSString stringWithFormat:@"<Amount>%@</Amount>", pmt.AmountTotal]];
        [soap appendString:@"</PaymentInfo>"];
        [soap appendString:@"</Payments>"];
    }
    
    else if ([payment isKindOfClass:[PaymentInfoCash class]])
    {
        PaymentInfoCash *pmt = (PaymentInfoCash*)payment;
        [soap appendString:@"<Payments>"];
        [soap appendString:@"<PaymentInfo xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xsi:type=\"DebitAccountInfo\">"];
        [soap appendString:[NSString stringWithFormat:@"<Amount>%@</Amount>", pmt.AmountTotal]];
        [soap appendString:@"</PaymentInfo>"];
        [soap appendString:@"</Payments>"];
    }
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></CheckoutShoppingCart></soapenv:Body></soapenv:Envelope>"];
    
    //NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SALE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"CheckoutShoppingCart"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*) SOAPGetCartTotal:(NSArray*)cartItems clientID:(NSString*)clientID promo:(NSString*)promocode
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<CheckoutShoppingCart xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    [soap appendString:[NSString stringWithFormat:@"<ClientID>%@</ClientID>", clientID]];

    [soap appendString:@"<SendEmail>false</SendEmail>"];
    [soap appendString:@"<Test>true</Test>"];
    [soap appendString:@"<Fields><string>paymentcheck</string></Fields>"];
    if (promocode) [soap appendString:[NSString stringWithFormat:@"<PromotionCode>%@</PromotionCode>", promocode]];
    
    // Render cart items in XML
    if (cartItems && cartItems.count > 0)
    {
        [soap appendString:@"<CartItems>"];
        for (CartItem *cartItem in cartItems)
        {
            [soap appendString:@"<CartItem>"];
            [soap appendString:[NSString stringWithFormat:@"<Quantity>%d</Quantity>", cartItem.Quantity]];
            [soap appendString:[NSString stringWithFormat:@"<Item xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xsi:type=\"%@\">", NSStringFromClass([cartItem.Item class])]];
            [soap appendString:[NSString stringWithFormat:@"<ID>%@</ID>", cartItem.Item.ID]];
            [soap appendString:@"</Item>"];
            [soap appendString:@"</CartItem>"];
        }
        [soap appendString:@"</CartItems>"];
    }

    [soap appendString:@"<Payments>"];
    [soap appendString:@"<PaymentInfo xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xsi:type=\"CompInfo\">"];
    [soap appendString:@"<Amount>0</Amount>"];
    [soap appendString:@"</PaymentInfo>"];
    [soap appendString:@"</Payments>"];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></CheckoutShoppingCart></soapenv:Body></soapenv:Envelope>"];
    
    //NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SALE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"CheckoutShoppingCart"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}


@end
