// ScreenshotInvisibleContainer.h

#import <UIKit/UIKit.h>
#import "HiddenContainerRecognizer.h"
#import "ScreenshotInvisibleContainerProtocol.h"

@interface ScreenshotInvisibleContainer : UITextField <ScreenshotInvisibleContainerProtocol> // Changed from UIView to UITextField

@property (nonatomic, strong, readonly) UIView *content;
@property (nonatomic, readonly) UIView *hiddenContainer; // Added missing property

- (instancetype)initWithContent:(UIView *)content;
- (void)setupContainerAsHideContentInScreenshots;
- (void)setupContainerAsDisplayContentInScreenshots;

@end
