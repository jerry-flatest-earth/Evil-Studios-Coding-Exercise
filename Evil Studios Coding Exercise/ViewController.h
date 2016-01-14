//
//  ViewController.h
//  Evil Studios Coding Exercise
//
//  Created by Jerry Phillips on 1/14/16.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *playStopButton;

@end

