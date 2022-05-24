//
//  ApplePaymentService.m
//  Payments
//
//  Created by Mark Wong on 2022-05-24.
//

#import "ApplePaymentService.h"

@implementation ApplePaymentService

- (void)processPaymentAmount:(NSInteger)paymentAmount {
  if ([self canProcessPayment]) {
    NSLog(@"Apple processed amount $%ld", paymentAmount);
  } else {
    NSLog(@"Sorry, the payment cannot be processed.");
  }
}

- (BOOL)canProcessPayment {
  return arc4random_uniform(2) == 0 ? NO : YES;
}

@end
