//
//  kqWonderfulMomentDetailViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-21.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqWonderfulMomentDetailViewController.h"
#import "UIImageView+WebCache.h"
@interface kqWonderfulMomentDetailViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *imagePathArray;
@property (strong, nonatomic) UIImage *saveImage;
@end

@implementation kqWonderfulMomentDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) initScrollView
{
    for (int i = 0; i < self.imagePathArray.count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(320 * i, 0, SCREEN_W, SCREEN_H - 64 - 5)];
        view.tag = 1000 + i;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((320 - (SCREEN_H - 150) * 300 / 450) / 2, 10, (SCREEN_H - 150) * 300 / 450, (SCREEN_H - 150))];
        NSString *imageUrlString = [NSString stringWithFormat:@"%@",[self.imagePathArray objectAtIndex:i]];
        imageView.tag = 2000;
        [imageView setImageWithURL:[NSURL URLWithString:imageUrlString]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        if (i == 0) {
            self.saveImage = imageView.image;
        }
        [view addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(saveImageToAlbum:)];
        [imageView addGestureRecognizer:lp];
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (SCREEN_H - 95), SCREEN_W, 20)];
        numberLabel.textAlignment = NSTextAlignmentCenter;
        numberLabel.font = [UIFont systemFontOfSize:14.0f];
        numberLabel.textColor = [UIColor blackColor];
        numberLabel.text = [NSString stringWithFormat:@"%d/%lu",i + 1,(unsigned long)self.imagePathArray.count];
        [view addSubview:numberLabel];
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (SCREEN_H - 150) + 15, 300, 40)];
        descriptionLabel.textAlignment = NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.font = [UIFont systemFontOfSize:14.0f];
        descriptionLabel.textColor = RGB(104, 74, 89, 1);
        if ([[self.dataDictionary valueForKey:@"photoTitle"] isKindOfClass:[NSString class]]) {
            descriptionLabel.text = [self.dataDictionary valueForKey:@"photoTitle"];
        }
        [view addSubview:descriptionLabel];
        [self.scrollView addSubview:view];
    }
    for (int i = 1; i < self.imagePathArray.count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(320 * i, 0, 0.5, (SCREEN_H - 69))];
        view.backgroundColor = RGB(204, 197, 207, 1);
        [self.scrollView addSubview:view];
    }
}

-(void) saveImageToAlbum:(UILongPressGestureRecognizer *) sender
{
    if (self.saveImage) {
        return;
    }
    UIImageView *imageView = (UIImageView *) sender.view;
    self.saveImage = imageView.image;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"保存图片到手机？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    NSLog(@"---------%@",sender.view.class);
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            self.saveImage = nil;
            NSLog(@"000");
        }
            break;
            
        default:
        {
            UIImageWriteToSavedPhotosAlbum(self.saveImage, self, @selector(image:didFinishSavingWithError:contextInfo:),nil);
            NSLog(@"1111");
        }
            break;
    }
}

-(void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    self.saveImage = nil;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initTopBar];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 5, SCREEN_W, (SCREEN_H - 69))];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    NSString *photoPathStr = [self.dataDictionary valueForKey:@"photoPath"];
    NSArray *arr = [photoPathStr componentsSeparatedByString:@"|"];
    self.imagePathArray = [NSMutableArray array];
    if (arr.count != 0) {
        for (NSString *str in arr) {
            if (![str isEqualToString:@""]) {
                NSString *imageUrlString = [NSString stringWithFormat:@"%@%@",self.photoUrlString,str];
                [self.imagePathArray addObject:imageUrlString];
            }
        }
    }
    self.scrollView.contentSize = CGSizeMake(320 * self.imagePathArray.count, (SCREEN_H - 69));
    [self.view addSubview:self.scrollView];
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
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton addTarget:self action:@selector(tapLookBabyButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 6.0f, 60.0f, 23.0f);
    [rightButton setImage:[UIImage imageNamed:@"momentDowlond.png"] forState:UIControlStateNormal];
//    [rightButton setTitle:@"更多" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(void) tapLookBabyButton
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"保存图片到手机？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
//    UIActionSheet *choiceSheet;
//    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
//    if ([info.realName isEqualToString:[self.dataDictionary valueForKey:@"userName"]]) {
//        choiceSheet = [[UIActionSheet alloc] initWithTitle:@"更多" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:@"下载",nil];
//    }else{
//        choiceSheet = [[UIActionSheet alloc] initWithTitle:@"更多" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"下载",nil];
//    }
//    kqAppDelegate *app = (kqAppDelegate *)([UIApplication sharedApplication].delegate);
//    [choiceSheet showInView:app.window];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"------%ld",(long)buttonIndex);
}


-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

//TODO:scroll代理
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    int page = targetContentOffset->x / 320;
    UIView *view = [self.scrollView viewWithTag:(1000 + page)];
    UIImageView *imageView = (UIImageView *)[view viewWithTag:2000];
    self.saveImage = imageView.image;
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
