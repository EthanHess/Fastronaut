//
//  LaunchViewController.h
//  FastronautGame
//
//  Created by Ethan Hess on 5/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "SoundController.h"

@interface LaunchViewController : ViewController

@property (weak, nonatomic) IBOutlet UIButton *launchButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIImageView *rocketShip;
@property (nonatomic, strong) NSTimer *rocketTimer;
@property (nonatomic, strong) SoundController *soundController;


@end
