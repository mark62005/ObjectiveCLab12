//
//  PaymentGateway.h
//  Payments
//
//  Created by Mark Wong on 2022-05-24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PaymentGateway;

@protocol PaymentDelegate <NSObject>

- (void)processPaymentAmount: (NSInteger) paymentAmount;
- (BOOL)canProcessPayment; 

@end

@interface PaymentGateway : NSObject

@property (nonatomic, weak) id<PaymentDelegate> paymentDelegate;

- (void)processPaymentAmount: (NSInteger) paymentAmount;

@end

NS_ASSUME_NONNULL_END
