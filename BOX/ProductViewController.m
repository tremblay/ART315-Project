//
//  ProductViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "ProductViewController.h"

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
    _returnToStart.hidden = YES;
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
    NSURL *soundFile = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath], key]];
    //NSLog(@"%d", [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath], key]]);
    NSError *err;
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile error:&err];
    if (err) {
        NSLog(@"%@", [err localizedDescription]);
    } else {
        [_audioPlayer prepareToPlay];
        [_audioPlayer setDelegate:self];
        [_audioPlayer play];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - AVAudioPlayer Delegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"Here");
    _returnToStart.hidden = NO;
}

@end
