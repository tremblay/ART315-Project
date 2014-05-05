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
    self.title = @"Thank You For Purchase";
    self.navigationItem.hidesBackButton = YES;
    NSString *descriptionsPath = [[NSBundle mainBundle] pathForResource:@"Descriptions" ofType:@"strings"];
    descriptionsDict = [NSDictionary dictionaryWithContentsOfFile:descriptionsPath];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _returnToStart.hidden = YES;
    NSString *key;
    switch (_selectedBrandInd) {
        case (100):
            key = @"food";
            break;
        case (101):
            key = @"weight loss";
            break;
        case (102):
            key = @"Executive Support";
            break;
        case (103):
            key = @"Household Cleaner";
            break;
        case (104):
            key = @"ToyKid’s Product";
            break;
        case(105):
            key = @"medication";
            break;
        default:
            break;
    }
    _description.text = [descriptionsDict objectForKey:key];
    NSString *path = [NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath], key];
    NSURL *soundFile = [NSURL fileURLWithPath:path];
    //NSLog(@"%@: %d", path, [[NSFileManager defaultManager] fileExistsAtPath:path]);
    
    NSError *err;
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile error:&err];
    if (err) {
        [self showNotice:[err localizedDescription]];
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

#pragma mark UIAlertViewDelegate Methods
// Called when an alert button is tapped.
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    _returnToStart.hidden = NO;
    return;
}

- (void)showNotice:(NSString *)error {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"An Error Occurred"
                          message:error
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil
                          ];
    [alert show];
}

#pragma mark - AVAudioPlayer Delegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    _returnToStart.hidden = NO;
}

@end
