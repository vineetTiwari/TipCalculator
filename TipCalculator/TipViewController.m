//
//  TipViewController.m
//  TipCalculator
//
//  Created by Vineet Tiwari on 2015-05-15.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountTextLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageSegmentControl;

@property (nonatomic) NSArray *tipPercentageArray;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  [self preferredStatusBarStyle];
  self.tipPercentageArray = @[@0.15, @0.20, @0.25];

  while (self.tipPercentageSegmentControl.numberOfSegments > 0) {
    [self.tipPercentageSegmentControl removeSegmentAtIndex:0 animated:NO];
  }

  [self.tipPercentageArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    NSNumber *numberInArray = obj;
    NSString *numberToString = [NSString stringWithFormat:@"%.f%%", numberInArray.doubleValue * 100];
    [self.tipPercentageSegmentControl insertSegmentWithTitle:numberToString atIndex:idx animated:NO];
  }];

  [self.tipPercentageSegmentControl setSelectedSegmentIndex:0];
  self.billAmountField.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)calculateTipAndUpdateLabel {

  NSNumber *tipPercentageNumber = self.tipPercentageArray [[self.tipPercentageSegmentControl selectedSegmentIndex]];

  double billAmount    = self.billAmountField.text.doubleValue;
  double tipPercentage = tipPercentageNumber.doubleValue;

  double tipAmount   = billAmount * tipPercentage;
  double totalAmount = tipAmount + billAmount;

  self.tipAmountTextLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
  self.totalAmountTextLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}

- (IBAction)didTapCalculateButton:(UIButton *)sender {

  NSLog(@"did tap the calculate button.");
  [self calculateTipAndUpdateLabel];
  [self.billAmountField resignFirstResponder];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end



































