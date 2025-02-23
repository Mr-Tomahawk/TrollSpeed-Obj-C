#import "SPLarkSettingsCollectionViewCell.h"

@implementation SPLarkSettingsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 13;

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = @"Title";
    [self addSubview:self.titleLabel];

    self.subtitleLabel = [[UILabel alloc] init];
    self.subtitleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
    self.subtitleLabel.numberOfLines = 1;
    self.subtitleLabel.textAlignment = NSTextAlignmentLeft;
    self.subtitleLabel.textColor = [UIColor whiteColor];
    self.subtitleLabel.text = @"Subtitle";
    [self addSubview:self.subtitleLabel];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    CGFloat scale = highlighted ? 0.92 : 1.0;
    
    [UIView animateWithDuration:0.27 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState) animations:^{
        self.transform = CGAffineTransformMakeScale(scale, scale);
    } completion:nil];
}

- (void)setHighlighted:(BOOL)state withColor:(UIColor *)color {
    self.backgroundColor = color;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.titleLabel.text = @"Title";
    self.subtitleLabel.text = @"Subtitle";
    [self layoutSubviews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.isHighlighted) {
        return;
    }
    
    if (self.subtitleLabel.text == nil) {
        CGFloat topInset = 19 / 2.0;
        CGFloat sideInset = 19 / 1.5;
        
        [self.titleLabel sizeToFit];
        self.titleLabel.frame = CGRectMake(sideInset, topInset, self.frame.size.width - sideInset * 2, self.frame.size.height - topInset * 2);
    } else {
        CGFloat topInset = 19 / 2.0;
        CGFloat sideInset = 19 / 1.5;
        
        [self.subtitleLabel sizeToFit];
        self.subtitleLabel.frame = CGRectMake(sideInset, self.frame.size.height - topInset * 1.2 - self.subtitleLabel.frame.size.height, self.frame.size.width - sideInset * 2, self.subtitleLabel.frame.size.height);
        
        [self.titleLabel sizeToFit];
        self.titleLabel.frame = CGRectMake(sideInset, topInset * 1.3, self.frame.size.width - sideInset * 2, self.subtitleLabel.frame.origin.y - topInset - topInset / 2);
    }
}

@end
