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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)showAlert{
    UIAlertView *alertView= [[UIAlertView alloc]initWithTitle:@"Hello World!" message:@"This is a simple app" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
    [alertView show];
}
@end
