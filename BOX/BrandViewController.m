//
//  BrandViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "BrandViewController.h"
#import "SizeTableViewController.h"
#import "KKProgressTimer.h"

@interface BrandViewController () <KKProgressTimerDelegate>

@end

@implementation BrandViewController {
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
    
    self.navigationItem.hidesBackButton = YES;
    
    [[_button1 layer] setBorderWidth:2.0f];
    [[_button1 layer] setBorderColor:[UIColor darkGrayColor].CGColor];
    [[_button2 layer] setBorderWidth:2.0f];
    [[_button2 layer] setBorderColor:[UIColor darkGrayColor].CGColor];
    [[_button3 layer] setBorderWidth:2.0f];
    [[_button3 layer] setBorderColor:[UIColor darkGrayColor].CGColor];

    switch (_selectedInd) {
        case 0:
            [_button1 setImage:[UIImage imageNamed:@"E_Happy Valley.png"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Le Maison d’Artiste.png"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Artisan's Choice.png"]  forState:UIControlStateNormal];
            break;
        case 1:
            [_button1 setImage:[UIImage imageNamed:@"E_Future Fit.png"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Slimatrix.png"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Voom.png"]  forState:UIControlStateNormal];
            break;
        case 2:
            [_button1 setImage:[UIImage imageNamed:@"E_Hartwell.png"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Synergetic Solutions.png"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Collaborative Group.png"]  forState:UIControlStateNormal];
            break;
        case 3:
            [_button1 setImage:[UIImage imageNamed:@"E_Dr. Shine.png"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Xerxes.png"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Crystaleen.png"]  forState:UIControlStateNormal];
            break;
        case 4:
            [_button1 setImage:[UIImage imageNamed:@"E_Discoverarium.png"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_GoGoGames.png"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"E_Lil Geniuses.png"]  forState:UIControlStateNormal];
            break;
        case 5:
            [_button1 setImage:[UIImage imageNamed:@"E_Jackson & Browne.png"]  forState:UIControlStateNormal];
            [_button2 setImage:[UIImage imageNamed:@"E_Scheiser.png"]  forState:UIControlStateNormal];
            [_button3 setImage:[UIImage imageNamed:@"Pasture Labs.png"]  forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    timer = [[KKProgressTimer alloc] initWithFrame:_timerView.bounds];
    [_timerView addSubview:timer];
    timer.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    timerFlag = NO;
    __block CGFloat i = 0;
    [timer startWithBlock:^CGFloat{
        return ((i++ >= 75) ? (i = 0) : i) / 75;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    [self performSegueWithIdentifier:@"BrandToSize" sender:sender];
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
    SizeTableViewController *sizeVC = (SizeTableViewController *)[segue destinationViewController];
    sizeVC.selectedBrandInd = _selectedInd;
}

@end
