//
//  FifthLevelViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 4/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "FifthLevelViewController.h"

@interface FifthLevelViewController ()

@end

@implementation FifthLevelViewController

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
    
    [self placeChemBlob];
    
    [self placeChemDrop];
    
    self.chemTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(chemBlobMoving) userInfo:nil repeats:YES];
    
    self.chemTimerTwo = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(chemDropMoving) userInfo:nil repeats:YES];
    
    
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - astroFlight);
    
    astroFlight = astroFlight - 5;
    
    if (astroFlight < -15) {
        astroFlight = -15;
    }
    
    if (astroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"radioactiveUp"];
    }
    
    if (astroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"radioactiveDown"];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    astroFlight = 30;
    
}

- (void)chemBlobMoving {
    
    self.chemBlob.center = CGPointMake(self.chemBlob.center.x - 1, self.chemBlob.center.y);
    
    if (self.chemBlob.center.x < -35) {
        [self placeChemBlob];
    }
    
    if (self.chemBlob.center.x == 30) {
        [self score];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.chemBlob.frame)) {
        [self gameEnded];
    }
    
    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
        [self gameEnded];
    }
    
    if (self.fastronaut.center.y < 0 + self.fastronaut.frame.size.height / 2) {
        [self gameEnded];
    }
    
}
    
- (void)chemDropMoving {
    
    self.chemDrop.center = CGPointMake(self.chemDrop.center.x + 1, self.chemDrop.center.y);
    
    
    if (self.chemDrop.center.x == 380) {
        [self placeChemDrop];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.chemDrop.frame)) {
        [self gameEnded];
    }
    
}

- (void)placeChemBlob {
    
    int frame = self.view.frame.size.height;
    
    chemPostition = arc4random() %frame;
    
    self.chemBlob.center = CGPointMake(380, chemPostition);
    
}

- (void)placeChemDrop {
    
    int frame = self.view.frame.size.height;
    
    chemPostition = arc4random() %frame;
    
    self.chemDrop.center = CGPointMake(-10, chemPostition);
    
}

- (void)score {
    
    scoreNumber = scoreNumber + 1;
    
    if (scoreNumber > 3) {
        [self.fastroTimer invalidate];
        [self.chemTimer invalidate];
        [self.chemTimerTwo invalidate];
        
        self.proceedButton.hidden = NO;
        self.fastronaut.hidden = YES;
        self.chemBlob.hidden = YES;
        self.chemDrop.hidden = YES;
    }
    
}

- (void)gameEnded {
    
    [self.fastroTimer invalidate];
    [self.chemTimer invalidate];
    [self.chemTimerTwo invalidate];
    
    self.fastronaut.hidden = YES;
    self.tryAgain.hidden = NO;
    self.chemBlob.hidden = YES;
    self.chemDrop.hidden = YES;
    
}



- (IBAction)resetGame:(id)sender {
    
    self.startGame.hidden = NO;
    self.fastronaut.hidden = NO;
    self.chemDrop.hidden = NO;
    self.chemBlob.hidden = NO;
    self.tryAgain.hidden = YES;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
