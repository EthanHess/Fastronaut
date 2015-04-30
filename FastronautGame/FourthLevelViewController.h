//
//  FourthLevelViewController.h
//  FastronautGame
//
//  Created by Ethan Hess on 4/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

int scoreNumber;
int astroFlight;
int daggerPostition;

@interface FourthLevelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startGame;
@property (weak, nonatomic) IBOutlet UIButton *tryAgain;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIImageView *iceDagger;
@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (nonatomic, strong) NSTimer *daggerTimer;
@property (nonatomic, strong) NSTimer *fastroTimer; 

- (IBAction)startGame:(id)sender;
- (void)fastroMoving;
- (void)daggerMoving;
- (void)placeDagger;
- (void)score;
- (void)gameEnded;

@end
