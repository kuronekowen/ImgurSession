//
//  IMGNotificationTests.m
//  ImgurSession
//
//  Created by Xtreme Dev on 2014-03-20.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//


#import "IMGTestCase.h"

#warning: Must have at least one new and old notification

@interface IMGNotificationTests : IMGTestCase

@end


@implementation IMGNotificationTests

- (void)testLoadNotifications{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"freshnotification.json"];
    
    [IMGNotificationRequest notifications:^(NSArray * notifications) {
        
        expect(notifications).haveCountOf(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testViewedNotification{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"deletenotification.json"];

    //mark first one as viewed
    [IMGNotificationRequest notificationViewed:@"dsgdsg" success:^{
        
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testLoadStaleNotifications{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"allnotifications.json"];
    
    [IMGNotificationRequest notificationsWithFresh:NO success:^(NSArray * notifications) {
        
        expect(notifications).haveCountOf(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).willNot.beNil();
}
@end
