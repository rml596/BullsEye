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
int _targetValue;
int _score;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
    // Do any additional setup after loading the view, typically from a nib.
    _currentValue = 50;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = _slider.value;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sliderMoved:(UISlider *)slider{
    _currentValue = lroundf(slider.value);
}
-(IBAction)showAlert{
    int difference;
    if (_currentValue > _targetValue) {
        difference = _currentValue - _targetValue;
    }
    else if (_targetValue > _currentValue) {
        difference = _targetValue - _currentValue;
    }
    else {
        difference = 0;
    }
    NSString *message = [NSString stringWithFormat: @"The value of the slider is: %d\nThe target value is: %d\nThe difference is: %d",_currentValue, _targetValue, difference];
    
    UIAlertView *alertView= [[UIAlertView alloc]initWithTitle:@"Hello World!" message:message delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
    [alertView show];
    [self startNewRound];
    [self updateLabels];
}
- (void)startNewRound {
    _targetValue = 1 + arc4random_uniform(100); _currentValue = 50;
    self.slider.value = _currentValue;
}
- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
}

@end
