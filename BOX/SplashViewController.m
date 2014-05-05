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
    if (UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM()) {
        if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && (2.0 == [UIScreen mainScreen].scale)) {
            _splashImage.image = [UIImage imageNamed:@"splash-ipad@2x.png"];
        } else {
            _splashImage.image = [UIImage imageNamed:@"splash-ipad.png"];
        }
    } else {
        int height = [[UIScreen mainScreen] bounds].size.height;
        if (568 == height) {
            _splashImage.image = [UIImage imageNamed:@"splash-568.png"];
        } else {
            _splashImage.image = [UIImage imageNamed:@"splash.png"];
        }
    }
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
    [self.navigationController setNavigationBarHidden:NO];
    [self performSegueWithIdentifier:@"SplashToType" sender:self];
}

@end
