//
//  SecondLevelViewController.h
//  FastronautGame
//
//  Created by Ethan Hess on 4/22/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondLevelViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *startGame;
@property (weak, nonatomic) IBOutlet UIImageView *scubanaut;
@property (weak, nonatomic) IBOutlet UIImageView *piranha;
@property (weak, nonatomic) IBOutlet UIButton *gameOver;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (nonatomic, strong) NSTimer *scubaTimer; 

@end
