//
//  LaunchViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 5/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.proceedButton.hidden = YES;
    self.fireBlast.hidden = YES;
    
}

- (IBAction)launchRocket:(id)sender {
    
    self.rocketTimer = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(rocketUp) userInfo:nil repeats:YES];
    
    self.launchButton.hidden = YES;
    
}

- (void)rocketUp {
    
    self.rocketShip.center = CGPointMake(self.rocketShip.center.x, self.rocketShip.center.y - 1);
    
    if (self.rocketShip.center.y < 200) {
        
        self.fireBlast.hidden = NO;
        self.fireBlast.center = CGPointMake(self.fireBlast.center.x, self.rocketShip.center.y - 1);

    }
    
    if (self.rocketShip.center.y < - 1000) {
        
        [self.rocketTimer invalidate];
        
        self.proceedButton.hidden = NO;
    }
    
}

- (void)placeFireBlast {
    
    self.fireBlast.center = CGPointMake(self.fireBlast.center.x, self.rocketShip.center.y + 250);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}


@end
