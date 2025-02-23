#import <UIKit/UIKit.h>

@interface SPLarkPresentationController : UIPresentationController

@property (nonatomic, assign) BOOL swipeToDismissEnabled;
@property (nonatomic, assign) CGFloat translateForDismiss;
@property (nonatomic, assign) CGFloat customHeight;

- (void)updateHeight:(CGFloat)newHeight;
- (void)updatePresentingControllerAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion; // Added method declaration

@end
