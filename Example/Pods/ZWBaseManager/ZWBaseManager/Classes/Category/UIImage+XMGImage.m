//
//  UIImage+XMGImage.m
//  喜马拉雅FM
//
//  Created by ZW on 16/8/1.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "UIImage+XMGImage.h"

@implementation UIImage (XMGImage)

+ (UIImage *)originImageWithName: (NSString *)name {

    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}

- (UIImage *)circleImage {

    CGSize size = self.size;
    CGFloat drawWH = size.width < size.height ? size.width : size.height;
    // 1. 开启图形上下文
    UIGraphicsBeginImageContext(CGSizeMake(drawWH, drawWH));
    // 2. 绘制一个圆形区域, 进行裁剪
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect clipRect = CGRectMake(0, 0, drawWH, drawWH);
    CGContextAddEllipseInRect(context, clipRect);
    CGContextClip(context);

    // 3. 绘制大图片
    CGRect drawRect = CGRectMake(0, 0, size.width, size.height);
    [self drawInRect:drawRect];

    // 4. 取出结果图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();

    // 5. 关闭上下文
    UIGraphicsEndImageContext();
    
    return resultImage;

}

+(UIImage *)produceNewImageWithSmallImage:(UIImage *)image smallImageSize:(CGSize)smallImageSize withOutSize:(CGSize)outSize{
    //矩形路径
    UIBezierPath *outerPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, outSize.width, outSize.height)];
    UIGraphicsBeginImageContextWithOptions(outSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);{
        // 翻转context （画布）
        CGContextTranslateCTM(context, 0, outSize.height);
        CGContextScaleCTM(context, 1, -1);
        //画一个矩形并填充一个自定义颜色（与给的logo图背景颜色相同正好无缝衔接也可以切一个透明的）
        CGContextAddPath(context, outerPath.CGPath);
        CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
        CGContextDrawPath(context, kCGPathFill);
        CGContextStrokePath(context);
        //绘制图片在矩形中心位置
        CGContextDrawImage(context, CGRectMake((outSize.width-smallImageSize.width)/2, (outSize.height-smallImageSize.height)/2,
                                               smallImageSize.width, smallImageSize.height), image.CGImage);
    }CGContextRestoreGState(context);
    UIImage *radiusImage  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return radiusImage;
}



@end
