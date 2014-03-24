//
//  ImgurSession_Tests.m
//  ImgurSession Tests
//
//  Created by Geoff MacDonald on 2014-03-07.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//

#import "IMGTestCase.h"

#warning: Tests requires client id, client secret filled out in tests plist
#warning: Tests must have refresh token filled out in tests plist in order to work on iPhone

@interface IMGAccountTests : IMGTestCase

@end

@implementation IMGAccountTests

#pragma mark - Test Account endpoints


- (void)testAccountLoadMe{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myaccount.json"];
    
    [IMGAccountRequest accountWithUser:@"me" success:^(IMGAccount *account) {
        
        expect(account).beTruthy();
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountLoadMyFavs{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myfavs.json"];
    
    [IMGAccountRequest accountFavouritesWithSuccess:^(NSArray * favorites) {
        
        expect(favorites).haveCountOf(2);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountLoadMySubmissions{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"mysubmissions.json"];
    
    [IMGAccountRequest accountSubmissionsWithUser:@"me" withPage:0 success:^(NSArray * submissions) {
        
        expect(submissions).haveCountOf(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountSettingsLoad{
    
    __block IMGAccountSettings *set;
    [self stubWithFile:@"mysettings.json"];
    
    [IMGAccountRequest accountSettings:^(IMGAccountSettings *settings) {
        
        expect(settings.email).beTruthy();
        set = settings;

    } failure: failBlock];
    
    expect(set).willNot.beNil();
}

- (void)testAccountSettingsChange{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"mysettingschange.json"];
    
    [IMGAccountRequest changeAccountWithBio:@"test bio" messagingEnabled:YES publicImages:YES albumPrivacy:IMGAlbumPublic acceptedGalleryTerms:YES success:^{
        
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).willNot.beNil();
}

//- (void)testAccountReplies{
//    
//    __block BOOL isSuccess;
//    [self stubWithFile:@"myreplies.json"];
//    
//    [IMGAccountRequest accountReplies:^(NSArray * replies) {
//
//        isSuccess = YES;
//        
//    } failure:failBlock];
//    
//    expect(isSuccess).will.beTruthy();
//}

- (void)testAccountCommentIDs{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"mycommentids.json"];
    
    [IMGAccountRequest accountCommentIDsWithUser:@"me" success:^(NSArray * commentIds) {
        
        expect(commentIds).haveCountOf(1);
        isSuccess = YES;

    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountComments{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"mycomments.json"];
    
    [IMGAccountRequest accountCommentsWithUser:@"me" success:^(NSArray * comments) {
        
        expect(comments).haveCountOf(1);
        isSuccess = YES;

    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountCommentWithID{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"mycommentwithid.json"];
    
    [IMGAccountRequest accountCommentWithID:15325 success:^(IMGComment * firstComment) {
        
        expect(firstComment.caption).beTruthy();
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountCommentCount{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"mycommentcount.json"];
    
    [IMGAccountRequest accountCommentCount:@"me" success:^(NSUInteger numcomments) {
        
        expect(numcomments).equal(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountImageIDS{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myimageIDs.json"];
    
    [IMGAccountRequest accountImageIDsWithUser:@"me" success:^(NSArray * images) {
        
        expect(images).haveCountOf(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountImages{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myimages.json"];
    
    [IMGAccountRequest accountImagesWithUser:@"me" withPage:0 success:^(NSArray * images) {
        
        expect(images).haveCountOf(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountImageWithID{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myimagewithid.json"];
    
    [IMGAccountRequest accountImageWithID:@"dshfudsf" success:^(IMGImage * image) {
        
        expect(image.deletehash).beTruthy();
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountImageCount{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myimagecount.json"];
    
    [IMGAccountRequest accountImageCount:@"me" success:^(NSUInteger num) {
        
        expect(num).equal(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountAlbumIDs{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myalbumids.json"];
    
    [IMGAccountRequest accountAlbumIDsWithUser:@"me" success:^(NSArray  * albumIDs) {
        
        expect(albumIDs).haveCountOf(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountAlbums{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myalbums.json"];
    
    [IMGAccountRequest accountAlbumsWithUser:@"me" withPage:0 success:^(NSArray * albums) {
        
        expect(albums).haveCountOf(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountAlbumWithID{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myalbumwithid.json"];
    
    [IMGAccountRequest accountAlbumWithID:@"dshfudsf" success:^(IMGAlbum * album) {
        
        expect(album.deletehash).beTruthy();
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

- (void)testAccountAlbumCount{
    
    __block BOOL isSuccess;
    [self stubWithFile:@"myalbumcount.json"];
    
    [IMGAccountRequest accountAlbumCountWithUser:@"me" success:^(NSUInteger num) {
        
        expect(num).equal(1);
        isSuccess = YES;
        
    } failure:failBlock];
    
    expect(isSuccess).will.beTruthy();
}

-(void)testAccountCommentDelete{
    
    __block BOOL isDeleted;
    [self stubWithFile:@"mycommentdeletewithid.json"];

    [IMGAccountRequest accountDeleteCommentWithID:5325235 success:^{
        
        isDeleted = YES;
        
    } failure:failBlock];
    
    expect(isDeleted).will.beTruthy();
}

-(void)testAccountImageDelete{
    
    __block BOOL isDeleted;
    [self stubWithFile:@"myimagedelete.json"];
    
    [IMGAccountRequest accountDeleteImageWithHash:@"fdshbfdjshfs" success:^() {
        
        isDeleted = YES;

    } failure:failBlock];
    
    expect(isDeleted).will.beTruthy();
}

-(void)testAccountAlbumDelete{
    
    __block BOOL isDeleted;
    [self stubWithFile:@"myimagedelete.json"];
    
    [IMGAccountRequest accountDeleteAlbumWithID:@"3fdsfds436436" success:^{
        
        isDeleted = YES;
        
    } failure:failBlock];
    
    expect(isDeleted).will.beTruthy();
}

@end
