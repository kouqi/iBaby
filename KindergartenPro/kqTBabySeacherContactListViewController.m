//
//  kqTBabySeacherContactListViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTBabySeacherContactListViewController.h"

@interface kqTBabySeacherContactListViewController ()

@end

@implementation kqTBabySeacherContactListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)tapCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 64, 320, [HNAGeneral fixIP5:416]);
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultArray.count;
//    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqTBabyContactCell *cell = (kqTBabyContactCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqTBabyContactCell" owner:self options:nil] objectAtIndex:0];
    NSDictionary *dic = [self.resultArray objectAtIndex:indexPath.row];
    [cell initCellWithDic:dic withIsBabyList:self.isBabyList andIsBabyInfo:self.isBabyInfo];
//    cell.nameLabel.text = [dic valueForKey:@"babyName"];
//    cell.relationLabel.text = [NSString stringWithFormat:@"家长：%@",[dic valueForKey:@"name"]];
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
}

-(void)didTapMessageButtonWith:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:NO completion:^{
        [self.delegate didSelectedContactWithDataDictionary:[self.resultArray objectAtIndex:indexPath.row]];
    }];
    
}

-(void)didTapCallButtonWith:(NSIndexPath *)indexPath
{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[[[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] valueForKey:@"loginName"]]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self dismissViewControllerAnimated:NO completion:^{
        [self.delegate didSelectedContactWithDataDictionary:[self.resultArray objectAtIndex:indexPath.row]];
    }];
}

#pragma mark - seacherBarDelegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (!([searchText isEqualToString:@""] || searchText == nil)) {
        NSString *seaP = [ChineseToPinyin pinyinFromChiniseString:searchText];
        self.resultArray = [NSMutableArray array];
        for (NSArray *arr in self.dataArray) {
            for (NSDictionary *dic in arr) {
                NSString *babyNameYuan = [dic valueForKey:@"babyName"];
                NSString *babyNamePinyin = [ChineseToPinyin pinyinFromChiniseString:babyNameYuan];
                if ([babyNamePinyin containsString:seaP]) {
                    [self.resultArray addObject:dic];
                }
            }
        }
    }else{
        [self.resultArray removeAllObjects];
    }
    [self.tableView reloadData];
    NSLog(@"-----------%@",searchText);
}

@end
