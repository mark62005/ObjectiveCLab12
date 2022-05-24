//
//  PaypalPaymentService.h
//  Payments
//
//  Created by Mark Wong on 2022-05-24.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaypalPaymentService : NSObject <PaymentDelegate>

@end

NS_ASSUME_NONNULL_END
