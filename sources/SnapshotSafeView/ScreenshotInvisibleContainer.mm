// ScreenshotInvisibleContainer.mm

#import "ScreenshotInvisibleContainer.h"
#import "HiddenContainerRecognizer.h" 

@implementation ScreenshotInvisibleContainer {
    HiddenContainerRecognizer *_hiddenContainerRecognizer;
}

- (instancetype)initWithContent:(UIView *)content {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _content = content;
        _hiddenContainerRecognizer = [[HiddenContainerRecognizer alloc] init];
        [self setupInitialState];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _content = [[UIView alloc] init];
        _hiddenContainerRecognizer = [[HiddenContainerRecognizer alloc] init];
        [self setupInitialState];
    }
    return self;
}

- (UIView *)hiddenContainer {
    NSError *error = nil;
    UIView *container = [_hiddenContainerRecognizer getHiddenContainerFromView:self error:&error];
    return container;
}

- (BOOL)canBecomeFocused {
    return NO;
}

- (BOOL)canBecomeFirstResponder {
    return NO;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return [self.hiddenContainer hitTest:point withEvent:event];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.userInteractionEnabled = self.content.userInteractionEnabled;
}

- (void)eraseOldAndAddNewContent:(UIView *)newContent {
    [self.content removeFromSuperview];
    _content = newContent;
    [self appendContentToView:self.hiddenContainer];
}

- (void)setupContainerAsHideContentInScreenshots {
    self.secureTextEntry = YES;
}

- (void)setupContainerAsDisplayContentInScreenshots {
    self.secureTextEntry = NO;
}

#pragma mark - Private methods

- (void)setupInitialState {
    [self appendContentToView:self.hiddenContainer];
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = self.content.userInteractionEnabled;
}

- (void)activateLayoutConstraintsOfContentToView:(UIView *)view {
    self.content.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.content.topAnchor constraintEqualToAnchor:view.topAnchor],
        [self.content.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
        [self.content.leftAnchor constraintEqualToAnchor:view.leftAnchor],
        [self.content.rightAnchor constraintEqualToAnchor:view.rightAnchor]
    ]];
}

- (void)appendContentToView:(UIView *)view {
    if (!view) return;

    [view addSubview:self.content];
    view.userInteractionEnabled = YES;
    [self activateLayoutConstraintsOfContentToView:view];
}

@end
