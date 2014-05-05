//
//  DetailViewController.h
//  BOX
//
//  Created by Colin Tremblay on 5/1/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextView *detailTxt;

- (IBAction)done;

@end
