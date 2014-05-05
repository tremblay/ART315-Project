//
//  DetailViewController.m
//  BOX
//
//  Created by Colin Tremblay on 5/1/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    _detailTxt.text = @"A choice is different from a range of options. At what stage do we realize we don’t actually get to choose? Shop Up! is an exploration of the vacuous meaningless that surrounds the way we buy, and the platforms of manipulation that dominate the marketplace. Built by Colin Tremblay in collaboration with Grinnell AppDev, Shop Up! was developed by Gavin Warnock, Ananda Guneratne, and Daniel Kisslinger for a collaborative Senior Seminar at Grinnell College over the course of the Spring 2014 semester.\n\nThis art piece, including any of its components, is in no way actually representing any existing corporations or products, and is not selling any existing product. BOX is not a real item, and no purchase is actually processed at any point. There is no monetary exchange involved in the Shop Up! app. All claims made in the audio are in the name of satire, and are not in fact guarantees. The creators view this app as an art piece.";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
