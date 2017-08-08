//
//  ViewController.m
//  firstDiscountProject
//
//  Created by zhuo ru li on 6/25/17.
//  Copyright © 2017 zhuo ru li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *controlPad;
@property (weak, nonatomic) IBOutlet UILabel *savedAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)didTapControlPad:(id)sender {
    [self updateValue];
}
- (IBAction)didTapScreen:(id)sender {
    [self updateValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateValue
{
    [self.view endEditing:YES];
    
    CGFloat billAmount = [self.inputTextField.text floatValue];
    
    NSArray *discountRate = @[@(0.9),@(0.8),@(0.7)];
    CGFloat savedPrice = billAmount * (1 - [discountRate[[self.controlPad selectedSegmentIndex]] floatValue]);
    CGFloat totalPrice = billAmount * [discountRate[[self.controlPad selectedSegmentIndex]] floatValue];
    
    self.savedAmount.text = [NSString stringWithFormat:@"$%10.2f",savedPrice];
    self.totalAmount.text = [NSString stringWithFormat:@"$%10.2f",totalPrice];
}

@end
