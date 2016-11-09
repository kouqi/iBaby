//
//  kqWonderfulMomentImageViewController.m
//  KindergartenPro
//
//  Created by 程海峰 on 16/7/10.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import "kqWonderfulMomentImageViewController.h"
#import "kqPersonalPhotosImageView.h"
@interface kqWonderfulMomentImageViewController ()<UIScrollViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *downLoadButton;
@property (strong, nonatomic) UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSMutableArray *imageArray;
@end

@implementation kqWonderfulMomentImageViewController

-(void) gainImageArray{
    UIView *superView = self.currentImageView.superview;
    if ([superView isKindOfClass:[kqPersonalPhotosImageView class]]) {
        superView = superView.superview;
    }
    self.imageArray = [NSMutableArray array];
    for (int i = 0; i < self.allIndexNumber; i++) {
        UIImageView *imageView = [superView viewWithTag:(PERSONALPHOTOSIMAGEVIEWTAG + i)];
        if ([imageView isKindOfClass:[kqPersonalPhotosImageView class]]) {
            imageView = [imageView viewWithTag:11186];
        }
        UIImage *image = imageView.image;
        [self.imageArray addObject:image];
    }
    [self initScrollView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    self.imageScrollView.backgroundColor = [UIColor blackColor];
    self.imageScrollView.pagingEnabled = YES;
    self.imageScrollView.delegate = self;
    [self.view addSubview:self.imageScrollView];
    [self gainImageArray];
    self.currentIndex = self.index;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    [self.imageScrollView addGestureRecognizer:tap];
    // Do any additional setup after loading the view from its nib.
}

-(void) back{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}

-(void) initScrollView{
    for (int i = 0; i < self.allIndexNumber; i++) {
        UIImage *image = [self.imageArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        imageView.image = image;
        
        CGFloat h1 = (SCREEN_W / image.size.width) * image.size.height;
        if (h1 > SCREEN_H) {
            UIScrollView *iiScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(i * SCREEN_W, 0, SCREEN_W, SCREEN_H)];
            iiScrollView.contentSize = CGSizeMake(SCREEN_W, h1);
            imageView.frame = CGRectMake(0, 0, SCREEN_W, h1);
            [iiScrollView addSubview:imageView];
            [self.imageScrollView addSubview:iiScrollView];
        }else{
            imageView.frame = CGRectMake(i * SCREEN_W, (SCREEN_H - h1) / 2, SCREEN_W, h1);
            [self.imageScrollView addSubview:imageView];
        }
    }
    self.imageScrollView.contentSize = CGSizeMake(self.allIndexNumber * SCREEN_W, SCREEN_H);
    [self.imageScrollView scrollRectToVisible:CGRectMake(self.index * SCREEN_W, 0, SCREEN_W, SCREEN_H) animated:NO];
    [self.view bringSubviewToFront:self.pageControl];
    [self.view bringSubviewToFront:self.downLoadButton];
    self.pageControl.numberOfPages = self.allIndexNumber;
    self.pageControl.currentPage = self.currentIndex;
}

- (IBAction)pageControlValueChanged:(UIPageControl *)sender {
    self.currentIndex = sender.currentPage;
    [self.imageScrollView scrollRectToVisible:CGRectMake(self.currentIndex * SCREEN_W, 0, SCREEN_W, SCREEN_H) animated:NO];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int cc = scrollView.contentOffset.x / SCREEN_W;
    self.currentIndex = cc;
    self.pageControl.currentPage = self.currentIndex;
}

- (IBAction)tapDownLoadImageView:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"保存图片到手机？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            NSLog(@"000");
        }
            break;
            
        default:
        {
            UIImageWriteToSavedPhotosAlbum([self.imageArray objectAtIndex:self.currentIndex], self, @selector(image:didFinishSavingWithError:contextInfo:),nil);
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
