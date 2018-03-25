//
//  HomeViewController.m
//  TabBarControllerCustomDemo
//
//  Created by sjimac01 on 2018/1/24.
//  Copyright © 2018年 sjimac01. All rights reserved.
//

#import "HomeViewController.h"
#import "Define.h"
#import "HomeCell.h"
#import "HomeDetailViewController.h"
#import "TabBarController.h"
#import "Tabbar.h"
@interface HomeViewController ()<UINavigationControllerDelegate,UIViewControllerAnimatedTransitioning,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataSource;       // 图片数组
@property (strong, nonatomic) NSMutableArray *titles;           // 主标题数组
@property (strong, nonatomic) NSMutableArray *titleTwos;        // 副标题数组
@property (strong, nonatomic) NSMutableArray *contents;         // 内容数组

@property (strong, nonatomic) UIView *headerView;               // 头部
@property (strong, nonatomic) UILabel *timeLabel;               // 时间
@property (strong, nonatomic) UILabel *titleLabel;              // Today
@property (strong, nonatomic) UIButton *userButton;             //

@end

@implementation HomeViewController
{
    NSIndexPath *selectIndexPath;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 隐藏导航条
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 设置navigaitonControllerDelegate
    self.navigationController.delegate = self;
    // 隐藏状态栏
    [UIView animateWithDuration:0.2 animations:^{
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = [self buildHeaderView];
}

#pragma mark - Today 头像 UI

- (UIView *)buildHeaderView {
    
    // header
    self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 115);
    // 日期
    self.timeLabel.frame  = CGRectMake(SCREEN_RATIO(22), 30, SCREEN_WIDTH/2, 14);
    self.timeLabel.text = [self getWeekDay];
    // 标题
    self.titleLabel.frame = CGRectMake(SCREEN_RATIO(22),55 , (SCREEN_WIDTH/3)*2, 30);
    
    // 登录按钮
    self.userButton.frame = CGRectMake(SCREEN_WIDTH-44-SCREEN_RATIO(22), 38, 44, 44);
    self.userButton.layer.masksToBounds = YES;
    self.userButton.layer.cornerRadius = 22;
    [self.userButton addTarget:self action:@selector(userButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.userButton setImage:[UIImage imageNamed:@"Mine_photo_define"] forState:UIControlStateNormal];
    [self.headerView addSubview:self.timeLabel];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.userButton];
    
    return self.headerView;
}


#pragma mark - ==============================Click============================


- (void)userButtonClick {
    
}

#pragma mark - 获取当前时间，日期

- (NSString*)getWeekDay {
    
    NSDate*date =[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日"];
    NSString *dateTime = [formatter stringFromDate:date];
    NSArray*weekdays = [NSArray arrayWithObjects: [NSNull null],@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",nil];
    NSCalendar*calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone*timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit =NSCalendarUnitWeekday;
    NSDateComponents*theComponents = [calendar components:calendarUnit fromDate:date];
    NSString *weekTime = [weekdays objectAtIndex:theComponents.weekday];
    return [NSString stringWithFormat:@"%@  %@",dateTime,weekTime];
}
#pragma mark - 截屏

- (UIImage *)imageFromView {
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


#pragma mark - ==============================Data============================


- (void)initData {
    [self.dataSource addObjectsFromArray:@[@"Home_demo_01",@"Home_demo_02",@"Home_demo_03"]];
    
    [self.titles addObject:@"哈弗H6Coupe震撼上市"];
    [self.titles addObject:@"黑天鹅蛋糕 "];
    [self.titles addObject:@"高端健身会所入驻园区"];
    
    [self.titleTwos addObject:@"体验“中国芯”动力新哈弗H6 Coupe"];
    [self.titleTwos addObject:@"“我的一生，为美而感动，为美而存在”"];
    [self.titleTwos addObject:@"让运动助力工作生活"];
    
    [self.contents addObject:@"前卫设计动感十足 体验“中国芯”动力新哈弗H6 Coupe\n新哈弗H6 Coupe是长城公司采用全新设计语言开发的一款具有酷颜值，酷动力，酷装备的SUV。此次新哈弗H6 Coupe由内而外的全面升级，必将引来大众的追捧，开创哈弗SUV新篇章...\n1.5GDIT发动机应用CVVL、缸内直喷等前沿技术，动力响应快、燃油经济性好，最大功率124kW，1400转爆发最大扭矩285N·m，百公里加速9.7s，百公里油耗仅6.8L，荣获“中国心”2017十佳发动机；\n7DCT湿式双离合变速器采用最先进的摩擦材料，速比范围高达8.0，换挡平顺、可靠性高，提升燃油经济性,荣获2018届世界十佳变速器。\n整车采用超刚性一体式安全结构车身；\n配备奥托立夫6安全气囊、帘式气囊贯穿前后，保护面积更宽泛；\n盲点侦测，保证行车安全；\n配备360环视影像系统、LED组合前灯，驾乘更安全。\n外观采用钻石形体光学设计，车身线条硬朗连贯，更动感；\n内饰采用大面贯穿式整体设计，断面式仪表板极具立体感，打造科技及尊享兼备的体验。"];
    [self.contents addObject:@"一兆韦德健身管理有限公司目前有员工3000多人，拥有超过一百家健身会所。公司大力倡导绿色环保和时尚健身运动。凭借先进的管理理念、丰富的行业经验、完善的管理体系和管理团队，业已成为业内发展速度快、分店数量多、会员数量众多的健身连锁机构。公司多次通过权威机构认证，目前由国际著名投资公司——新加坡淡马锡集团注资，2015年更是获得了上海市著名商标，是健身行业内首个获得该荣誉的企业。公司希望通过全体员工的努力为社会提供有价值的健康生活服务，成为具世界竞争力的连锁健身企业之一。公司将打造更多的绿色生态会馆、为美好的城市生活贡献更多力量。"];
    [self.contents addObject:@"黑天鹅 \n隶属于北京黑天鹅餐饮管理有限公司，公司主要打造国内品质卓越，美味安心的蛋糕。黑天鹅蛋糕源于黄金比例的配方，精选世界各地优质食材，让您和朋友轻松享受精品蛋糕。\n用新锐的艺术理念和国际化的视野，带领团队重塑品牌，开启了黑天鹅与全球顶尖的甜品大师、设计大师和顶级原料商全面合作的阶段，让黑天鹅的产品和形象获得蜕变和飞跃，迅速跻身于国际一流烘焙品牌的行列。\n黑天鹅蛋糕推出以来，一直以一种“昂贵、奢华、精美”的形象示人，北京的首家实体店铺，自然要延续这个风格。先站在门口拍一张，这种风格的铺面，在蛋糕店里绝对令人耳目一新。"];

}



#pragma mark - ==============================Delegate============================




#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (SCREEN_WIDTH-40)*1.3+25;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HOMECELLID"];
    if (cell == nil) {
        cell = [[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HOMECELLID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.shouldGroupAccessibilityChildren = YES;
    }
    cell.titleLabel.text = self.titles[indexPath.row];
    cell.contentLabel.text = self.titleTwos[indexPath.row];
    cell.bgimageView.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
    cell.transform = CGAffineTransformMakeScale(1, 1);
    
    return cell;
    
}
// TODO: 即将进入高亮状态
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath  {
    selectIndexPath = indexPath;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.2 animations:^{
        cell.transform = CGAffineTransformMakeScale(0.9, 0.9);
    }];
    
    return YES;
}
// TODO: 结束高亮状态
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%u",cell.selected);
    
    if ([selectIndexPath isEqual:indexPath]) {
        [UIView animateWithDuration:0.2 animations:^{
            cell.transform = CGAffineTransformMakeScale(1, 1);
            return;
        }];
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.transform = CGAffineTransformMakeScale(0.9, 0.9);
    HomeDetailViewController *detail = [[HomeDetailViewController alloc]init];
    detail.selectIndexPath = indexPath;
    detail.bgImage = [self imageFromView];
    detail.titles = self.titles[indexPath.row];
    detail.titleTwo = self.titleTwos[indexPath.row];
    detail.content = self.contents[indexPath.row];
    detail.imageName = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}


#pragma mark - UIViewControllerAnimatedTransitioning
// MARK: 设置代理
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return self;
}

// MARK: 设置动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    HomeCell *cell = (HomeCell *)[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [toVC valueForKeyPath:@"headerImageView"];
    UIView *fromView = cell.bgView;
    UIView *containerView = [transitionContext containerView];
    UIView *snapShotView = [[UIImageView alloc]initWithImage:cell.bgimageView.image];
    snapShotView.frame = [containerView convertRect:fromView.frame fromView:fromView.superview];
    
    fromView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toView.hidden = YES;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-30, 30)];
    titleLabel.textColor = COLOR_WHITE;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = FONT_B(25);
    titleLabel.text = cell.titleLabel.text;
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, (SCREEN_WIDTH-40)*1.3-30, SCREEN_WIDTH-44, 15)];
    contentLabel.font = FONT_PF(15);
    contentLabel.textColor = COLOR_WHITE;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.alpha = 0.5;
    contentLabel.text =cell.contentLabel.text;
    [snapShotView addSubview:titleLabel];
    [snapShotView addSubview:contentLabel];
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [containerView layoutIfNeeded];
        toVC.view.alpha = 1.0f;
         Tabbar*tabBar = (Tabbar *)self.tabBarController.tabBar;
        if (IPHONE_X) {
            tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 83);
        } else {
            tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 49);
        }
        snapShotView.frame = [containerView convertRect:toView.frame fromView:toView.superview];
        titleLabel.frame = CGRectMake(22, 30, SCREEN_WIDTH-30, 30);
        contentLabel.frame = CGRectMake(22, SCREEN_WIDTH*1.3-30, SCREEN_WIDTH*1.3-44, 15);
        
    } completion:^(BOOL finished) {
        
        toView.hidden = NO;
        fromView.hidden = NO;
        [snapShotView removeFromSuperview];
        [self.tableView reloadData];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
 
}


#pragma mark - ==============================实例化============================



- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = COLOR_CLEAR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (UIView *)headerView {
    if (_headerView == nil) {
        _headerView = [[UIView alloc]init];
        _headerView.backgroundColor = COLOR_CLEAR;
        
    }
    return _headerView;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = FONT_14;
        _timeLabel.textColor = COLOR_6;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = FONT_B(30);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = COLOR_3;
        _titleLabel.text = HOME_TITLE;
    }
    return _titleLabel;
}

- (UIButton *)userButton {
    if (_userButton == nil) {
        _userButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _userButton.backgroundColor = COLOR_CLEAR;
    }
    return _userButton;
}

- (NSMutableArray *)titles {
    if (_titles == nil) {
        _titles = [[NSMutableArray alloc]init];
    }
    return _titles;
}

- (NSMutableArray *)titleTwos {
    if (_titleTwos == nil) {
        _titleTwos = [[NSMutableArray alloc]init];
    }
    return _titleTwos;
}

- (NSMutableArray *)contents {
    if (_contents == nil) {
        _contents = [[NSMutableArray alloc]init];
    }
    return _contents;
}

@end
