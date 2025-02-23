#import "SPLarkController.h"
#import "SPLarkTransitioningDelegate.h"
#import "SPLarkPresentationController.h"

@implementation SPLarkController

+ (void)updatePresentingController:(UIViewController *)controller animated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    if ([controller.presentedViewController.presentationController isKindOfClass:[SPLarkPresentationController class]]) {
        SPLarkPresentationController *presentationController = (SPLarkPresentationController *)controller.presentedViewController.presentationController;
        [presentationController updatePresentingControllerAnimated:animated completion:completion];
    }
}

@end

@implementation UIViewController (SPLarkController)

- (BOOL)isPresentedAsLark {
    return [self.transitioningDelegate isKindOfClass:[SPLarkTransitioningDelegate class]] && self.modalPresentationStyle == UIModalPresentationCustom && self.presentingViewController != nil;
}

- (void)presentAsLark:(UIViewController *)controller height:(CGFloat)height completion:(void (^)(void))completion {
    if (self.isPresentedAsLark) return;
    SPLarkTransitioningDelegate *transitionDelegate = [[SPLarkTransitioningDelegate alloc] init];
    transitionDelegate.customHeight = height;

    controller.transitioningDelegate = transitionDelegate;
    controller.modalPresentationCapturesStatusBarAppearance = YES;
    controller.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:controller animated:YES completion:completion];
}

- (void)presentLarkSettingsController:(UIViewController *)controller {
    if (self.isPresentedAsLark) return;

    SPLarkTransitioningDelegate *transitionDelegate = [[SPLarkTransitioningDelegate alloc] init];
    CGFloat safeAreaBottom = 0.0;

    if (@available(iOS 11.0, *)) {
        UIWindow *window = nil;

        if (@available(iOS 15.0, *)) {
            for (UIWindowScene *scene in UIApplication.sharedApplication.connectedScenes) {
                if (scene.activationState == UISceneActivationStateForegroundActive) {
                    window = scene.windows.firstObject;
                    break;
                }
            }
      
        }

        safeAreaBottom = window.safeAreaInsets.bottom;
    }

    transitionDelegate.customHeight = 250 + safeAreaBottom;
    controller.transitioningDelegate = transitionDelegate;
    controller.modalPresentationCapturesStatusBarAppearance = YES;
    controller.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
