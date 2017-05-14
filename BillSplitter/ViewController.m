//
//  ViewController.m
//  BillSplitter
//
//  Created by Rushan on 2017-05-14.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *totalAmount;

@property (weak, nonatomic) IBOutlet UISlider *numbPeople;

@property (weak, nonatomic) IBOutlet UILabel *splittedAmount;

@end

@implementation ViewController

- (IBAction)calculateBill:(id)sender {
    int rounded = roundf(self.numbPeople.value);
    
    NSDecimalNumber *bill = [[NSDecimalNumber alloc]initWithString:self.totalAmount.text];
    
    NSDecimalNumber *people = [[NSDecimalNumber alloc] initWithInt:rounded];
    
    NSDecimalNumber *finalBill = [bill decimalNumberByDividingBy:people];
    
    NSNumberFormatter *amountFormatted = [[NSNumberFormatter alloc]init];
    [amountFormatted setNumberStyle:NSNumberFormatterCurrencyStyle];
    [amountFormatted setMaximumFractionDigits:2];
    
    NSString *aString = [amountFormatted stringFromNumber:finalBill];
    
    NSString *finalBillText = [NSString stringWithFormat:@"Split %@ each.", aString];
    self.splittedAmount.text = finalBillText;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
