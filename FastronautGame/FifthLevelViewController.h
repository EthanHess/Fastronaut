//
//  FifthLevelViewController.h
//  FastronautGame
//
//  Created by Ethan Hess on 4/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"

int scoreNumber;
int astroFlight;
int chemPostition;

@interface FifthLevelViewController : ViewController

@property (weak, nonatomic) IBOutlet UIButton *startGame;
@property (weak, nonatomic) IBOutlet UIButton *tryAgain;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (weak, nonatomic) IBOutlet UIImageView *chemBlob;
@property (strong, nonatomic) IBOutlet UIImageView *chemDrop;
@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *chemTimer;
@property (nonatomic, strong) NSTimer *chemTimerTwo;


@end
