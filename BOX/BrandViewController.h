//
//  BrandViewController.h
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandViewController : UIViewController

@property (nonatomic, assign) int selectedInd;
@property (nonatomic, weak) IBOutlet UIButton *button1;
@property (nonatomic, weak) IBOutlet UIButton *button2;
@property (nonatomic, weak) IBOutlet UIButton *button3;
@property (nonatomic, weak) IBOutlet UIView *timerView;

- (IBAction)buttonTapped:(id)sender;

@end
