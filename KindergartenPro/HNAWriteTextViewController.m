//
//  HNAWriteTextViewController.m
//  HNAHRMPro
//
//  Created by 海峰 on 14-3-7.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "HNAWriteTextViewController.h"

@interface HNAWriteTextViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;

@end

@implementation HNAWriteTextViewController

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
    self.contentTextView.frame = CGRectMake(5, 0, 310, 280);
    self.contentTextView.delegate = self;
    [self initTopBar];
    [self.contentTextView becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

-(void)sendFeedbackToServeDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.contentTextView.text = @"";
    return YES;
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

-(void) keyBoardWillShow:(NSNotification *)notification
{
    NSDictionary *dic = [notification userInfo];
    CGSize kBsize = [[dic objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    self.contentTextView.frame = CGRectMake(5, 0, SCREEN_W - 10, SCREEN_H - kBsize.height - 64 - 40);
    self.commitButton.frame = CGRectMake(10, self.contentTextView.frame.origin.y + self.contentTextView.frame.size.height + 5, 300, 30.0f);
    self.commitButton.hidden = NO;
}

- (IBAction)tapCommitButton:(id)sender {
    if ([self checkSignature]) {
        [self.contentTextView resignFirstResponder];
        [HNAGeneral showOnWindow:@"反馈中"];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl sendFeedbackToServeWithContent:self.contentTextView.text];
    }
}

-(BOOL) checkSignature
{
    if ([self.contentTextView.text isEqualToString:@"请输入内容..."]||[self.contentTextView.text isEqualToString:@""]) {
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请输入内容"];
        [HNAGeneral showTipTextOnWindow:@"请输入内容"];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
