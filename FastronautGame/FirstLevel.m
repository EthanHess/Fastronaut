//
//  FirstLevelViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 4/18/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "FirstLevel.h"

@interface FirstLevel ()

@end

@implementation FirstLevel

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Exit.hidden = YES;
    self.Exit.titleLabel.numberOfLines = 0;
    self.proceedButton.hidden = YES;
    self.proceedButton.titleLabel.numberOfLines = 0;
    scoreNumber = 0;
    
}


-(IBAction)startGame:(id)sender {
    
    self.startGame.hidden = YES;
    self.astronautTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(astronautMoving) userInfo:nil repeats:YES];
    
    [self placeBullets];
    
    self.bulletTimer = [NSTimer scheduledTimerWithTimeInterval:0.0065 target:self selector:@selector(bulletsMoving) userInfo:nil repeats:YES];
    
}

-(void)bulletsMoving {
    
    self.topBullet.center = CGPointMake(self.topBullet.center.x - 1, self.topBullet.center.y);
    
    if (self.topBullet.center.x < - 35) {
        [self placeBullets];
    }
    
    if (self.topBullet.center.x == 30) {
        [self score];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.topBullet.frame)) {
        [self gameOver];
    }
    
    
    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
        [self gameOver];
    }
    
    if (self.fastronaut.center.y < 0 + self.fastronaut.frame.size.height / 2) {
        [self gameOver];
    }
    
}


-(void)placeBullets {
    
    
    int frame = self.view.frame.size.height;
    
    randomTopBulletPosition = arc4random() %frame;
    
    self.topBullet.center = CGPointMake(380, randomTopBulletPosition);
    
    
}


-(void)astronautMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - astroFlight);
    
    astroFlight = astroFlight - 5;
    
    if (astroFlight < -15) {
        astroFlight = -15;
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

- (void)gameOver {
    
    [self.astronautTimer invalidate];
    [self.bulletTimer invalidate];
    
    self.Exit.hidden = NO;
    self.topBullet.hidden = YES;
    self.fastronaut.hidden = YES;
    
    scoreNumber = 0;
    
    
}

- (void)score {
    
    scoreNumber = scoreNumber + 1;
    
    if (scoreNumber > 1) {
        [self.astronautTimer invalidate];
        [self.bulletTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.topBullet.hidden = YES;
        self.fastronaut.hidden = YES; 
    }
    
}

- (IBAction)resetGame:(id)sender {
    
    self.startGame.hidden = NO;
    self.Exit.hidden = YES;
    self.fastronaut.hidden = NO;
    self.topBullet.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
}

- (void)play {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"" withExtension:@""];
    
    [self.soundController playAudioFileAtURL:url];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
