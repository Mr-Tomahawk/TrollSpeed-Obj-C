#import "SPLarkPresentingAnimationController.h"

@implementation SPLarkPresentingAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.45;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    toView.frame = finalFrame;
   
    for (UIView *subview in fromViewController.view.subviews) {
        subview.alpha = 0;
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        // Add any custom animation code here
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
