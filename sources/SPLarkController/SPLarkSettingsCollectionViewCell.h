#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPLarkSettingsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subtitleLabel;

- (void)setHighlighted:(BOOL)state withColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
