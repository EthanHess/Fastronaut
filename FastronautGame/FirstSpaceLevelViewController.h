//
//  SixthLevelViewController.h
//  FastronautGame
//
//  Created by Ethan Hess on 5/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

int scoreNumber;
int astroFlight;
int satellitePosition;

@interface FirstSpaceLevelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (weak, nonatomic) IBOutlet UIImageView *satellite;
@property (weak, nonatomic) IBOutlet UIButton *startGame;
@property (weak, nonatomic) IBOutlet UIButton *tryAgain;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *satTimer; 


@end
