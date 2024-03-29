//
//  OJWSViewController.m
//  Project II DM
//
//  Created by Oliver Joseph Westlake-Simm on 06/12/2013.
//  Copyright (c) 2013 Oliver Joseph Westlake-Simm. All rights reserved.
//

#import "OJWSViewController.h"

@interface OJWSViewController ()

@end

@implementation OJWSViewController

-(void)Collision{
    
    [self vibrate];
    
    //if shark & jellyfish touch run end game script.
    if (CGRectIntersectsRect(Shark.frame, Jellyfish1.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Jellyfish2.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Hook1.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Hook2.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Hook3.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Hook4.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Seaweed1.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Seaweed2.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Seaweed3.frame)) { [self EndGame];
    }
    
    if (CGRectIntersectsRect(Shark.frame, Seaweed4.frame)) { [self EndGame];
    }
    
    
    if (CGRectIntersectsRect(Shark.frame, SmallFish1.frame)) {
        SmallFish1.hidden = YES;[self Scoring];
    }
    
    if (CGRectIntersectsRect(Shark.frame, SmallFish2.frame)) {
        SmallFish2.hidden = YES;[self Scoring];
        
    }
    
    if (CGRectIntersectsRect(Shark.frame, SmallFish3.frame)) {
        SmallFish3.hidden = YES; [self Scoring];
    }
    
    
}

-(void)EndGame{
    
    if (ScoreNumber > HighScore) {
        HighScore = ScoreNumber;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScore forKey:@"HighScoreSaved:"];
    }
    //hides shark when game ends
    
    Shark.hidden = YES;
    [timer invalidate]; //stops time with controls movement. Everything stops
    
    [FishRestart invalidate];
    
    
    //runs new game after 3sec delay
    [self performSelector:@selector(NewGame) withObject:nil afterDelay:3];
}


-(void)NewGame {
    
    
    Seaweed1.hidden = YES;
    Seaweed2.hidden = YES;
    Seaweed3.hidden = YES;
    Seaweed4.hidden = YES;
    
    Hook1.hidden = YES;
    Hook2.hidden = YES;
    Hook3.hidden = YES;
    Hook4.hidden = YES;
    
    Jellyfish1.hidden = YES;
    Jellyfish2.hidden = YES;
    
    
    SmallFish1.hidden = YES;
    SmallFish2.hidden = YES;
    SmallFish3.hidden = YES;
    
    
    Intro1.hidden = NO;
    Intro2.hidden = NO;
    Intro3.hidden = NO;
    
    Shark.hidden = NO;
    Shark.center = CGPointMake(40, 210);
    Shark.image = [UIImage imageNamed:@"sharkup.png"];
    
    Start = YES; //this reference touches began statement.
    
    ScoreNumber = 000; //resets back to zero
    Score.text = [NSString stringWithFormat:@"score:0"];
    
    Intro2.text = [NSString stringWithFormat:@"High Score: %i", HighScore];
    
    
}

-(void)SharkMove{
    
    [self Collision];//runs check to see if anything has collided.
    
    Shark.center = CGPointMake(Shark.center.x, Shark.center.y + y);
    //makes the shark move on y axis.
    
    Jellyfish1.center = CGPointMake(Jellyfish1.center.x -10, Jellyfish1.center.y -6); //moves to left as frame refreshes every 0.1 seconds
    Jellyfish2.center = CGPointMake(Jellyfish2.center.x -10, Jellyfish2.center.y -4);
    
    
    SmallFish1.center = CGPointMake(SmallFish1.center.x -20, SmallFish1.center.y);
    SmallFish2.center = CGPointMake(SmallFish2.center.x -20, SmallFish2.center.y);
    SmallFish3.center = CGPointMake(SmallFish3.center.x -20, SmallFish3.center.y);
    
    Seaweed1.center = CGPointMake(Seaweed1.center.x -10, Seaweed1.center.y);
    Seaweed2.center = CGPointMake(Seaweed2.center.x -10, Seaweed2.center.y);
    Seaweed3.center = CGPointMake(Seaweed3.center.x -10, Seaweed3.center.y);
    Seaweed4.center = CGPointMake(Seaweed4.center.x -10, Seaweed4.center.y);
    
    Hook1.center = CGPointMake(Hook1.center.x -10, Hook1.center.y); //moves hooks
    Hook2.center = CGPointMake(Hook2.center.x -10, Hook2.center.y);
    Hook3.center = CGPointMake(Hook3.center.x -10, Hook3.center.y);
    Hook4.center = CGPointMake(Hook4.center.x -10, Hook4.center.y);
    
    
    
    if (Jellyfish1.center.x < 20){
        randomPosition = arc4random() %90;
        randomPosition = randomPosition +310;
        Jellyfish1.center = CGPointMake(520, randomPosition);
    }
    
    if (Jellyfish2.center.x < 4){
        randomPosition = arc4random() %310;
        randomPosition = randomPosition +210;
        Jellyfish2.center = CGPointMake(520, randomPosition);
    }
    
    
    if (Hook1.center.x < -5){
        
        Hook1.center = CGPointMake(520, 9);
        Seaweed1.center = CGPointMake(520, 280);
    }
    
    if (Hook2.center.x < -5){
        
        Hook2.center = CGPointMake(520, 1);
        Seaweed2.center = CGPointMake(520, 285);
    }
    
    if (Hook3.center.x < -5){
        
        
        Hook3.center = CGPointMake(520, 6);
        Seaweed3.center = CGPointMake(520, 282);
    }
    
    if (Hook4.center.x < -5){
        
        
        Hook4.center = CGPointMake(520, 5);
        Seaweed4.center = CGPointMake(520, 290);
    }

    
}



-(void)Scoring {
    
    //every one second add 1 to score and display in score label.
    ScoreNumber++;
    Score.text = [NSString stringWithFormat:@"Score: %i", ScoreNumber];
    
}



-(void)SmallFishes  {
    
    SmallFish1.hidden = NO;
    SmallFish2.hidden = NO;
    SmallFish3.hidden = NO;
    
    
    randomPosition = arc4random() %210;
    randomPosition = randomPosition + 150;
    SmallFish1.center = CGPointMake(520, randomPosition);
    
    
    
    randomPosition = arc4random() %110;
    randomPosition = randomPosition +80;
    SmallFish1.center = CGPointMake(520, randomPosition);
    
    
    randomPosition = arc4random() %290;
    randomPosition = randomPosition +120;
    SmallFish3.center = CGPointMake(520, randomPosition);
    
    
}






//code that runs when we touch the screen

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //boolean if start is yes run this code - set up time and hide labels
    if(Start == YES) {
        Intro1.hidden = YES;
        Intro2.hidden = YES;
        Intro3.hidden = YES;
        
        //run sharkmove every 0.1 seconds - makes it look smooth
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(SharkMove) userInfo:Nil repeats:YES];
        
        
        FishRestart = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(SmallFishes) userInfo:Nil repeats:YES];
        
            
        [backgroundMusic setVolume:0.3];
        [backgroundMusic play];
         backgroundMusic.numberOfLoops= -1;
        
        //when we tap screen next time start will be no and the code will not run
        Start = NO;
        
        Seaweed1.hidden = NO; //shows all the objects for when you game starts
        Seaweed2.hidden = NO;
        Seaweed3.hidden = NO;
        Seaweed4.hidden = NO;
        
        Hook1.hidden = NO;
        Hook2.hidden = NO;
        Hook3.hidden = NO;
        Hook4.hidden = NO;
        
        Jellyfish1.hidden = NO;
        Jellyfish2.hidden = NO;;
        
        SmallFish1.hidden = NO;
        SmallFish2.hidden = NO;
        SmallFish3.hidden = NO;
        
        
        
        
        //smallfish location
        randomPosition = arc4random() %95; //random position between 0-94
        randomPosition = randomPosition + 110;
        SmallFish1.center = CGPointMake(355, 129);
        
        randomPosition = arc4random() %95; //random position between 0-94
        randomPosition = randomPosition + 110;
        SmallFish2.center = CGPointMake(275, 129);
        
        randomPosition = arc4random() %95; //random position between 0-94
        randomPosition = randomPosition + 110;
        SmallFish3.center = CGPointMake(195, 129);
        
        //hook and seaweed location
        
        
        Hook1.center = CGPointMake(60, 15);
        Seaweed1.center = CGPointMake(60, 288);
        
        
        Hook2.center = CGPointMake(180, 10);
        Seaweed2.center = CGPointMake(180, 285);
        
        
        Hook3.center = CGPointMake(300, 21);
        Seaweed3.center = CGPointMake(300, 280);
        
        
        Hook4.center = CGPointMake(440, 17);
        Seaweed4.center = CGPointMake(440, 282);
    }
    //when screen is touched
    y = -7;
    Shark.image =[UIImage imageNamed:@"sharkup.png"];
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //when screen isnt touched
    y = 7;
    Shark.image =[UIImage imageNamed:@"sharkdown.png"];
    
    
}

-(void)vibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}


- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{

    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *error;
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    return audioPlayer;
}



- (void)viewDidLoad
{
    
    Start = YES;
    
    Seaweed1.hidden = YES; //hides all the objects for when game at start menu
    Seaweed2.hidden = YES;
    Seaweed3.hidden = YES;
    Seaweed4.hidden = YES;
    
    Hook1.hidden = YES;
    Hook2.hidden = YES;
    Hook3.hidden = YES;
    Hook4.hidden = YES;
    
    Jellyfish1.hidden = YES;
    Jellyfish2.hidden = YES;
    
    SmallFish1.hidden = YES;
    SmallFish2.hidden = YES;
    SmallFish3.hidden = YES;
    
    HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    Intro2.text = [NSString stringWithFormat:@"High Score: %i", HighScore];
    
    
    backgroundMusic = [self setupAudioPlayerWithFile:@"SABackground" type:@"mp3"];
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end