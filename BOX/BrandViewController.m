//
//  BrandViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "BrandViewController.h"
#import "IMViewWithBorderedImage.h"
#import "SizeViewController.h"

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
    IMViewWithBorderedImage *buttonOne = [[IMViewWithBorderedImage alloc] initWithFrame:_button1.frame];
    buttonOne.cornerRadius = 10;
    buttonOne.userInteractionEnabled = YES;
    UITapGestureRecognizer *gest1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapped:)];
    gest1.numberOfTapsRequired = 1;
    gest1.cancelsTouchesInView = YES;
    gest1.delegate = self;
    [buttonOne addGestureRecognizer:gest1];
    
    IMViewWithBorderedImage *buttonTwo = [[IMViewWithBorderedImage alloc] initWithFrame:_button2.frame];
    buttonTwo.cornerRadius = 10;
    UITapGestureRecognizer *gest2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapped:)];
    gest2.numberOfTapsRequired = 1;
    gest2.cancelsTouchesInView = YES;
    gest2.delegate = self;
    [buttonTwo addGestureRecognizer:gest2];

    IMViewWithBorderedImage *buttonThree = [[IMViewWithBorderedImage alloc] initWithFrame:_button3.frame];
    buttonThree.cornerRadius = 10;
    UITapGestureRecognizer *gest3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapped:)];
    gest3.numberOfTapsRequired = 1;
    gest3.cancelsTouchesInView = YES;
    gest3.delegate = self;
    [buttonThree addGestureRecognizer:gest3];

    _button1.hidden = YES;
    _button2.hidden = YES;
    _button3.hidden = YES;

        switch (_selectedInd) {
            case 0:
                buttonOne.image = [UIImage imageNamed:@"E_Happy Valley.jpg"];
                buttonTwo.image = [UIImage imageNamed:@"E_Le Maison d’Artiste.jpg"];
                buttonThree.image = [UIImage imageNamed:@"E_Artisan's Choice.jpg"];
                break;
            case 1:
                buttonOne.image = [UIImage imageNamed:@"E_Future Fit.jpg"];
                buttonTwo.image = [UIImage imageNamed:@"E_Slimatrix.jpg"];
                buttonThree.image = [UIImage imageNamed:@"E_Voom.jpg"];
                break;
            case 2:
                buttonOne.image = [UIImage imageNamed:@"E_Hartwell.jpg"];
                buttonTwo.image = [UIImage imageNamed:@"E_Synergetic Solutions.jpg"];
                buttonThree.image = [UIImage imageNamed:@"E_Collaborative Group.jpg"];
                break;
            case 3:
                buttonOne.image = [UIImage imageNamed:@"E_Dr. Shine.jpg"];
                buttonTwo.image = [UIImage imageNamed:@"E_Xerxes.jpg"];
                buttonThree.image = [UIImage imageNamed:@"E_Crystaleen.jpg"];
                break;
            case 4:
                buttonOne.image = [UIImage imageNamed:@"E_Discoverarium.jpg"];
                buttonTwo.image = [UIImage imageNamed:@"E_GoGoGames.jpg"];
                buttonThree.image = [UIImage imageNamed:@"E_Lil Geniuses.jpg"];
                break;
            case 5:
                buttonOne.image = [UIImage imageNamed:@"E_Jackson & Browne.jpg"];
                buttonTwo.image = [UIImage imageNamed:@"E_Scheiser.jpg"];
                buttonThree.image = [UIImage imageNamed:@"E_Artisan's Choice.jpg"];
                break;
            default:
                break;
        }
    
    [self.view addSubview:buttonOne];
    [self.view addSubview:buttonTwo];
    [self.view addSubview:buttonThree];
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
    SizeViewController *sizeVC = (SizeViewController *)[segue destinationViewController];
    UITapGestureRecognizer *gest = sender;
    
    if (90 == gest.view.frame.origin.y) {
        sizeVC.selectedBrandInd = _selectedInd * 3;
    } else if (188 == gest.view.frame.origin.y) {
        sizeVC.selectedBrandInd = _selectedInd * 3 + 1;
    } else {
        sizeVC.selectedBrandInd = _selectedInd * 3 + 2;
    }
}


@end
