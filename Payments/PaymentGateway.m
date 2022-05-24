//
//  PaymentGateway.m
//  Payments
//
//  Created by Mark Wong on 2022-05-24.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

- (void)processPaymentAmount: (NSInteger) paymentAmount {
  [self.paymentDelegate processPaymentAmount:paymentAmount];
}

@end
