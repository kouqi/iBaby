//
//  kqSelectedCameraView.h
//  KindergartenPro
//
//  Created by 海峰 on 14/12/27.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SelectCameraDelegate <NSObject>

-(void) didTabCancelView:(UIView *) view;
-(void) didTabCameraWithInfomationDictionary:(NSDictionary *) infomationDictionary andView:(UIView *) view;

@end









@interface kqSelectedCameraView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (assign, nonatomic) id<SelectCameraDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
-(void) initTableView;
@end
