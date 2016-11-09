//
//  kqSelectedCameraView.m
//  KindergartenPro
//
//  Created by 海峰 on 14/12/27.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqSelectedCameraView.h"

@implementation kqSelectedCameraView

- (IBAction)tapCancelView:(UITapGestureRecognizer *)sender {
    [self.delegate didTabCancelView:self];
}

-(void)initTableView
{
    self.dataTableView.center = CGPointMake(self.center.x, self.center.y - 50.0f);
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
//    self.dataArray = [NSMutableArray array];
//    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
//    [dic1 setValue:@"yjkcs1" forKey:@"userName"];
//    [dic1 setValue:@"Yjkcs@123 " forKey:@"password"];
//    [dic1 setValue:@"001200011600000" forKey:@"cameraId"];
//    [dic1 setValue:@"长江讯飞测试2" forKey:@"cameraName"];
//    [dic1 setValue:@"大班" forKey:@"cameraClass"];
//    [self.dataArray addObject:dic1];
//    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
//    [dic2 setValue:@"yjkcs1" forKey:@"userName"];
//    [dic2 setValue:@"Yjkcs@123 " forKey:@"password"];
//    [dic2 setValue:@"001200011610000" forKey:@"cameraId"];
//    [dic2 setValue:@"长江讯飞测试1" forKey:@"cameraName"];
//    [dic2 setValue:@"大班" forKey:@"cameraClass"];
//    [self.dataArray addObject:dic2];
    [self.dataTableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
//    cell.textLabel.text = [dic valueForKey:@"cameraName"];
    cell.textLabel.text = [dic valueForKey:@"cameraName"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.delegate didTabCameraWithInfomationDictionary:[self.dataArray objectAtIndex:indexPath.row] andView:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
