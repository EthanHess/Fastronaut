//
//  FirstLevelViewController.m
//  FastronautGame
//
//  Created by Ethan Hess on 4/18/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "FirstLevelViewController.h"

@interface FirstLevelViewController ()

@end

@implementation FirstLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)startGame:(id)sender {
    
    self.startGame.hidden = YES;
    self.astronautTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(astronautMoving) userInfo:nil repeats:YES];
    
    [self placeBullets];
    
    self.bulletTimer = [NSTimer scheduledTimerWithTimeInterval:0.0025 target:self selector:@selector(bulletsMoving) userInfo:nil repeats:YES];
    
}

-(void)bulletsMoving {
    
    self.topBullet.center = CGPointMake(self.topBullet.center.x - 1, self.topBullet.center.y);
    self.bottomBullet.center = CGPointMake(self.bottomBullet.center.x - 1, self.bottomBullet.center.y);
    
    if (self.topBullet.center.x < - 35) {
        [self placeBullets];
    }
    
}


-(void)placeBullets {
    
    spaceBetweenBullets = arc4random() %250;
    
    randomTopBulletPosition = arc4random() %350;
    randomTopBulletPosition = randomTopBulletPosition - 100;
    randomBottomBulletPosition = randomTopBulletPosition + spaceBetweenBullets;
    
    self.topBullet.center = CGPointMake(340, randomTopBulletPosition);
    self.bottomBullet.center = CGPointMake(340, randomBottomBulletPosition);
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
