#import "SPLarkTransitioningDelegate.h"
#import "RootViewController.h"

@interface RootViewController ()
@property (strong, nonatomic) SPLarkTransitioningDelegate *transitioningDelegate;
@end

#import "SPLarkPresentationController.h"
#import "SPLarkPresentingAnimationController.h"
#import "SPLarkDismissingAnimationController.h"

@implementation SPLarkTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                   presentingViewController:(UIViewController *)presenting
                                                     sourceViewController:(UIViewController *)source {
    SPLarkPresentationController *controller = [[SPLarkPresentationController alloc] initWithPresentedViewController:presented
                                                                                                presentingViewController:presenting];
    // Removed: controller.transitioningDelegate = self;
    
    controller.swipeToDismissEnabled = self.swipeToDismissEnabled;
    controller.translateForDismiss = self.translateForDismiss;
    controller.customHeight = self.customHeight > 0 ? self.customHeight : 0;
    return controller;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                               presentingController:(UIViewController *)presenting
                                                                   sourceController:(UIViewController *)source {
    return [[SPLarkPresentingAnimationController alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[SPLarkDismissingAnimationController alloc] init];
}

@end
