//
//  StepperValueViewController.m
//  NSNotification&KVO
//
//  Created by Chris Dean on 2018-02-25.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "StepperValueViewController.h"

@interface StepperValueViewController ()
@property (weak, nonatomic) IBOutlet UILabel *stepperCountLabel;

@end

@implementation StepperValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(stepperDidChange:) name:@"stepperEvent" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//stays open while other VS's have reference to it
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"stepperEvent" object:nil];
}

- (void)stepperDidChange:(NSNotification*)notification {
    NSNumber *stepperCount = [notification.userInfo valueForKey:@"stepperValue"];
    self.stepperCountLabel.text = [NSString stringWithFormat:@"%@", stepperCount];
    NSLog(@"stepper count: %@", stepperCount);
}

@end
