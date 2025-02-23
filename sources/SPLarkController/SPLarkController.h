#import <UIKit/UIKit.h>

@class SPLarkPresentationController;

@interface SPLarkController : NSObject

+ (void)updatePresentingController:(UIViewController *)controller animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

@end

@interface UIViewController (SPLarkController)

@property (nonatomic, readonly) BOOL isPresentedAsLark;

- (void)presentAsLark:(UIViewController *)controller height:(CGFloat)height completion:(void (^)(void))completion;
- (void)presentLarkSettingsController:(SPLarkPresentationController *)controller;

@end
