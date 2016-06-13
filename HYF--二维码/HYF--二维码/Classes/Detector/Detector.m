//
//  Detector.m
//  HYF--二维码
//
//  Created by Bill on 11/6/16.
//  Copyright © 2016年 my xcode01. All rights reserved.
//

#import "Detector.h"
#import <CoreImage/CoreImage.h>
#import "QRCodeManager.h"

@interface Detector ()

@property (weak, nonatomic) IBOutlet UITextField *TextF;
@property (weak, nonatomic) IBOutlet UIImageView *ImageV;


@end



@implementation Detector
- (IBAction)GOGO:(id)sender {
    NSString *text=self.TextF.text;
    if (text.length==0) {
        NSLog(@"请输入文字");
        return ;
    }
    
    UIImage *image=[UIImage imageNamed:@"erha"];
    
    self.ImageV.image=[[QRCodeManager shareInstance]generateQRCodeWithMsg:text fgImage:image];
    
    
}

@end
