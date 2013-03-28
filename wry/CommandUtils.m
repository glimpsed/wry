//
//  CommandUtils.m
//  wry
//
//  Created by Rob Warner on 3/26/13.
//  Copyright (c) 2013 Rob Warner. All rights reserved.
//

#import "CommandUtils.h"
#import "WryApplication.h"
#import "WryErrorCodes.h"
#import "ADNService.h"

@implementation CommandUtils

+ (BOOL)performObjectOperation:(WryApplication *)app
                        params:(NSArray *)params
                 minimumParams:(NSInteger)minimumParams
                successMessage:(NSString *)successMessage
                  errorMessage:(NSString *)errorMessage
                         error:(NSError **)error
                     operation:(ADNOperationBlock)operation {
  BOOL success = YES;
  if (params.count < minimumParams) {
    if (error != NULL) {
      *error = [NSError errorWithDomain:app.errorDomain
                                   code:WryErrorCodeBadInput userInfo:@{NSLocalizedDescriptionKey : errorMessage}];
    }
    success = NO;
  } else {
    ADNService *service = [[ADNService alloc] initWithApplication:app];
    id object = operation(service);
    if (object != nil) {
      if (successMessage != nil) {
        [app println:successMessage];
      }
      [app println:object];
    } else {
      // Service might have supplied an error; if not, supply one
      if (error != NULL && *error == nil) {
        *error = [NSError errorWithDomain:app.errorDomain
                                     code:WryErrorCodeUnknown
                                 userInfo:@{NSLocalizedDescriptionKey : @"The operation was unsuccessful"}];
      }
      success = NO;
    }
  }
  return success;
}

+ (BOOL)performListOperation:(WryApplication *)app
                      params:(NSArray *)params
               minimumParams:(NSInteger)minimumParams
              successMessage:(NSString *)successMessage
                errorMessage:(NSString *)errorMessage
                       error:(NSError **)error
                   operation:(ADNOperationBlock)operation {
  BOOL success = YES;
  if (params.count < minimumParams) {
    if (error != NULL) {
      *error = [NSError errorWithDomain:app.errorDomain
                                   code:WryErrorCodeBadInput userInfo:@{NSLocalizedDescriptionKey : errorMessage}];
    }
    success = NO;
  } else {
    ADNService *service = [[ADNService alloc] initWithApplication:app];
    NSArray *list = operation(service);
    if (list != nil) {
      if (list.count > 0) {
        if (successMessage != nil) {
          [app println:successMessage];
        }
        for (id item in list) {
          [app println:item];
          [app println:@"--------------------"];
        }
      }
    } else {
      // Service might have supplied an error; if not, supply one
      if (error != NULL && *error == nil) {
        *error = [NSError errorWithDomain:app.errorDomain
                                     code:WryErrorCodeUnknown
                                 userInfo:@{NSLocalizedDescriptionKey : @"The operation was unsuccessful"}];
      }
      success = NO;
    }
  }
  return success;
}

@end
