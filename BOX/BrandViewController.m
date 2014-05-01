//
//  BrandViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "BrandViewController.h"
#import "SizeTableViewController.h"

@interface BrandViewController () <UIGestureRecognizerDelegate>

@end

@implementation BrandViewController

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
    
    [[_button1 layer] setBorderWidth:2.0f];
    [[_button1 layer] setBorderColor:[UIColor darkGrayColor].CGColor];
    [[_button2 layer] setBorderWidth:2.0f];
    [[_button2 layer] setBorderColor:[UIColor darkGrayColor].CGColor];
    [[_button3 layer] setBorderWidth:2.0f];
    [[_button3 layer] setBorderColor:[UIColor darkGrayColor].CGColor];

    switch (_selectedInd) {
        case 0:
            [_button1 setImage:[UIImage imageNamed:@"E_Happy Valley.jpg"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Le Maison d’Artiste.jpg"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Artisan's Choice.jpg"]  forState:UIControlStateNormal];
            break;
        case 1:
            [_button1 setImage:[UIImage imageNamed:@"E_Future Fit.jpg"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Slimatrix.jpg"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Voom.jpg"]  forState:UIControlStateNormal];
            break;
        case 2:
            [_button1 setImage:[UIImage imageNamed:@"E_Hartwell.jpg"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Synergetic Solutions.jpg"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Collaborative Group.jpg"]  forState:UIControlStateNormal];
            break;
        case 3:
            [_button1 setImage:[UIImage imageNamed:@"E_Dr. Shine.jpg"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Xerxes.jpg"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Crystaleen.jpg"]  forState:UIControlStateNormal];
            break;
        case 4:
            [_button1 setImage:[UIImage imageNamed:@"E_Discoverarium.jpg"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_GoGoGames.jpg"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Lil Geniuses.jpg"]  forState:UIControlStateNormal];
            break;
        case 5:
            [_button1 setImage:[UIImage imageNamed:@"E_Jackson & Browne.jpg"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Scheiser.jpg"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"Pasture Labs.jpg"]  forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    [self performSegueWithIdentifier:@"BrandToSize" sender:sender];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SizeTableViewController *sizeVC = (SizeTableViewController *)[segue destinationViewController];
    sizeVC.selectedBrandInd = _selectedInd;
    /*
     UITapGestureRecognizer *gest = sender;
     
     if (90 == gest.view.frame.origin.y) {
     sizeVC.selectedBrandInd = _selectedInd * 3;
     } else if (188 == gest.view.frame.origin.y) {
     sizeVC.selectedBrandInd = _selectedInd * 3 + 1;
     } else {
     sizeVC.selectedBrandInd = _selectedInd * 3 + 2;
     }*/
}

@end
