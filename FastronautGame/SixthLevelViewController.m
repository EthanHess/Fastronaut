//
//  SixthLevelViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 5/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SixthLevelViewController.h"

@interface SixthLevelViewController ()

@end

@implementation SixthLevelViewController

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
    
    [self placeSatellite];
    
    self.satTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(satelliteMoving) userInfo:nil repeats:YES];
    
    
}

- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - astroFlight);
    
    astroFlight = astroFlight - 5;
    
    if (astroFlight < -15) {
        astroFlight = -15;
    }
    
    if (astroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"spaceGuyUp"];
    }
    
    if (astroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"spaceGuyDown"];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    astroFlight = 30;
    
}

- (void)satelliteMoving {
    
    self.satellite.center = CGPointMake(self.satellite.center.x - 1, self.satellite.center.y);
    
    if (self.satellite.center.x < -35) {
        [self placeSatellite];
    }
    
    if (self.satellite.center.x == 30) {
        [self score];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.satellite.frame)) {
        [self gameEnded];
    }
    
    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
        [self gameEnded];
    }
    
    if (self.fastronaut.center.y < 0 + self.fastronaut.frame.size.height / 2) {
        [self gameEnded];
    }


}

- (void)placeSatellite {
    
    int frame = self.view.frame.size.height;
    
    satellitePosition = arc4random() %frame;
    
    self.satellite.center = CGPointMake(380, satellitePosition);
    
}

- (void)score {
    
    scoreNumber = scoreNumber + 1;
    
    if (scoreNumber > 3) {
        [self.fastroTimer invalidate];
        [self.satTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.fastronaut.hidden = YES;
        self.satellite.hidden = YES;
    }
    
}

- (void)gameEnded {
    
    [self.fastroTimer invalidate];
    [self.satTimer invalidate];
    
    self.fastronaut.hidden = YES;
    self.tryAgain.hidden = NO;
    self.satellite.hidden = YES;
    
}



- (IBAction)resetGame:(id)sender {
    
    
    self.startGame.hidden = NO;
    self.fastronaut.hidden = NO;
    self.satellite.hidden = NO;
    self.tryAgain.hidden = YES;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
