#import <UIKit/UIKit.h>

@class SPLarkSettingsCollectionView;
@class SPLarkSettingsCloseButton;

NS_ASSUME_NONNULL_BEGIN

@interface SPLarkSettingsController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) SPLarkSettingsCloseButton *closeButton;
@property (strong, nonatomic) SPLarkSettingsCollectionView *collectionView;

- (NSInteger)settingsCount;
- (NSString *)settingTitleAtIndex:(NSInteger)index highlighted:(BOOL)highlighted;
- (nullable NSString *)settingSubtitleAtIndex:(NSInteger)index highlighted:(BOOL)highlighted;
- (BOOL)settingHighlightedAtIndex:(NSInteger)index;
- (UIColor *)settingColorHighlightedAtIndex:(NSInteger)index;
- (void)settingDidSelectAtIndex:(NSInteger)index completion:(void(^)(void))completion;
- (void)reloadItemAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
