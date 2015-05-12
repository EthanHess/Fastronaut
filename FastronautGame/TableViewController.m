//
//  TableViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 4/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "FirstLevel.h"
#import "SecondLevelViewController.h"
#import "ThirdLevelViewController.h"
#import "FourthLevelViewController.h"
#import "FifthLevelViewController.h"
#import "LaunchViewController.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self registerTableView:self.tableView];
    
    [self.view addSubview:self.tableView];
    
    
}


- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [self levels][indexPath.row];
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor greenColor];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:24];
    
    return cell;


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self levels].count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {
            
            ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController"];
            
            [self.navigationController pushViewController:viewController animated:YES];
            
            break; }
            
        case 1: {
            
            FirstLevel *firstLevel = [FirstLevel new];
            
            [self.navigationController pushViewController:firstLevel animated:YES];
            
            break; }
            
        case 2: {
            
            SecondLevelViewController *secondLevel = [SecondLevelViewController new];
            
            [self.navigationController pushViewController:secondLevel animated:YES];
            
            break; }
            
        case 3: {
            
            ThirdLevelViewController *thirdLevel = [ThirdLevelViewController new];
            
            [self.navigationController pushViewController:thirdLevel animated:YES];
            
            break; }
            
        case 4: {
            
            FourthLevelViewController *fourthLevel = [self.storyboard instantiateViewControllerWithIdentifier:@"fourthLevel"];
            
            [self.navigationController pushViewController:fourthLevel animated:YES];
            
            break; }
            
        case 5: {
            
            FifthLevelViewController *fifthLevel = [self.storyboard instantiateViewControllerWithIdentifier:@"levelFive"];
            
            [self.navigationController pushViewController:fifthLevel animated:YES];
            
            break; }
            
        case 6: {
            
            LaunchViewController *launch = [self.storyboard instantiateViewControllerWithIdentifier:@"launch"];
            
            [self.navigationController pushViewController:launch animated:YES];
            
            break; }
        
            
            default:
            break;
    }
}


- (NSArray *)levels {
    
    return @[@"Back to main page", @"Level One", @"Level Two", @"Level Three", @"Level Four", @"Level Five", @"Blast off"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
