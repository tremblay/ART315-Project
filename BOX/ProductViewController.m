//
//  ProductViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "ProductViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ProductViewController ()

@end

@implementation ProductViewController {
    NSDictionary *descriptionsDict;
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
    NSString *descriptionsPath = [[NSBundle mainBundle] pathForResource:@"Descriptions" ofType:@"strings"];
    descriptionsDict = [NSDictionary dictionaryWithContentsOfFile:descriptionsPath];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString *key;
    switch (_selectedBrandInd) {
        case (0):
            key = @"Food";
            break;
        case (1):
            key = @"Weight Loss";
            break;
        case (2):
            key = @"Executive Support";
            break;
        case (3):
            key = @"Household Cleaner";
            break;
        case (4):
            key = @"ToyKid’s Product";
            break;
        case(5):
            key = @"Medication";
            break;
        default:
            break;
    }
    _description.text = [descriptionsDict objectForKey:key];
    NSString *path = [NSString stringWithFormat:@"BOX/Audio/%@", key];
    NSLog(@"%d", [[NSFileManager defaultManager] fileExistsAtPath:path]);
    /*NSURL *soundFile = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:key ofType:@"mp3" inDirectory:@"Audio"]];
    NSError *err;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile error:&err];
    if (err) {
        //
    }
    [audioPlayer play];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
