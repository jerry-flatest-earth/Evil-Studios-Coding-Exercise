//
//  ViewController.m
//  Evil Studios Coding Exercise
//
//  Created by Jerry Phillips on 1/14/16.
//
//

#import "ViewController.h"
#import "SoundManager.h"
#import "Constants.h"


@interface ViewController ()


@end

SoundManager *soundManager;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    soundManager = [SoundManager soundObject];
    soundManager.audioPlayer.delegate = self;
    [soundManager.audioPlayer  prepareToPlay];
    [_playStopButton addTarget:self action:@selector(playStop) forControlEvents:UIControlEventTouchUpInside];
    
    //Change the button state back when playback ends
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeButtonState) name:PLAYBACKENDED object:nil];
 
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
     
     
     -(void) playStop
     {
         
         if (soundManager.audioPlayer.playing)
         {
             [_playStopButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
             [soundManager stopAudio];

            
             
         }
         else
         {
         [_playStopButton setImage:[UIImage imageNamed:@"stop"] forState:UIControlStateNormal];
             NSURL* url = [[NSBundle mainBundle] URLForResource:@"tftm005" withExtension:@"mp3"];
             [soundManager playAudio:url];
             
             
         }
         
         
     }

//set the button image back to play
-(void)changeButtonState
{
    [_playStopButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
}

-(void)playbackError
{
     UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"OOPS there was an issue with playback"  message: nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}



@end
