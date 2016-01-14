//
//  SoundManager.m
//  Evil Studios Coding Exercise
//
//  Created by Jerry Phillips on 1/14/16.
//
//

#import "SoundManager.h"
#import "Constants.h"

@implementation SoundManager

+(SoundManager *) soundObject
{
    static SoundManager *sSoundObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sSoundObject = [[SoundManager alloc] init];
    });
    
    return sSoundObject;
}

-(void)playAudio:(NSURL *)url
{
    _audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    _audioPlayer.delegate = self;
    [_audioPlayer prepareToPlay];
    [_audioPlayer play];
    
}

-(void)stopAudio
{
    [_audioPlayer stop];
}
-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [[NSNotificationCenter defaultCenter]postNotificationName:PLAYBACKENDED object:nil];
}





@end
