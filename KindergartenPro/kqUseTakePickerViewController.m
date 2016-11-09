//
//  kqUseTakePickerViewController.m
//  kqCameroDemo
//
//  Created by 海峰 on 14-8-18.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqUseTakePickerViewController.h"

@interface kqUseTakePickerViewController ()
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation kqUseTakePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)tapCancelButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:^{
        [self.delegate cacelUsePicture];
    }];
}
- (IBAction)tapUseButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:^{
        [self.delegate usePicture:self.image];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.imageView setImage:self.image];
    self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x, SCREEN_H - self.bottomView.frame.size.height, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y, self.imageView.frame.size.width, self.view.frame.size.height - self.bottomView.frame.size.height);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
