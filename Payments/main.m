//
//  main.m
//  Payments
//
//  Created by Mark Wong on 2022-05-24.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"

NSString *getUserInput(NSString *prompt) {
  char inputChars[255];
  
  NSLog(@"%@", prompt);
  fgets(inputChars, 255, stdin);
  
  NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
  inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  NSLog(@"input %@", inputString);
  return inputString;
}

NSString *validatePaymentMethodInput(NSString *paymentMethodInput, int randDollarValue, NSString *menu) {
  while ([paymentMethodInput intValue] < 1 || [paymentMethodInput intValue] > 3) {
    NSLog(@"Please enter a number from 1-3.");
    paymentMethodInput = getUserInput(menu);
  }
  return paymentMethodInput;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    int randDollarValue = arc4random_uniform(901) + 100;
    NSString *menu = [NSString stringWithFormat:@"Thank you for shopping at Acme.com Your total today is $%d Please select your payment method: 1: Paypal, 2: Stripe, 3: Amazon, 4: Apple", randDollarValue];
    NSString *paymentMethodInput = getUserInput(menu);
    paymentMethodInput = validatePaymentMethodInput(paymentMethodInput, randDollarValue, menu);
    
    PaymentGateway *paymentGateway = [PaymentGateway new];
    PaypalPaymentService *paypalPaymentService = [PaypalPaymentService new];
    StripePaymentService *stripePaymentService = [StripePaymentService new];
    AmazonPaymentService *amazonPaymentService = [AmazonPaymentService new];
    switch ([paymentMethodInput intValue]) {
      case 1:
        paymentGateway.paymentDelegate = paypalPaymentService;
        break;
      case 2:
        paymentGateway.paymentDelegate = stripePaymentService;
        break;
      case 3:
        paymentGateway.paymentDelegate = amazonPaymentService;
        break;
      default:
        paymentGateway.paymentDelegate = paypalPaymentService;
        break;
    }
    [paymentGateway processPaymentAmount:randDollarValue];
  }
  return 0;
}
