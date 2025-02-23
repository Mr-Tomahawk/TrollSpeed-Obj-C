#import "HiddenContainerRecognizer.h"

typedef NS_ENUM(NSInteger, HiddenContainerRecognizerError) {
    HiddenContainerRecognizerErrorUnsupportedVersion,
    HiddenContainerRecognizerErrorContainerNotFound
};

@implementation HiddenContainerRecognizer

- (UIView *)getHiddenContainerFromView:(UIView *)view error:(NSError **)error {
    NSString *containerName = [self getHiddenContainerTypeInStringRepresentationWithError:error];
    if (!containerName) {
        return nil;
    }

    for (UIView *subview in view.subviews) {
        if ([NSStringFromClass([subview class]) isEqualToString:containerName]) {
            return subview;
        }
    }

    if (error) {
        *error = [NSError errorWithDomain:@"HiddenContainerRecognizer"
                                     code:HiddenContainerRecognizerErrorContainerNotFound
                                 userInfo:@{NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Desired container '%@' was not found", containerName]}];
    }
    return nil;
}

- (NSString *)getHiddenContainerTypeInStringRepresentationWithError:(NSError **)error {
    if (@available(iOS 15.0, *)) {
        return @"_UITextLayoutCanvasView";
    } else if (@available(iOS 14.0, *)) {
        return @"_UITextFieldCanvasView";
    } else if (@available(iOS 12.0, *)) {
        return @"_UITextFieldContentView";
    } else {
        if (error) {
            CGFloat version = [UIDevice currentDevice].systemVersion.floatValue;
            *error = [NSError errorWithDomain:@"HiddenContainerRecognizer"
                                         code:HiddenContainerRecognizerErrorUnsupportedVersion
                                     userInfo:@{NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Unsupported iOS version: %.1f", version]}];
        }
        return nil;
    }
}

- (BOOL)viewIsAlreadyInHiddenContainer:(UIView *)view {
    NSError *error = nil;
    NSString *containerClassName = [self getHiddenContainerTypeInStringRepresentationWithError:&error];
    if (!containerClassName) {
        return NO;
    }

    UIView *superView = view.superview;
    if (!superView) {
        return NO;
    }

    return [NSStringFromClass([superView class]) isEqualToString:containerClassName];
}

@end
