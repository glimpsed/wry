//
//  StreamCommand.m
//  wry
//
//  Created by Rob Warner on 3/17/13.
//  Copyright (c) 2013 Rob Warner. All rights reserved.
//

#import "StreamCommand.h"
#import "ADNService.h"
#import "ADNPost.h"

@implementation StreamCommand

- (BOOL)run:(WryApplication *)app params:(NSArray *)params error:(NSError **)error {
  ADNService *service = [[ADNService alloc] initWithApplication:app];
  NSArray *posts = [service getUserStream:error];
  if (posts != nil) {
    for (ADNPost *post in posts) {
      [app println:post];
      [app println:@"--------------------"];
    }
    return YES;
  }
  return NO;
}

- (NSString *)help {
  return @"This is help for the stream command";
}

- (NSString *)summary {
  return @"Displays the current user's Stream";
}

@end
