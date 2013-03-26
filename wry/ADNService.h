//
//  ADNService.h
//  wry
//
//  Created by Rob Warner on 3/12/13.
//  Copyright (c) 2013 Rob Warner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ADNUser;
@class WryApplication;
@class ADNPost;

@interface ADNService : NSObject <NSURLConnectionDataDelegate>

@property(nonatomic, strong) WryApplication *app;
@property(nonatomic, strong) NSMutableData *data;
@property(nonatomic, strong) NSError *error;

- (id)initWithApplication:(WryApplication *)app;
- (ADNUser *)getUser:(NSError **)error;
- (ADNUser *)getUser:(NSString *)username error:(NSError **)error;
- (NSArray *)getFollowers:(NSError **)error;
- (NSArray *)getFollowers:(NSString *)username error:(NSError **)error;
- (NSArray *)getFollowing:(NSError **)error;
- (NSArray *)getFollowing:(NSString *)username error:(NSError **)error;
- (NSArray *)getMuted:(NSError **)error;
- (NSArray *)getMuted:(NSString *)username error:(NSError **)error;
- (NSArray *)getUserStream:(NSError **)error;
- (NSArray *)getGlobalStream:(NSError **)error;
- (NSArray *)getUnifiedStream:(NSError **)error;
- (NSArray *)getMentions:(NSError **)error;
- (NSArray *)getMentions:(NSString *)username error:(NSError **)error;
- (NSArray *)getPosts:(NSError **)error;
- (NSArray *)getPosts:(NSString *)username error:(NSError **)error;
- (ADNPost *)createPost:(NSString *)text replyID:(NSString *)replyID error:(NSError **)error;
- (ADNPost *)showPost:(NSString *)postID error:(NSError **)error;
- (NSArray *)getReplies:(NSString *)postID error:(NSError **)error;
- (ADNPost *)repost:(NSString *)postID error:(NSError **)error;
- (ADNPost *)star:(NSString *)postID error:(NSError **)error;
- (ADNPost *)delete:(NSString *)postID error:(NSError **)error;
- (ADNUser *)follow:(NSString *)username error:(NSError **)error;
- (ADNUser *)unfollow:(NSString *)username error:(NSError **)error;
- (ADNUser *)mute:(NSString *)username error:(NSError **)error;
- (ADNUser *)unmute:(NSString *)username error:(NSError **)error;
- (ADNUser *)block:(NSString *)username error:(NSError **)error;
- (ADNUser *)unblock:(NSString *)username error:(NSError **)error;

@end
