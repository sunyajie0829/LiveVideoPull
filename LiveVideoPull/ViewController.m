//
//  ViewController.m
//  LiveVideoPull
//
//  Created by weistek on 2019/2/28.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "ViewController.h"
#import <AliyunPlayerSDK/AliVcMediaPlayer.h>
@interface ViewController ()
@property (nonatomic,strong) AliVcMediaPlayer *mediaPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPlayer];
}
- (void)initPlayer{
    self.mediaPlayer = [[AliVcMediaPlayer alloc] init];
    [self.mediaPlayer create:self.view];
    
    self.mediaPlayer.mediaType = MediaType_LIVE;
    
    self.mediaPlayer.timeout = 25000;
    self.mediaPlayer.dropBufferDuration = 8000;
    
    NSURL *url = [NSURL URLWithString:@"rtmp://192.168.10.107:8889/felix/01"];
    AliVcMovieErrorCode err = [self.mediaPlayer prepareToPlay:url];
    if (err == ALIVC_SUCCESS){
        NSLog(@"初始化成功，开始播放");
        [self.mediaPlayer play];
    }else{
        NSLog(@"初始化错误");
    }
}
@end
