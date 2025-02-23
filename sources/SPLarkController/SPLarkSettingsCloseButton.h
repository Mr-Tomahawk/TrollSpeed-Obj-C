#import <UIKit/UIKit.h>

@class SPLarkSettingsCloseIconButton;

@interface SPLarkSettingsCloseButton : UIButton

@property (nonatomic, strong) UIColor *color;

- (instancetype)init;
- (void)layoutWithBottomX:(CGFloat)bottomX y:(CGFloat)y;

@end
