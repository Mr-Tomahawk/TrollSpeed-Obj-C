#import <UIKit/UIKit.h>

@class SPLarkSettingsCollectionViewCell;

@interface SPLarkSettingsCollectionView : UICollectionView

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, copy) NSString *cellIdentificator;
@property (nonatomic) CGSize cellSize;
@property (nonatomic) CGFloat sideInset;

// Initializers
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;

// Methods
- (SPLarkSettingsCollectionViewCell *)dequeueCellForIndexPath:(NSIndexPath *)indexPath;
- (void)layoutWithY:(CGFloat)y;

@end
