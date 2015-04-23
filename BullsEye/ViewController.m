//
//  ViewController.m
//  BullsEye
//
//  Created by Robert Lynch on 4/21/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
int _currentValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sliderMoved:(UISlider *)slider{
    _currentValue = lroundf(slider.value);
}
-(IBAction)showAlert{
    NSString *message = [NSString stringWithFormat: @"The value of the slider is: %d", _currentValue];
    
    UIAlertView *alertView= [[UIAlertView alloc]initWithTitle:@"Hello World!" message:message delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
    [alertView show];
}
@end
