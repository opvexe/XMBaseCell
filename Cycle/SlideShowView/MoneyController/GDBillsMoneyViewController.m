//
//  GDBillsMoneyViewController.m
//  Cycle
//
//  Created by GDBank on 2017/7/28.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GDBillsMoneyViewController.h"
#import "MJExtension.h"

#import "GDHomeModel.h"

#import "GDBaseCell.h"
#import "NormalCell.h"
#import "VideoShowCell.h"
#import "WaterLayoutCell.h"

#import "GD_MoneyView.h"
@interface GDBillsMoneyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) GD_MoneyView       *headView;
@property (nonatomic, strong) NSMutableArray     *dateSouceArray;

@end

@implementation GDBillsMoneyViewController

-(UITableView *)homeTableView{
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -64) style:UITableViewStylePlain];
        _homeTableView.showsVerticalScrollIndicator =NO;
        _homeTableView.showsHorizontalScrollIndicator =NO;
        _homeTableView.delegate =self;
        _homeTableView.dataSource =self;
        _homeTableView.tableHeaderView = self.headView;
        _homeTableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        _homeTableView.showsVerticalScrollIndicator = NO;   //隐藏右侧滑动条
        _homeTableView.tableFooterView = [UIView new];
    }
    return _homeTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title  = @"额度";
    [self.view addSubview:self.homeTableView];
    
    NSArray *dataSocure= @[
                           @{@"title":@"个性签名",@"content":@"这个人好懒哦 什么也没写呼噜",@"isRightHide":@0,@"navigationTitle":@"编签名",@"ClassName":@"UpdateNicknameViewController",@"controllerType":@101},
                           @{@"title":@"自拍认证",@"content":@"还未认证",@"ClassName":@"WYAuthenticationDescriptionViewController",@"isRightHide":@1},
                           @{@"title":@"VIP中心",@"ClassName":@"WYVipCenterViewController",@"isRightHide":@1},
                           @{@"title":@"我的钱包",@"ClassName":@"WYMyWalletViewController",@"isRightHide":@1},
                           @{@"title":@"谁看过我",@"ClassName":@"WYVisitorsViewController",@"content":@"暂未访客",@"isRightHide":@1,@"CellType":@2},
                           @{@"title":@"礼物",@"CellType":@3}
                           ];
    _dateSouceArray = [GDHomeModel mj_objectArrayWithKeyValuesArray:dataSocure];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.001;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dateSouceArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    GDHomeModel *model =self.dateSouceArray[indexPath.row];
    
    switch (model.CellType) {
        case VideoCellType:{
            return 60;
        }
            break;
        case WaterLayoutCellType:{
            return 120;
        }
            break;
        default:{
            return 50;
        }
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GDHomeModel *model = self.dateSouceArray[indexPath.row];
    GDBaseCell *cell = nil;
    
    switch (model.CellType) {
        case NormalCellType:{
            cell = [NormalCell cellWithTableView:tableView];
        }
            break;
        case WaterLayoutCellType:{
            cell = [WaterLayoutCell cellWithTableView:tableView];
        }
            break;
        case VideoCellType:{
            cell = [VideoShowCell cellWithTableView:tableView];
        }
            break;
        default:
            cell = [NormalCell cellWithTableView:tableView];
            break;
    }
    
    if (indexPath.row==0) {         //隐藏顶部第一条线
        model.isTopHideLine =YES;
    }
    
    [cell InitDataViewModel:model];
    
    return cell;
}

-(NSMutableArray *)dateSouceArray{
    if (!_dateSouceArray) {
        _dateSouceArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dateSouceArray;
}

@end
