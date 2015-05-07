//
//  FourthLevelViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 4/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "FourthLevelViewController.h"

#define ARC4RANDOM_MAX      0x100000000

@interface FourthLevelViewController ()

@end

@implementation FourthLevelViewController

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
    
    [self placeDagger];
    
    self.daggerTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(daggerMoving) userInfo:nil repeats:YES];
    
}

- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - astroFlight);
    
    astroFlight = astroFlight - 5;
    
    if (astroFlight < -20) {
        astroFlight = -20;
    }
    
    if (astroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"fastronautAstronaut"];
    }
    
    if (astroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"astroFall"];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    astroFlight = 30;
    
}

- (void)daggerMoving {
    
//    float value = (float)(arc4random())/ARC4RANDOM_MAX/2.0f;
//    
//    
//    int test = arc4random_uniform(2);
//    
//    NSLog(@"%i", test);
//    
//    
//    if (test)
//    {
//        value *= -1;
//    }
    
//    int value = arc4random_uniform(-1) + 2;
    
    int value = 1;

    self.iceDagger.center = CGPointMake(self.iceDagger.center.x - 1, self.iceDagger.center.y + value);
    
    if (self.iceDagger.center.x < -35) {
        [self placeDagger];
    }
    
    if (self.iceDagger.center.x == 30) {
        [self score];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.iceDagger.frame)) {
        [self gameEnded];
    }
    
    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
        [self gameEnded];
    }
    
    if (self.fastronaut.center.y < 0 + self.fastronaut.frame.size.height / 2) {
        [self gameEnded];
    }
    
}

- (void)placeDagger {
    
    int frame = self.view.frame.size.height;
    
    daggerPostition = arc4random() %frame;
    
    self.iceDagger.center = CGPointMake(380, daggerPostition);
    
}

- (void)score {
    
    scoreNumber = scoreNumber + 1;
    
    if (scoreNumber > 1) {
        [self.fastroTimer invalidate];
        [self.daggerTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.fastronaut.hidden = YES;
        self.iceDagger.hidden = YES;
    }
    
}

- (void)gameEnded {
    
    [self.fastroTimer invalidate];
    [self.daggerTimer invalidate];
    
    self.fastronaut.hidden = YES;
    self.tryAgain.hidden = NO;
    self.iceDagger.hidden = YES;
    
    scoreNumber = 0; 
}


- (IBAction)resetGame:(id)sender {
    
    self.startGame.hidden = NO;
    self.fastronaut.hidden = NO;
    self.iceDagger.hidden = NO;
    self.tryAgain.hidden = YES;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
