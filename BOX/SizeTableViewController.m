//
//  SizeTableViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/30/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "SizeTableViewController.h"
#import "ColorTableViewController.h"
#import "KKProgressTimer.h"

@interface SizeTableViewController () <KKProgressTimerDelegate>

@end

@implementation SizeTableViewController {
    NSArray *sizes;
    KKProgressTimer *timer;
    BOOL timerFlag;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    sizes = [[NSArray alloc] initWithObjects:@"Fun Size", @"Medium", @"Family", @"King", @"*Special (Limited Time)*",nil];
    timer = [[KKProgressTimer alloc] initWithFrame:_timerView.bounds];
    [_timerView addSubview:timer];
    timer.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    timerFlag = NO;
    __block CGFloat i = 0;
    [timer startWithBlock:^CGFloat{
        return ((i++ >= 100) ? (i = 0) : i) / 100;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sizes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SizeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [sizes objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"SizeToColor" sender:self];
}

 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     timerFlag = YES;
     [timer stop];
     ColorTableViewController *colorVC = (ColorTableViewController *)[segue destinationViewController];
     colorVC.selectedBrandInd = _selectedBrandInd;
 }

@end
