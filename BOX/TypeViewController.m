//
//  TypeViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "TypeViewController.h"
#import "BrandViewController.h"
#import "KKProgressTimer.h"

@interface TypeViewController () <KKProgressTimerDelegate>

@end

@implementation TypeViewController {
    KKProgressTimer *timer;
    BOOL timerFlag;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Choose a Department";
    self.navigationItem.hidesBackButton = YES;
    
    timer = [[KKProgressTimer alloc] initWithFrame:_timerView.bounds];
    [_timerView addSubview:timer];
    timer.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    timerFlag = NO;
    __block CGFloat i = 0;
    [timer startWithBlock:^CGFloat{
        return ((i++ >= 100) ? (i = 0) : i) / 100;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    [self performSegueWithIdentifier:@"TypeToBrand" sender:sender];
}

#pragma mark Timer Delegate
- (void)didUpdateProgressTimer:(KKProgressTimer *)progressTimer percentage:(CGFloat)percentage {
    if (1 <= percentage) {
        [progressTimer stop];
    }
}

- (void)didStopProgressTimer:(KKProgressTimer *)progressTimer percentage:(CGFloat)percentage {
    if (!timerFlag) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     timerFlag = YES;
     [timer stop];
     BrandViewController *brandVC = (BrandViewController *)[segue destinationViewController];
     UIButton *sendingButton = sender;
     if (20 == sendingButton.frame.origin.x) {
         if (126 == sendingButton.frame.origin.y) {
             brandVC.selectedInd = 0;
         } else if (234 == sendingButton.frame.origin.y) {
             brandVC.selectedInd = 2;
         } else {
             brandVC.selectedInd = 4;
         }
     } else {
         if (126 == sendingButton.frame.origin.y) {
             brandVC.selectedInd = 1;
         } else if (234 == sendingButton.frame.origin.y) {
             brandVC.selectedInd = 3;
         } else {
             brandVC.selectedInd = 5;
         }
     }
 }

@end
