// ScreenshotInvisibleContainerProtocol.h

#import <UIKit/UIKit.h>

@protocol ScreenshotInvisibleContainerProtocol <NSObject>

- (void)eraseOldAndAddNewContent:(UIView *)newContent;
- (void)setupContainerAsHideContentInScreenshots;
- (void)setupContainerAsDisplayContentInScreenshots;

@end
