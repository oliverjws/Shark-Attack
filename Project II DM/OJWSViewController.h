//
//  OJWSViewController.h
//  Project II DM
//
//  Created by Oliver Joseph Westlake-Simm on 06/12/2013.
//  Copyright (c) 2013 Oliver Joseph Westlake-Simm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h> //sound
#import <AudioToolbox/AudioToolbox.h> //vibrate


int y;
BOOL Start;
int randomPosition;
int ScoreNumber;
int HighScore;


@interface OJWSViewController : UIViewController


{
    
    IBOutlet UIImageView *Intro1; //shark attack
    IBOutlet UILabel *Intro2; //instructions
    IBOutlet UILabel *Intro3; //top score

    
    IBOutlet UIImageView *Shark;
    IBOutlet UILabel *Score;
    
    NSTimer *timer;
    NSTimer *Scorer;
    NSTimer *FishRestart;
    
    IBOutlet UIImageView *Jellyfish1;
    IBOutlet UIImageView *Jellyfish2;
    IBOutlet UIImageView *Seaweed1;
    IBOutlet UIImageView *Seaweed2;
    IBOutlet UIImageView *Seaweed3;
    IBOutlet UIImageView *Seaweed4;
    IBOutlet UIImageView *Hook1;
    IBOutlet UIImageView *Hook2;
    IBOutlet UIImageView *Hook3;
    IBOutlet UIImageView *Hook4;
    IBOutlet UIImageView *SmallFish1;
    IBOutlet UIImageView *SmallFish2;
    IBOutlet UIImageView *SmallFish3;
    
    
     AVAudioPlayer *backgroundMusic;
    
}


-(void)vibrate;
-(void)SharkMove;
-(void)Collision;
-(void)EndGame;
-(void)NewGame;;
-(void)Scoring;
-(void)SmallFishes;



@end