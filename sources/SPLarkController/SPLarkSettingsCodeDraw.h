#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SPLarkSettingsResizingBehavior) {
    SPLarkSettingsResizeAspectFit,
    SPLarkSettingsResizeAspectFill,
    SPLarkSettingsResizeStretch,
    SPLarkSettingsResizeCenter
};

@interface SPLarkSettingsCodeDraw : NSObject

+ (void)drawCloseWithFrame:(CGRect)frame resizing:(SPLarkSettingsResizingBehavior)resizing color:(UIColor *)color;

@end
