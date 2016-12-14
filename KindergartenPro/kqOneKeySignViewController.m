//
//  kqOneKeySignViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 15/3/16.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import "kqOneKeySignViewController.h"

@interface kqOneKeySignViewController ()
@property (weak, nonatomic) IBOutlet UILabel *noResultLabel;
@property (weak, nonatomic) IBOutlet UIButton *enterButton;
@property (weak, nonatomic) IBOutlet UIButton *babyStateButton;
@property (weak, nonatomic) IBOutlet UILabel *babyStateLabel;
@property (weak, nonatomic) IBOutlet UIView *babyStateView;
@property (weak, nonatomic) IBOutlet UIButton *seacherButton;
@property (weak, nonatomic) IBOutlet UITextField *seacherTextField;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *seacherView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UIButton *allSelectedButton;
@property (assign, nonatomic) BOOL isAllSelectedMode;
@property (strong, nonatomic) NSString *babyStateString,*inOut;
@property (strong, nonatomic) NSMutableArray *resultArray,*pushArray;
@end

@implementation kqOneKeySignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initTopBar];
    self.title = @"一键签到";
    self.isAllSelectedMode = NO;
    self.babyStateString = @"未记录";
    [self initView];
    self.resultArray = [NSMutableArray array];
    for (NSDictionary *dic in self.dataArray) {
        [self.resultArray addObject:dic];
    }
    [self initScrollView];
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
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 42, 42);
    [button setTitle:@"搜索" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(tapFreshButton) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, 60, 42);
    [button1 setTitle:@"全选" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(tapPiliangButton) forControlEvents:UIControlEventTouchUpInside];
    self.allSelectedButton = button1;
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem* right1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:right,right1, nil];
}

-(void) tapBackButton
{
    [self.delegate didChangeBabyStatues];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) tapFreshButton
{
    self.seacherView.hidden = NO;
    self.seacherView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.seacherView.frame.size.height);
    self.contentView.frame = CGRectMake(0, self.seacherView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.seacherView.frame.size.height);
    self.enterButton.frame = CGRectMake(self.enterButton.frame.origin.x, (self.contentView.frame.size.height - 40.0f), self.view.frame.size.width, self.enterButton.frame.size.height);
    self.scrollView.frame = CGRectMake(0, self.babyStateView.frame.size.height, self.view.frame.size.width, self.contentView.frame.size.height - self.enterButton.frame.size.height - self.babyStateView.frame.size.height);
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:[kqOneKeySignTbabyView class]]) {
            kqOneKeySignTbabyView *okstbv = (kqOneKeySignTbabyView *) view;
            [okstbv removeFromSuperview];
        }
    }
    [self initScrollView];
}

-(void) tapPiliangButton
{
    if (self.isAllSelectedMode) {
        [self setAllSubViewSelectedWithSelectde:NO];
        self.isAllSelectedMode = NO;
        [self.allSelectedButton setTitle:@"全选" forState:UIControlStateNormal];
    }else{
        [self setAllSubViewSelectedWithSelectde:YES];
        self.isAllSelectedMode = YES;
        [self.allSelectedButton setTitle:@"取消全选" forState:UIControlStateNormal];
    }
}

-(void) setAllSubViewSelectedWithSelectde:(BOOL) isSelected
{
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:[kqOneKeySignTbabyView class]]) {
            kqOneKeySignTbabyView *okstbv = (kqOneKeySignTbabyView *) view;
            [okstbv setViewSelectedWith:isSelected];
        }
    }
}

-(void)didTapSelectedImageViewWithViewTag:(NSInteger)viewTag andFlag:(BOOL)isSelected
{
    if (self.isAllSelectedMode) {
        self.isAllSelectedMode = NO;
        [self.allSelectedButton setTitle:@"全选" forState:UIControlStateNormal];
    }
}

-(void) initView
{
    self.seacherView.frame = CGRectMake(self.seacherView.frame.origin.x, self.seacherView.frame.origin.y, self.view.frame.size.width, self.seacherView.frame.size.height);
    self.seacherButton.layer.borderWidth = 0.5f;
    self.seacherButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.seacherView.hidden = YES;
    
    self.contentView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64.0f);
    CGFloat indexX = (self.view.frame.size.width - 130.0f) / 2;
    self.babyStateLabel.frame = CGRectMake(indexX, self.babyStateLabel.frame.origin.y, self.babyStateLabel.frame.size.width, self.babyStateLabel.frame.size.height);
    self.babyStateButton.frame = CGRectMake(indexX + self.babyStateLabel.frame.size.width, self.babyStateButton.frame.origin.y, self.babyStateButton.frame.size.width, self.babyStateButton.frame.size.height);
    self.enterButton.frame = CGRectMake(self.enterButton.frame.origin.x, (self.contentView.frame.size.height - 40.0f), self.view.frame.size.width, self.enterButton.frame.size.height);
    
    UIScreen *mainScreen = [UIScreen mainScreen];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.babyStateView.frame.size.height, self.view.frame.size.width, self.contentView.frame.size.height - self.enterButton.frame.size.height - self.babyStateView.frame.size.height)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    CGFloat HY = 20.0f;
    CGFloat indexY = 20.0f;
    CGFloat indexH = 80.0f;
    self.scrollView.contentSize = CGSizeMake(mainScreen.bounds.size.width, indexY + indexH + HY);
    [self.contentView addSubview:self.scrollView];
}

/**
 *  初始化scrollview
 */
-(void) initScrollView
{
    UIScreen *mainScreen = [UIScreen mainScreen];
    CGFloat indexX = (mainScreen.bounds.size.width - 3 * 88.0f) / 4.0f;
    CGFloat WX = indexX,HY = 20.0f;
    CGFloat indexY = 20.0f;
    CGFloat indexH = 82.0f;
    CGFloat indexW = 88.0f;
    for (NSInteger i = 0; i < self.resultArray.count; i++) {
        kqOneKeySignTbabyView *okstv = (kqOneKeySignTbabyView *)[[[NSBundle mainBundle] loadNibNamed:@"kqOneKeySignTbabyView" owner:self options:nil] objectAtIndex:0];
        okstv.frame = CGRectMake(indexX, indexY, indexW, indexH);
        okstv.dataDictionary = [self.resultArray objectAtIndex:i];
        okstv.tag = PERSONALPHOTOSIMAGEVIEWTAG + i;
        [okstv initOneKeySign];
        [self.scrollView addSubview:okstv];
        if (i + 1 < self.resultArray.count) {
            indexX += indexW + WX;
            if (indexX + indexW + WX > mainScreen.bounds.size.width) {
                indexX = (mainScreen.bounds.size.width - 3 * 88.0f) / 4.0f;
                indexY += indexH + HY;
            }
        }
    }
    self.scrollView.contentSize = CGSizeMake(mainScreen.bounds.size.width, indexY + indexH + HY);
}

- (IBAction)tapRecoderStatus:(UIButton *)sender {
    HNACallPhoneView *callView = (HNACallPhoneView *)[[[NSBundle mainBundle] loadNibNamed:@"HNACallPhoneView" owner:self options:nil] objectAtIndex:0];
    [callView initView];
    [callView chageViewFrame];
    callView.delegate = self;
    [self.view addSubview:callView];
}

-(void)didTapStatusWithString:(NSString *)statusText andView:(UIView *)view
{
    [view removeFromSuperview];
    self.babyStateString = statusText;
    [self.babyStateButton setTitle:self.babyStateString forState:UIControlStateNormal];
}

-(void)didTapCancelView:(UIView *)view
{
    [view removeFromSuperview];
}

- (IBAction)tapSeacherButton:(id)sender {
    [self.resultArray removeAllObjects];
    NSString *seacherString = self.seacherTextField.text;
    if ([seacherString isEqualToString:@""]) {
        for (NSDictionary *dic in self.dataArray) {
            [self.resultArray addObject:dic];
        }
    }else{
        for (NSDictionary *dic in self.dataArray) {
            NSString *userName = [dic valueForKey:@"babyName"];
            if (userName.length >= seacherString.length) {
                if ([userName rangeOfString:seacherString].location != NSNotFound) {
                    [self.resultArray addObject:dic];
                }
            }
        }
    }
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:[kqOneKeySignTbabyView class]]) {
            kqOneKeySignTbabyView *okstbv = (kqOneKeySignTbabyView *) view;
            [okstbv removeFromSuperview];
        }
    }
    if (self.resultArray.count == 0) {
        self.noResultLabel.hidden = NO;
    }else{
        self.noResultLabel.hidden = YES;
        [self initScrollView];
    }
}

- (IBAction)tapEnterButton:(id)sender {
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    if ([self.babyStateString isEqualToString:@"未记录"]) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请选择状态！"];
    }else{
        NSMutableArray *babyIdArray = [NSMutableArray array];
        self.pushArray = [NSMutableArray array];
        for (UIView *view in self.scrollView.subviews) {
            if ([view isKindOfClass:[kqOneKeySignTbabyView class]]) {
                kqOneKeySignTbabyView *okstbv = (kqOneKeySignTbabyView *) view;
                if (okstbv.isSelected) {
                    NSLog(@"----------%@",okstbv.dataDictionary);
                    if ([okstbv.dataDictionary valueForKey:@"id"] != nil) {
                        [babyIdArray addObject:[okstbv.dataDictionary valueForKey:@"id"]];
                    }
                    if ([okstbv.dataDictionary valueForKey:@"deviceid"] != nil) {
                        [self.pushArray addObject:[okstbv.dataDictionary valueForKey:@"deviceid"]];
                    }
                }
            }
        }
        if (babyIdArray.count == 0) {
            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"未选择宝贝！"];
        }else{
            [HNAGeneral showOnWindow:@"记录中"];
            HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
            dl.delegate = self;
            NSString *state = nil;
            if ([self.babyStateString isEqualToString:@"未纪录"]) {
            }else if ([self.babyStateString isEqualToString:dkas.signIn]){
                state = @"0";
            }else if ([self.babyStateString isEqualToString:@"病假"]){
                state = @"2";
            }else if ([self.babyStateString isEqualToString:@"事假"]){
                state = @"3";
            }else if ([self.babyStateString isEqualToString:dkas.signOut]){
                state = @"1";
            }
            [dl piLiangQiandaoWithState:state andBabyIdArray:babyIdArray];
        }
        
    }
}

-(void)piLiangQiandaoDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        self.inOut = [NSMutableString stringWithFormat:@"%@",[dic valueForKey:@"inOut"]];
        HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
        dlm.delegate = self;
        [dlm downLoadTeacherHomePage];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)downLoadTeacherHomePageDelegate:(NSDictionary *)dic
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    [HNAGeneral hidenHUD];
    [self.dataArray removeAllObjects];
    [self.resultArray removeAllObjects];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            
            NSString *urlStr = [dic valueForKey:@"fileUrl"];
            for (NSDictionary *dic in arr) {
                NSMutableDictionary *dics = [NSMutableDictionary dictionary];
//                [dics setValue:[dic valueForKey:@"name"] forKey:@"babyName"];
                [dics setValue:[dic valueForKey:@"babyName"] forKey:@"babyName"];
                [dics setValue:[dic valueForKey:@"babyState"] forKey:@"babyState"];
                [dics setValue:[dic valueForKey:@"id"] forKey:@"id"];
                [dics setValue:[dic valueForKey:@"loginName"] forKey:@"loginName"];
                [dics setValue:[NSString stringWithFormat:@"%@%@",urlStr,[dic valueForKey:@"imgPath"]] forKey:@"imgPath"];
                [self.dataArray addObject:dics];
                [self.resultArray addObject:dics];
            }
            [self initScrollView];
            [self setAllSubViewSelectedWithSelectde:NO];
            NSString *content;
            int io = [self.inOut intValue];
            switch (io) {
                case 0:
                    content = [NSString stringWithFormat:@"宝宝%@啦！",dkas.signIn];
                    break;
                case 1:
                    content = [NSString stringWithFormat:@"宝宝%@啦！",dkas.signOut];
                    break;
                case 2:
                    content = @"宝宝请病假啦！";
                    break;
                case 3:
                    content = @"宝宝请事假啦！";
                    break;
                case 4:
                    content = @"宝宝签到状态未知";
                    break;
                default:
                    break;
            }
            HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
            [dl sendJPushWithType:@"5" andContent:content andAlias:self.pushArray];
            
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
