//
//  SecondLevelViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 4/22/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SecondLevelViewController.h"

@interface SecondLevelViewController ()

@end

@implementation SecondLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gameOver.hidden = YES;
    self.proceedButton.hidden = YES;
    scoreNumber = 0;
    
}

- (IBAction)startGame:(id)sender {
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
