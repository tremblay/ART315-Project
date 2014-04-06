//
//  TypeViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "TypeViewController.h"
#import "BrandViewController.h"

@interface TypeViewController ()

@end

@implementation TypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    [self performSegueWithIdentifier:@"TypeToBrand" sender:sender];
}

 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     BrandViewController *brandVC = (BrandViewController *)[segue destinationViewController];
     UIButton *sendingButton = sender;
     if (20 == sendingButton.frame.origin.x) {
         if (83 == sendingButton.frame.origin.y) {
             brandVC.selectedInd = 0;
         } else if (222 == sendingButton.frame.origin.y) {
             brandVC.selectedInd = 2;
         } else {
             brandVC.selectedInd = 4;
         }
     } else {
         if (83 == sendingButton.frame.origin.y) {
             brandVC.selectedInd = 1;
         } else if (222 == sendingButton.frame.origin.y) {
             brandVC.selectedInd = 3;
         } else {
             brandVC.selectedInd = 5;
         }
     }
 }

@end
