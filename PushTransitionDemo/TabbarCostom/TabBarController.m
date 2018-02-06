//
//  TabBarController.m
//  TabBarControllerCustomDemo
//
//  Created by sjimac01 on 2018/1/24.
//  Copyright © 2018年 sjimac01. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"
#import "FunctionViewController.h"
#import "CenterViewController.h"
#import "CommunityViewController.h"
#import "MineViewController.h"
#import "Tabbar.h"
@interface TabBarController ()
@property (strong, nonatomic) Tabbar *customTabbar;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 首页
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self setViewController:homeVC title:@"首页" image:@"TB_home_normal" selectImage:@"TB_home_press"];
    // 功能
    FunctionViewController *funcVC = [[FunctionViewController alloc]init];
    [self setViewController:funcVC title:@"功能" image:@"TB_function_normal" selectImage:@"TB_function_press"];
    // 社区
    CommunityViewController *commVC = [[CommunityViewController alloc]init];
    [self setViewController:commVC title:@"社区" image:@"TB_community_normal" selectImage:@"TB_community_press"];
    // 我的
    MineViewController *mineVC = [[MineViewController alloc]init];
    [self setViewController:mineVC title:@"我的" image:@"TB_mine_normal" selectImage:@"TB_mine_press"];

    self.customTabbar = [[Tabbar alloc]initWithCenterImage:@"homePage_saoyisao" selectImage:@"homePage_saoyisao" target:self action:@selector(CenterButtonClick)];
    [self setValue:self.customTabbar forKey:@"tabBar"];
}

#pragma mark - 添加子控制器
-(void)setViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage {
    static NSInteger index = 0;
    viewController.tabBarItem.title = title;
    viewController.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.tag = index;
    index++;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
}

- (void)CenterButtonClick {
    CenterViewController *centerVC = [[CenterViewController alloc]init];
    [self presentViewController:centerVC animated:YES completion:nil];
}


@end
