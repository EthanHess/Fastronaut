//
//  ThirdLevelViewController.h
//  FastronautGame
//
//  Created by Ethan Hess on 4/22/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

int scoreNumber;
int astroFlight;
int copterPostition;

@interface ThirdLevelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startGame;
@property (weak, nonatomic) IBOutlet UIButton *tryAgain;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (weak, nonatomic) IBOutlet UIImageView *helicopter;
@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *copterTimer;

- (IBAction)startGame:(id)sender;
- (void)fastroMoving;
- (void)copterMoving;
- (void)placeCopter;
- (void)score;
- (void)gameEnded;


@end
