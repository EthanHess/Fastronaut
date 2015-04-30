//
//  ThirdLevelViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 4/22/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ThirdLevelViewController.h"

@interface ThirdLevelViewController ()

@end

@implementation ThirdLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tryAgain.hidden = YES; 
    self.proceedButton.hidden = YES;
    self.proceedButton.titleLabel.numberOfLines = 0;
    scoreNumber = 0;
    
}

- (IBAction)startGame:(id)sender {
    
    self.startGame.hidden = YES;
    
    self.fastroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastroMoving) userInfo:nil repeats:YES];
    
    [self placeCopter];
    
    self.copterTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(copterMoving) userInfo:nil repeats:YES];
    
}

- (void)fastroMoving {
    
    
}

- (void)copterMoving {
    
    
}

- (void)placeCopter {
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
}

- (void)score {
    
    
}

- (void)gameEnded {
    
    
}

- (IBAction)restartGame:(id)sender {
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
