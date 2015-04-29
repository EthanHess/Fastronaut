//
//  FirstLevelViewController.h
//  FastronautGame
//
//  Created by Ethan Hess on 4/18/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

int astroFlight;
int spaceBetweenBullets; 
int randomTopBulletPosition;
//int randomBottomBulletPosition;
int scoreNumber;

@interface FirstLevelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startGame;
@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (weak, nonatomic) IBOutlet UIImageView *topBullet;
@property (weak, nonatomic) IBOutlet UIImageView *bottomBullet;
@property (weak, nonatomic) IBOutlet UIButton *Exit;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (nonatomic, strong) NSTimer *astronautTimer;
@property (nonatomic, strong) NSTimer *bulletTimer;

-(IBAction)startGame:(id)sender;
-(void)astronautMoving;
-(void)bulletsMoving;
-(void)placeBullets;
-(void)score;
-(void)gameOver;

@end
