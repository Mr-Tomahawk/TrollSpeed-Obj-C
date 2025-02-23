#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SPLarkSettingsController; // Forward declaration

@interface UIViewController (SPLarkControllerExtension)

- (BOOL)sp_isPresentedAsLark;
- (void)sp_presentAsLark:(UIViewController *)controller height:(CGFloat)height completion:(void (^ _Nullable)(void))completion;
- (void)sp_presentLarkSettings:(SPLarkSettingsController *)controller;

@end

NS_ASSUME_NONNULL_END
