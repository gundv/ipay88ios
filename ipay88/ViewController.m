//
//  ViewController.m
//  jpeg
//
//  Created by Neath on 10/12/18.
//  Copyright © 2018 Neath. All rights reserved.
//

#import "ViewController.h"
#import "Ipay.h"
#import "IpayPayment.h"


@interface ViewController ()<PaymentResultDelegate>

@end

@implementation ViewController{
    Ipay*paymentsdk;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)play:(id)sender {
    paymentsdk = [[Ipay alloc] init];
    paymentsdk.delegate = self;
    IpayPayment *payment = [[IpayPayment alloc] init];
    [payment setMerchantKey: @""]; //From IPay88 when merchant registered
    [payment setMerchantCode: @""]; //From IPay88 when merchant registered
    [payment setPaymentId: @"124"]; //payment method 1=VISA USD, 9=eMoney Metfone (USD), 10=eMoney Metfone (KHR), 123= E-Wings eWallet (USD), and 12`4= E-Wings eWallet (KHR)
    [payment setRefNo: @"A02122124"];
    [payment setAmount: @"1.00"]; //Must be decimal 2 digit at the end
    [payment setCurrency: @"USD"]; // valid only 'USD' or 'KHR'
    [payment setProdDesc: @"SHoes" ];
    [payment setUserName: @"Neat"];
    [payment setUserEmail: @"email@email"];
    [payment setUserContact: @"012345678"];
    //[payment setRemark:@"20181012433M"];
    //[payment setLang: @"ISO-8859-1"]; // Latin = ISO-8859-1, Unicode = UTF-8
    [payment setCountry: @"KH"];
    [payment setBackendPostURL:@"http://backend_url/ipay_response.php"]; //

    UIView *paymentView = [paymentsdk checkout:payment];
    [self.view addSubview:paymentView];
    
}


-(void)paymentSuccess:(NSString *)refNo withTransId:(NSString *)transId withAmount:(NSString *)amount withRemark:(NSString *)remark withAuthCode:(NSString *)authCode{
    NSLog(@"paymentSuccess");
}
-(void)paymentFailed:(NSString *)refNo withTransId:(NSString *)transId withAmount:(NSString *)amount withRemark:(NSString *)remark withErrDesc:(NSString *)errDesc{
    NSLog(@"paymentFailed, %@",errDesc);
}
- (void)paymentCancelled:(NSString *)refNo withTransId:(NSString *)transId withAmount:(NSString *)amount withRemark:(NSString *)remark withErrDesc:(NSString *)errDesc{
    
    NSLog(@"paymentCancelled");
}
- (void)requeryFailed:(NSString *)refNo withMerchantCode:(NSString *)merchantCode withAmount:(NSString *)amount withErrDesc:(NSString *)errDesc{
    
    NSLog(@"requeryFailed");
}
-(void)requerySuccess:(NSString *)refNo withMerchantCode:(NSString *)merchantCode withAmount:(NSString *)amount withResult:(NSString *)result{
    NSLog(@"requerySuccess");
}
@end
