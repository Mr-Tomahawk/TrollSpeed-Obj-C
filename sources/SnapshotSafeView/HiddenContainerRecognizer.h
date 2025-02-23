#import <UIKit/UIKit.h>

@interface HiddenContainerRecognizer : NSObject

- (UIView *)getHiddenContainerFromView:(UIView *)view error:(NSError **)error;
- (NSString *)getHiddenContainerTypeInStringRepresentationWithError:(NSError **)error;
- (BOOL)viewIsAlreadyInHiddenContainer:(UIView *)view;

@end
