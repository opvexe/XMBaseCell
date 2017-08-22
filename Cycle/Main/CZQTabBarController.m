//
//  CZQTabBarController.m
//  宠仔圈
//
//  Created by jieku on 2017/5/15.
//  Copyright © 2017年 TSM. All rights reserved.
//

#import "CZQTabBarController.h"
#import "ViewController.h"
#import "GDSeviceViewController.h"
#import "QZQNavigationController.h"
#import "GDMineViewController.h"

@interface CZQTabBarController ()

@property (nonatomic, strong)UIButton *liveButton;

@end

@implementation CZQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self addChileVC];
}

- (void)addChileVC{

    ViewController *cicrl = [[ViewController alloc]init];
    QZQNavigationController *nav1 = [self setChildVC:cicrl title:@"自定义Cell" imageName:@"icon_circle_n" withSelectedName:@"icon_circle_s"];
    
    GDSeviceViewController *mine = [[GDSeviceViewController alloc]init];
    QZQNavigationController *nav2 =  [self setChildVC:mine title:@"自定义瀑布流" imageName:@"icon_myself_n" withSelectedName:@"icon_myself_s"];
    
    GDMineViewController    *GD_mine = [[GDMineViewController alloc]init];
    QZQNavigationController *GD_nv =  [self setChildVC:GD_mine title:@"自定区头" imageName:@"icon_myself_n" withSelectedName:@"icon_myself_s"];
    
    self.viewControllers = @[nav1,nav2,GD_nv];

}

- (QZQNavigationController *)setChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imgName withSelectedName:(NSString *)selectedName{
    
    vc.title                = title;
    vc.tabBarItem.image     = [[UIImage imageNamed:imgName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateSelected];
    QZQNavigationController *nav = [[QZQNavigationController alloc]initWithRootViewController:vc];

    
    return nav;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    [self beginAnimation];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self beginAnimation];
}
- (void)beginAnimation
{
    CATransition *animation         = [[CATransition alloc]init];
    animation.duration              = 0.5;
    animation.type                  = kCATransitionFade;
    animation.subtype               = kCATransitionFromRight;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.accessibilityFrame    = CGRectMake(0, 64, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    [self.view.layer addAnimation:animation forKey:@"switchView"];
}
@end
