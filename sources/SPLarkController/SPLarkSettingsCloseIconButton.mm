#import "SPLarkSettingsCloseIconButton.h"
#import "SPLarkSettingsCodeDraw.h"

@implementation SPLarkSettingsCloseIconButton

- (instancetype)init {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.color = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setColor:(UIColor *)color {
    _color = color;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [SPLarkSettingsCodeDraw drawCloseWithFrame:rect resizing:SPLarkSettingsResizeAspectFit color:self.color];
}

@end
