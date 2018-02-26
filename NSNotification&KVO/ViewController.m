//
//  ViewController.m
//  NSNotification&KVO
//
//  Created by Chris Dean on 2018-02-25.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

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

- (IBAction)stepperTapped:(UIStepper *)sender {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:sender.value] forKey:@"stepperValue"];
    NSLog(@"%f", sender.value);
    NSLog(@"%@", [dict valueForKey:@"stepperValue"]);
    [notificationCenter postNotificationName:@"stepperEvent" object:self userInfo:dict];
                                                
}


//- (instancetype)initWithName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo;
                                                    
                                                
                                                
@end
