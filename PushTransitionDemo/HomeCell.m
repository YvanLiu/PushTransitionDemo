//
//  HomeCell.m
//  PushTransitionDemo
//
//  Created by sjimac01 on 2018/2/5.
//  Copyright © 2018年 sjimac01. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = COLOR_CLEAR;
        self.contentView.backgroundColor = COLOR_CLEAR;
        
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.bgimageView];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.contentLabel];
        
    }
    return self;
}

- (UIImageView *)bgimageView {
    if (_bgimageView == nil) {
        _bgimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-40, (SCREEN_WIDTH-40)*1.3)];
        _bgimageView.layer.cornerRadius = 15;
        _bgimageView.layer.masksToBounds = YES;
        
    }
    return _bgimageView;
}

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40, (SCREEN_WIDTH-40)*1.3+25)];
        
        _bgView.backgroundColor = COLOR_CLEAR;
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-30, 30)];
        _titleLabel.textColor = COLOR_WHITE;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = FONT_B(25);
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, (SCREEN_WIDTH-40)*1.3-30, SCREEN_WIDTH-44, 15)];
        _contentLabel.font = FONT_PF(15);
        _contentLabel.alpha = 0.5;
        _contentLabel.textColor = COLOR_WHITE;
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLabel;
}

@end
