//
//  SoundManager.h
//  Evil Studios Coding Exercise
//
//  Created by Jerry Phillips on 1/14/16.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundManager : NSObject <AVAudioPlayerDelegate>

+(SoundManager *) soundObject;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

-(void)playAudio:(NSURL *)url;
-(void)stopAudio;



@end
