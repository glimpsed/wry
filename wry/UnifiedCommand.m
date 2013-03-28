//
//  UnifiedCommand.m
//  wry
//
//  Created by Rob Warner on 3/17/13.
//  Copyright (c) 2013 Rob Warner. All rights reserved.
//

#import "UnifiedCommand.h"
#import "ADNService.h"
#import "CommandUtils.h"

@implementation UnifiedCommand

- (BOOL)run:(WryApplication *)app params:(NSArray *)params error:(NSError **)error {
  return [CommandUtils performListOperation:app
                                     params:params
                              minimumParams:0
                             successMessage:@"Unified stream:"
                               errorMessage:nil
                                      error:error
                                  operation:^id(ADNService *service) {
                                    return [service getUnifiedStream:error];
                                  }];
}

- (NSString *)usage {
  return @"";
}

- (NSString *)help {
  NSMutableString *help = [[NSMutableString alloc] init];
  [help appendString:@"Displays your unified stream, which contains the most recent posts from\n"];
  [help appendString:@"the users you follow, mixed with the posts you're mentioned in."];
  return help;
}

- (NSString *)summary {
  return @"Display the current user's unified stream";
}

@end
