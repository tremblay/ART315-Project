//
//  ColorTableViewController.m
//  BOX
//
//  Created by Colin Tremblay on 4/5/14.
//  Copyright (c) 2014 Grinnell AppDev. All rights reserved.
//

#import "ColorTableViewController.h"
#import "ProductViewController.h"
#import "KKProgressTimer.h"

@interface ColorTableViewController () <KKProgressTimerDelegate>

@end

@implementation ColorTableViewController {
    NSArray *colors;
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
    self.title = @"Choose a Color";
    self.navigationItem.hidesBackButton = YES;
    colors = [[NSArray alloc] initWithObjects:
              @"Tangello Wave",
              @"Aqua Sunset",
              @"Rainwater Mist",
              @"Antique Olive",
              @"Burnt Peach",
              @"Electric Asparagus",
              @"Jungle Cerulean",
              @"Caribbean Cornflower",
              @"Faded Denim",
              @"Fuchsia Pink",
              @"Hot Pizzazz",
              @"Razzle-dazzle eggplant",
              @"Wild Salmon",
              @"Radical Maroon",
              @"Grey-Black",
              @"Hyphenated Blueberry",
              @"Timberwolf Sherbet",
              @"Laser Fern",
              @"Yellow",
              @"Fuzzy Tangerine",
              @"Distressed Coquelicot",
              @"Hot Beige",
              @"Neon Carrot",
              @"Subtle Sarcoline",
              @"Tickle-me Taupe", nil];
    timer = [[KKProgressTimer alloc] initWithFrame:_timerView.bounds];
    [_timerView addSubview:timer];
    timer.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    timerFlag = NO;
    __block CGFloat i = 0;
    [timer startWithBlock:^CGFloat{
        return ((i++ >= 400) ? (i = 0) : i) / 400;
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [colors objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"ColorToProduct" sender:self];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    timerFlag = YES;
    [timer stop];
    ProductViewController *productVC = (ProductViewController *)[segue destinationViewController];
    productVC.selectedBrandInd = _selectedBrandInd;
}

@end
