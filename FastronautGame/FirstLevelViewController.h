//
//  FirstLevelViewController.h
//  FastronautGame
//
//  Created by Ethan Hess on 4/18/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

int astroFlight;

@interface FirstLevelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startGame;
@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (nonatomic, strong) NSTimer *astronautTimer;


-(IBAction)startGame:(id)sender;
-(void)astronautMoving;

@end
