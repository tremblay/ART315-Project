//
//  SplashViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/30/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
   // [self showNotice];
    [self.navigationController setNavigationBarHidden:NO];
    [self performSegueWithIdentifier:@"SplashToType" sender:self];
}
/*
#pragma mark UIAlertViewDelegate Methods
// Called when an alert button is tapped.
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.navigationController setNavigationBarHidden:NO];
    [self performSegueWithIdentifier:@"SplashToType" sender:self];
}

- (void)showNotice {
    UIAlertView *network = [[UIAlertView alloc]
                            initWithTitle:@"Blah"
                            message:@"Blah blah"
                            delegate:self
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil
                            ];
    [network show];
}*/

@end
