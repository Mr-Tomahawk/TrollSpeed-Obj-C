#import "SPLarkSettingsCloseButton.h"
#import "SPLarkSettingsCloseIconButton.h"

@implementation SPLarkSettingsCloseButton {
    SPLarkSettingsCloseIconButton *_iconView;
}

- (instancetype)init {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _iconView = [[SPLarkSettingsCloseIconButton alloc] init];
        _iconView.userInteractionEnabled = NO;
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.15];
        self.color = [UIColor lightGrayColor];
        [self addSubview:_iconView];
    }
    return self;
}

- (void)setColor:(UIColor *)color {
    _color = color;
    _iconView.color = color;
}

- (BOOL)isHighlighted {
    return super.isHighlighted;
}

- (void)setHighlighted:(BOOL)highlighted {
    super.highlighted = highlighted;
    _iconView.color = highlighted ? [self.color colorWithAlphaComponent:0.7] : [self.color colorWithAlphaComponent:1];
}

- (void)layoutWithBottomX:(CGFloat)bottomX y:(CGFloat)y {
    [self sizeToFit];
    CGRect frame = self.frame;
    frame.origin.x = bottomX - frame.size.width;
    frame.origin.y = y;
    self.frame = frame;
    [self layoutSubviews];
}

- (void)sizeToFit {
    [super sizeToFit];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 30, 30);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.frame.size.width / 2;
    _iconView.frame = CGRectMake(0, 0, self.frame.size.width * 0.36, self.frame.size.height * 0.36);
    _iconView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
}

@end
