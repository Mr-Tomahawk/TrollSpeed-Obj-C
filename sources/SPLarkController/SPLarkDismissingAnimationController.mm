#import "SPLarkDismissingAnimationController.h"

@implementation SPLarkDismissingAnimationController : NSObject 

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    CGRect initialFrame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect finalFrame = CGRectOffset(initialFrame, 0, initialFrame.size.height);

    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
        fromViewController.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
