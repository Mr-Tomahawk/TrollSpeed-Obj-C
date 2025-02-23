#import "SPLarkPresentationController.h"

@implementation SPLarkPresentationController {
    CGFloat currentHeight;
}

- (void)updateHeight:(CGFloat)newHeight {
    currentHeight = newHeight;

    CGRect frame = self.presentedView.frame;
    frame.size.height = newHeight;
    frame.origin.y = self.containerView.bounds.size.height - newHeight;

    [UIView animateWithDuration:0.3 animations:^{
        self.presentedView.frame = frame;
    }];
}

- (void)updatePresentingControllerAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    CGRect frame = self.presentedView.frame;
    frame.size.height = currentHeight;
    frame.origin.y = self.containerView.bounds.size.height - currentHeight;

    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.presentedView.frame = frame;
        } completion:completion];
    } else {
        self.presentedView.frame = frame;
        if (completion) {
            completion(YES);
        }
    }
}

- (CGRect)frameOfPresentedViewInContainerView {
    CGRect containerBounds = self.containerView.bounds;
    return CGRectMake(0, containerBounds.size.height - currentHeight, containerBounds.size.width, currentHeight);
}

- (void)presentationTransitionWillBegin {
    currentHeight = 250; // Default height if not set
    self.presentedView.frame = [self frameOfPresentedViewInContainerView];
}

@end
