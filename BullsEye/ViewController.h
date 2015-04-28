//
//  ViewController.h
//  BullsEye
//
//  Created by Robert Lynch on 4/21/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;

-(IBAction)showAlert;
-(IBAction)sliderMoved:(UISlider *)slider;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;
- (IBAction)startNewGame;
- (IBAction)startOver;



@end

