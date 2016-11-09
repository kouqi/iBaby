//
//  kqWonderfulMomentCell.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-7.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqWonderfulMomentCell.h"

@implementation kqWonderfulMomentCell

- (void)awakeFromNib
{
    // Initialization code
}

-(void) initCellWithDictionary:(NSDictionary *) dic andPhotoUrlString:(NSString *) photoUrlString
{
    self.nameLabel.text = [dic valueForKey:@"userName"];
    self.dic = [NSDictionary dictionaryWithDictionary:dic];
    NSString *photoPathStr = [dic valueForKey:@"photoPath"];
    NSArray *arrs = [photoPathStr componentsSeparatedByString:@"|"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:arrs];
    if ([arr.lastObject isEqualToString:@""]) {
        [arr removeLastObject];
    }
    self.teacherImageView.layer.cornerRadius = 20.5f;
    self.teacherImageView.layer.masksToBounds = YES;
    NSString *headerimageUrlString = [NSString stringWithFormat:@"%@%@", photoUrlString,[[dic valueForKey:@"editUser"] valueForKey:@"imgPath"]];
    [self.teacherImageView setImageWithURL:[NSURL URLWithString:headerimageUrlString] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    if (arr.count != 0) {
//        NSString *imageUrlString = [NSString stringWithFormat:@"%@%@", photoUrlString, [arr objectAtIndex:0]];
//        [self.wmImageView setImageWithURL:[NSURL URLWithString:imageUrlString]];
//        self.wmImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        CGFloat gudingHeight = (SCREEN_W - 75 - 20 - 30) / 3.0f;
        if (arr.count == 1) {
            self.wmImageHeightConstraint.constant = 150;
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
            NSString *imageUrlString = [NSString stringWithFormat:@"%@%@", photoUrlString, [arr objectAtIndex:0]];
            [imageView setImageWithURL:[NSURL URLWithString:imageUrlString]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.userInteractionEnabled = YES;
            imageView.tag = PERSONALPHOTOSIMAGEVIEWTAG;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTaped:)];
            [imageView addGestureRecognizer:tap];
            [self.wmImageView addSubview:imageView];
        }else if (arr.count <= 3) {
            self.wmImageHeightConstraint.constant = gudingHeight;
        }else if (arr.count <= 6){
            self.wmImageHeightConstraint.constant = (2 * gudingHeight + 10.0f);
        }else{
            self.wmImageHeightConstraint.constant = (3 * gudingHeight + 20.0f);
        }
        if (arr.count > 1) {
            CGFloat indexX = 0.0f;
            CGFloat WX = 10.0f,HY = 10.0f;
            CGFloat indexY = 0.0f;
            CGFloat indexH = gudingHeight;
            CGFloat indexW = gudingHeight;
            for (NSInteger i = 0; (i < arr.count && i < 9); i++) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(indexX, indexY, indexW, indexH)];
                NSString *imageUrlString = [NSString stringWithFormat:@"%@%@", photoUrlString, [arr objectAtIndex:i]];
                [imageView setImageWithURL:[NSURL URLWithString:imageUrlString]];
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                imageView.clipsToBounds = YES;
                imageView.userInteractionEnabled = YES;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTaped:)];
                [imageView addGestureRecognizer:tap];
                imageView.tag = PERSONALPHOTOSIMAGEVIEWTAG + i;
                [self.wmImageView addSubview:imageView];
                if (i + 1 < arr.count) {
                    indexX += indexW + WX;
                    if (indexX + indexW > (SCREEN_W - 75 - 30)) {
                        indexX = 0.0f;
                        indexY += indexH + HY;
                    }
                }
            }
        }
    }else{
        self.wmImageHeightConstraint.constant = 0.0f;
    }
    if ([[dic valueForKey:@"photoTitle"] isKindOfClass:[NSString class]]) {
        NSString *desString = [dic valueForKey:@"photoTitle"];
        NSMutableDictionary *attriDic = [NSMutableDictionary dictionary];
        [attriDic setValue:NSHTMLTextDocumentType forKey:NSDocumentTypeDocumentAttribute];
        [attriDic setValue:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
        NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[desString dataUsingEncoding:NSUnicodeStringEncoding] options: attriDic documentAttributes:nil error:nil];
        NSRange range= NSMakeRange(0, [attrStr length]);
        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range];
        
        CGSize textSize = [attrStr boundingRectWithSize:CGSizeMake(SCREEN_W - 75 - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
        self.descriptionLabel.text = [dic valueForKey:@"photoTitle"];
        self.describeLabelHeightCons.constant = textSize.height;
    }else{
        self.describeLabelHeightCons.constant = 0.0f;
    }
    if ([[dic valueForKey:@"editDate"] isKindOfClass:[NSString class]]) {
        NSString *editeDate = [dic valueForKey:@"editDate"];
        editeDate = [editeDate stringByReplacingOccurrencesOfString:@"T" withString:@" "];
        self.dayLabel.text = editeDate;
    }
}

-(void) imageTaped:(UITapGestureRecognizer *) tap
{
    UIImageView *imageView = (UIImageView *)tap.view;
    NSString *photoPathStr = [self.dic valueForKey:@"photoPath"];
    NSArray *arrs = [photoPathStr componentsSeparatedByString:@"|"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:arrs];
    if ([arr.lastObject isEqualToString:@""]) {
        [arr removeLastObject];
    }
    if (imageView.image) {
        [self.delegate didTapWonderfulMomentCellWithViewImage:imageView andNumberImage:arr.count];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
