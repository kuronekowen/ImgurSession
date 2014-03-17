//
//  IMGGalleryProfile.h
//  ImgurSession
//
//  Created by Geoff MacDonald on 2014-03-15.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//

#import "IMGModel.h"


@interface IMGGalleryTrophy : IMGModel

/**
 Trophy ID
 */
@property (readonly,nonatomic) NSString * trophyId;
/**
 The name of the trophy
 */
@property (readonly,nonatomic) NSString * name;
/**
 Can be thought of as the ID of a trophy type
 */
@property (readonly,nonatomic) NSString * type;
/**
 A description of the trophy and how it was earned.
 */
@property (readonly,nonatomic) NSString * description;
/**
 The ID of the image or the ID of the comment where the trophy was earned
 */
@property (readonly,nonatomic) NSString * data;
/**
 A link to where the trophy was earned
 */
@property (readonly,nonatomic) NSURL * link;
/**
 Date the trophy was earned, epoch time
 */
@property (readonly,nonatomic) NSDate *dateAwarded;
/**
 Image URL for trophy representation
 */
@property (readonly,nonatomic) NSURL * imageUrl;



@end

/**
 Model object class to represent user gallery profile. https://api.imgur.com/models/gallery_profile
 */
@interface IMGGalleryProfile : IMGModel

/**
 Total number of comments the user has made in the gallery
 */
@property (readonly,nonatomic) NSInteger totalComments;
/**
 Total number of images lIMGed by the user in the gallery
 */
@property (readonly,nonatomic) NSInteger totalLIMGes;
/**
 Total number of images submitted by the user.
 */
@property (readonly,nonatomic) NSInteger totalSubmissions;
/**
 An array of trophies that the user has.
 */
@property (readonly,nonatomic) NSArray * trophies;





@end
