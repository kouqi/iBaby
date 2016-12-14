//
//  kqTeacherSetPushViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-10-16.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTeacherSetPushViewController.h"

@interface kqTeacherSetPushViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *babyInfoSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *kindergartenNoticeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *babySignInSwitch;
@end

@implementation kqTeacherSetPushViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initTopBar];
    if (!(iOS7)) {
        self.babyInfoSwitch.frame = CGRectMake(214, 9, self.babyInfoSwitch.frame.size.width, self.babyInfoSwitch.frame.size.height);
        self.kindergartenNoticeSwitch.frame = CGRectMake(214, 53, self.kindergartenNoticeSwitch.frame.size.width, self.kindergartenNoticeSwitch.frame.size.height);
        self.babySignInSwitch.frame = CGRectMake(214, 97, self.babySignInSwitch.frame.size.width, self.babySignInSwitch.frame.size.height);
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

- (IBAction)tapSwitch:(UISwitch *)sender {
    switch (sender.tag) {
        case 1000:
            NSLog(@"0000");
            break;
        case 1001:
            NSLog(@"1111");
            break;
        case 1002:
            NSLog(@"2222");
            break;
        default:
            break;
    }
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
@end
