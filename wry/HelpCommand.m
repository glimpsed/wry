//
//  HelpCommand.m
//  wry
//
//  Created by Rob Warner on 3/10/13.
//  Copyright (c) 2013 Rob Warner. All rights reserved.
//

#import "HelpCommand.h"

@implementation HelpCommand

- (BOOL)run:(WryApplication *)app params:(NSArray *)params error:(NSError **)error {
  [app println:[app helpLine]];
  [app println:@"Usage:"];
  [app println:[NSString stringWithFormat:@"%@ <command> <params>", app.appName]];
  return YES;
}

- (NSString *)help {
  return @"This is help for the help command";
}

- (NSString *)summary {
  return @"Shows help";
}

@end
