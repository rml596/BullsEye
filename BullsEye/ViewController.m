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
int _round;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
    // Do any additional setup after loading the view, typically from a nib.
    _currentValue = 50;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = _slider.value;

    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"SliderTrackLeft"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)]; [self.slider setMinimumTrackImage:trackLeftImage
                                                                                           forState:UIControlStateNormal];
    UIImage *trackRightImage =
    [[UIImage imageNamed:@"SliderTrackRight"]
    resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sliderMoved:(UISlider *)slider{
    _currentValue = lroundf(slider.value);
}

-(IBAction)showAlert{
    int difference = abs(_targetValue - _currentValue);
    int points = 100 - difference;
    _score += points;
    NSString *title;
    if (difference == 0) { title = @"Perfect!";
        points += 100;
    } else if (difference < 5) {
        title = @"You almost had it!";
        if (difference == 1) {
            points += 50;
        }
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
_score += points;
    NSString *message = [NSString stringWithFormat: @"The value of the slider is: %d\nThe target value is: %d\nThe difference is: %d",_currentValue, _targetValue, difference];
    
    UIAlertView *alertView= [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
    [alertView show];
    [self startNewRound];
    [self updateLabels];
}


- (void)startNewRound {
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100); _currentValue = 50;
    self.slider.value = _currentValue;
}


- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",_score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",_round];
    
}

- (IBAction)startNewGame {
    _score = 0;
    _round = 0;
    [self startNewRound];
}
-(IBAction)startOver{
    [self startNewGame];
    [self updateLabels];
}

@end
