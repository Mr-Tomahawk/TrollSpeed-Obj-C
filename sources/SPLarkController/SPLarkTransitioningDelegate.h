#import <UIKit/UIKit.h>

@interface SPLarkTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, assign) CGFloat customHeight;
@property (nonatomic, assign) BOOL swipeToDismissEnabled;
@property (nonatomic, assign) CGFloat translateForDismiss;

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                   presentingViewController:(UIViewController *)presenting
                                                     sourceViewController:(UIViewController *)source;

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                               presentingController:(UIViewController *)presenting
                                                                   sourceController:(UIViewController *)source;

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;

@end
