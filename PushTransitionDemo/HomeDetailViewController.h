//
//  HomeDetailViewController.h
//  PushTransitionDemo
//
//  Created by sjimac01 on 2018/2/5.
//  Copyright © 2018年 sjimac01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDetailViewController : UIViewController
@property (strong, nonatomic) UIImage *bgImage;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *titles;
@property (strong, nonatomic) NSString *titleTwo;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSIndexPath *selectIndexPath;
@end
