//
//  ApplePaymentService.h
//  Payments
//
//  Created by Mark Wong on 2022-05-24.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"

NS_ASSUME_NONNULL_BEGIN

@interface ApplePaymentService : NSObject <PaymentDelegate>

@end

NS_ASSUME_NONNULL_END
