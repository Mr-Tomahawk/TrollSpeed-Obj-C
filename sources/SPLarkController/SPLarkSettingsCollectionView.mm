#import "SPLarkSettingsCollectionView.h"
#import "SPLarkSettingsCollectionViewCell.h"

@implementation SPLarkSettingsCollectionView

- (instancetype)init {
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    self.decelerationRate = UIScrollViewDecelerationRateFast;
    self.delaysContentTouches = NO;
    self.pagingEnabled = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    self.layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.layout.minimumLineSpacing = 9.5;
    self.layout.minimumInteritemSpacing = 9.5;
    self.contentInset = UIEdgeInsetsMake(0, self.sideInset, 0, self.sideInset);
    
    self.cellIdentificator = @"SPLarkSettingsCollectionViewCell";
    self.cellSize = CGSizeMake(156, 60);
    self.sideInset = 27;
    
    [self registerClass:[SPLarkSettingsCollectionViewCell class] forCellWithReuseIdentifier:self.cellIdentificator];
}

- (SPLarkSettingsCollectionViewCell *)dequeueCellForIndexPath:(NSIndexPath *)indexPath {
    return (SPLarkSettingsCollectionViewCell *)[self dequeueReusableCellWithReuseIdentifier:self.cellIdentificator forIndexPath:indexPath];
}

- (void)layoutWithY:(CGFloat)y {
    self.frame = CGRectMake(0, y, self.superview.bounds.size.width, self.cellSize.height * 2 + self.layout.minimumInteritemSpacing);
    self.layout.itemSize = self.cellSize;
}

@end
