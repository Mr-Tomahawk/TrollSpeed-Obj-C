// TSSettingsController.m

#import "TSSettingsController.h"
#import "TSSettingsIndexHelper.h" // Assuming there's a helper for TSSettingsIndex

@interface TSSettingsController ()
@property (nonatomic, assign) BOOL restartRequired; // Private variable
@end

@implementation TSSettingsController

- (NSInteger)settingsCount {
    return [TSSettingsIndexHelper settingsCount];
}

- (NSString *)settingTitleAtIndex:(NSInteger)index highlighted:(BOOL)highlighted {
    return [TSSettingsIndexHelper titleAtIndex:index];
}

- (NSString *)settingSubtitleAtIndex:(NSInteger)index highlighted:(BOOL)highlighted {
    return [TSSettingsIndexHelper subtitleAtIndex:index highlighted:highlighted restartRequired:self.restartRequired];
}

- (NSString *)settingKeyAtIndex:(NSInteger)index {
    return [TSSettingsIndexHelper keyAtIndex:index];
}

- (BOOL)settingHighlightedAtIndex:(NSInteger)index {
    NSString *key = [self settingKeyAtIndex:index];
    return [self.delegate settingHighlightedForKey:key];
}

- (UIColor *)settingColorHighlightedAtIndex:(NSInteger)index {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor colorWithRed:28/255.0 green:74/255.0 blue:82/255.0 alpha:1.0];
        } else {
            return [UIColor colorWithRed:22/255.0 green:160/255.0 blue:133/255.0 alpha:1.0];
        }
    }];
}

- (void)settingDidSelectAtIndex:(NSInteger)index completion:(void (^)(void))completion {
    if (index == 0 && self.alreadyLaunched) {
        self.restartRequired = YES;
    }
    NSString *key = [self settingKeyAtIndex:index];
    [self.delegate settingDidSelectForKey:key];
    completion();
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    UIInterfaceOrientation currentOrientation = self.view.window.windowScene.interfaceOrientation;
    switch (currentOrientation) {
        case UIInterfaceOrientationUnknown: return UIInterfaceOrientationMaskPortrait;
        case UIInterfaceOrientationPortrait: return UIInterfaceOrientationMaskPortrait;
        case UIInterfaceOrientationPortraitUpsideDown: return UIInterfaceOrientationMaskPortraitUpsideDown;
        case UIInterfaceOrientationLandscapeLeft: return UIInterfaceOrientationMaskLandscapeLeft;
        case UIInterfaceOrientationLandscapeRight: return UIInterfaceOrientationMaskLandscapeRight;
        default: return UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (previousTraitCollection.userInterfaceStyle != self.traitCollection.userInterfaceStyle) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
