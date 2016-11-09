//
//  kqFoundViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqFoundViewController.h"
#import "kqFoundCell.h"
#import "kqFoundDetailViewController.h"
@interface kqFoundViewController ()
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSString *fileUrlString;
@end

@implementation kqFoundViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)downLoadFoundDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.dataArray = [NSMutableArray arrayWithArray:arr];
            self.fileUrlString = [NSString stringWithFormat:@"%@",[dic valueForKey:@"fileUrl"]];
            [self initRowHightArray];
        }else{
            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"暂无数据！"];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void) initRowHightArray
{
    self.rowHeightArray = [NSMutableArray array];
    for (NSDictionary *dic in self.dataArray) {
        CGFloat height = 25.0f;
        NSString *content = [dic valueForKey:@"noticeContent"];
        if (content) {
            CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(300, 500) lineBreakMode:NSLineBreakByWordWrapping];
            if (size.height >= 60.0f) {
                height += 60.0f;
            }else if (size.height >= 20.0f) {
                height += size.height;
            }else{
                height += 20.0f;
            }
        }
        NSArray *imgList = [dic valueForKey:@"imgList"];
        if (imgList.count != 0) {
            height += 160.0f;
        }
        height += 5.0f;
        [self.rowHeightArray addObject:[NSNumber numberWithFloat:height]];
    }
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    if (self.isPush) {
        [self initTopBar];
    }
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64)];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.isTeacher) {
        [dl downLoadFoundWithType:2];
    }else{
       [dl downLoadFoundWithType:1];
    }
    // Do any additional setup after loading the view from its nib.
}

-(void) initTopBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
    [leftButton setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.dataArray.count;
//    return 10.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [[self.rowHeightArray objectAtIndex:indexPath.row] floatValue];
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqFoundCell *cell = (kqFoundCell *) [[[NSBundle mainBundle] loadNibNamed:@"kqFoundCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    cell.foundTitleLabel.text = [dic valueForKey:@"noticeTitle"];
    cell.foundTimeLabel.text = [[dic valueForKey:@"editDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    cell.foundTimeLabel.frame = CGRectMake(SCREEN_W - 10 - 110, 5, 110, 15);
    NSString *content = [dic valueForKey:@"noticeContent"];
    NSArray *imgList = [dic valueForKey:@"imgList"];
    if (content) {
        CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(300, 500) lineBreakMode:NSLineBreakByWordWrapping];
        if (size.height >= 60.0f) {
            cell.foundContentLabel.frame = CGRectMake(cell.foundContentLabel.frame.origin.x, cell.foundContentLabel.frame.origin.y, cell.foundContentLabel.frame.size.width, 60.0f);
        }else if (size.height >= 20.0f) {
            cell.foundContentLabel.frame = CGRectMake(cell.foundContentLabel.frame.origin.x, cell.foundContentLabel.frame.origin.y, cell.foundContentLabel.frame.size.width, size.height);
        }
        if (imgList.count != 0) {
            cell.foundImageView.frame = CGRectMake(cell.foundImageView.frame.origin.x, cell.foundContentLabel.frame.origin.y + cell.foundContentLabel.frame.size.height + 5.0f, cell.foundImageView.frame.size.width, cell.foundImageView.frame.size.height);
            NSString *url = [NSString stringWithFormat:@"%@%@",self.fileUrlString,[[imgList objectAtIndex:0] valueForKey:@"imgPath"]];
            [cell.foundImageView setImageWithURL:[NSURL URLWithString:url]];
        }else{
            cell.foundImageView.hidden = YES;
        }
        cell.foundContentLabel.text = content;
    }else{
        if (imgList.count != 0) {
            cell.foundImageView.frame = CGRectMake(cell.foundImageView.frame.origin.x, cell.foundContentLabel.frame.origin.y , cell.foundImageView.frame.size.width, cell.foundImageView.frame.size.height);
            NSString *url = [NSString stringWithFormat:@"%@%@",self.fileUrlString,[[imgList objectAtIndex:0] valueForKey:@"imgPath"]];
            [cell.foundImageView setImageWithURL:[NSURL URLWithString:url]];
        }else{
            cell.foundImageView.hidden = YES;
        }
        cell.foundContentLabel.hidden = YES;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    kqFoundDetailViewController *fdVC = [[kqFoundDetailViewController alloc] initWithNibName:@"kqFoundDetailViewController" bundle:nil];
//    fdVC.title = @"发现详情";
    fdVC.dataDictionary = [self.dataArray objectAtIndex:indexPath.row];
    fdVC.fileUrlString = self.fileUrlString;
    [self.navigationController pushViewController:fdVC animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end