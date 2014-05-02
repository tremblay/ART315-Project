//
//  ProductViewController.h
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ProductViewController : UIViewController <AVAudioPlayerDelegate>

@property (nonatomic, assign) int selectedBrandInd;
@property (nonatomic, weak) IBOutlet UITextView *description;
@property (nonatomic, weak) IBOutlet UIButton *returnToStart;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

- (IBAction)buttonTapped:(id)sender;

@end
