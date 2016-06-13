//
//  Gennerator.m
//  HYF--二维码
//
//  Created by Bill on 11/6/16.
//  Copyright © 2016年 my xcode01. All rights reserved.
//

#import "Gennerator.h"
#import "QRCodeManager.h"
#import <CoreImage/CoreImage.h>


@interface Gennerator ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ImageV;

@end


@implementation Gennerator


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)even{

    NSArray *resultArray = [[QRCodeManager shareInstance] detectorQRCodeWithQRCodeImage:self.ImageV.image];
    
    for (NSString *resulStr in resultArray) {
        NSLog(@"%@", resulStr);

    }

}

- (IBAction)photo:(UIButton *)sender {
    
    // 1.判断点的哪一个按钮
    UIImagePickerControllerSourceType sourceType = sender.tag == 1 ? UIImagePickerControllerSourceTypeCamera : UIImagePickerControllerSourceTypePhotoLibrary;
    
    // 2.判断数据源是否可用
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
        NSLog(@"数据源不可用");
        return;
    }
    
    // 3.创建照片选择控制器
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    
    // 4.设置数据源
    ipc.sourceType = sourceType;
    
    // 5.设置代理
    ipc.delegate = self;
    
    // 6.弹出控制器
    [self presentViewController:ipc animated:YES completion:nil];
}


//代理方法,把图片放到
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    // 1.获取选中的图片
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    
    // 2.将照片显示在imageView中
    self.ImageV.image = selectedImage;
    
    // 3.退出控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    

}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
