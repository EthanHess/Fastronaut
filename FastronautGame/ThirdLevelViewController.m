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
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - astroFlight);
    
    astroFlight = astroFlight - 5; 
    
    if (astroFlight < -15) {
        astroFlight = -15;
    }
    
    if (astroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"cityUp"];
    }
    
    if (astroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"cityDown"];
    }
    
}

- (void)copterMoving {
    
    self.helicopter.center = CGPointMake(self.helicopter.center.x - 1, self.helicopter.center.y); 
    
    if (self.helicopter.center.x < -35) {
        [self placeCopter];
    }
    
    if (self.helicopter.center.x == 30) {
        [self score];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.helicopter.frame)) {
        [self gameEnded];
    }
    
    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
        [self gameEnded];
    }
    
    if (self.fastronaut.center.y < 0 + self.fastronaut.frame.size.height / 2) {
        [self gameEnded]; 
    }
    
    
}

- (void)placeCopter {
    
    int frame = self.view.frame.size.height;
    
    copterPostition = arc4random() %frame;
    
    self.helicopter.center = CGPointMake(380, copterPostition);
    
    //future if statement to change image if score is higher than certain number;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    astroFlight = 30;
    
}

- (void)score {
    
    scoreNumber = scoreNumber + 1;
    
    if (scoreNumber > 1) {
        [self.fastroTimer invalidate];
        [self.copterTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.fastronaut.hidden = YES;
        self.helicopter.hidden = YES;
        
    }
    
}

- (void)gameEnded {
    
    [self.fastroTimer invalidate];
    [self.copterTimer invalidate];
    
    self.fastronaut.hidden = YES;
    self.tryAgain.hidden = NO;
    self.helicopter.hidden = YES;
    
    scoreNumber = 0; 
}

- (IBAction)restartGame:(id)sender {
    
    self.startGame.hidden = NO;
    self.fastronaut.hidden = NO;
    self.helicopter.hidden = NO;
    self.tryAgain.hidden = YES;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
