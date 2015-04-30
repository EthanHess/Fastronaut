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
    
    self.startGame.hidden = YES;
    
    self.scubaTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(scubaMoving) userInfo:nil repeats:YES];
    
    [self placeObstacles];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(obstaclesMoving) userInfo:nil repeats:YES];
    
}

- (void)obstaclesMoving {
    
    self.piranha.center = CGPointMake(self.piranha.center.x - 1, self.piranha.center.y);
    
    if (self.piranha.center.x < - 35) {
        [self placeObstacles];
    }
    
    if (self.piranha.center.x == 30) {
        [self score];
    }
    
    if (CGRectIntersectsRect(self.scubanaut.frame, self.piranha.frame)) {
        [self gameEnded];
    }
    
    if (self.scubanaut.center.y > self.view.frame.size.height - self.scubanaut.frame.size.height / 2) {
        [self gameEnded]; 
    }
    
    if (self.scubanaut.center.y < 0 + self.scubanaut.frame.size.height / 2) {
        [self gameEnded];
    }
    
    
}

- (void)placeObstacles {
    
    int frame = self.view.frame.size.height;
    
    obstaclePostition = arc4random() %frame;
    
    self.piranha.center = CGPointMake(380, obstaclePostition);
    
    if (self.piranha.center.y < 200) {
        self.piranha.image = [UIImage imageNamed:@"seagull"]; 
    }
    
    if (self.piranha.center.y > 200) {
        self.piranha.image = [UIImage imageNamed:@"piranha"]; 
    }
    
    
}

- (void)scubaMoving {
    
    self.scubanaut.center = CGPointMake(self.scubanaut.center.x, self.scubanaut.center.y - scubaFlight);
    
    scubaFlight = scubaFlight - 5;
    
    if (scubaFlight < - 15) {
        scubaFlight = -15;
    }
    
    if (scubaFlight > 0) {
        self.scubanaut.image = [UIImage imageNamed:@"swimUp"];
    }
    
    if (scubaFlight < 0) {
        self.scubanaut.image = [UIImage imageNamed:@"swimDown"];
    }
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    scubaFlight = 30;
    
}

- (void)gameEnded {
    
    [self.scubaTimer invalidate];
    [self.obstacleTimer invalidate];
    
    self.scubanaut.hidden = YES;
    self.gameOver.hidden = NO;
    self.piranha.hidden = YES;
    
}

- (void)score {
    
    scoreNumber = scoreNumber + 1;
    
    if (scoreNumber > 10) {
        [self.scubaTimer invalidate];
        [self.obstacleTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.scubanaut.hidden = YES;
        self.piranha.hidden = YES; 
        
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
