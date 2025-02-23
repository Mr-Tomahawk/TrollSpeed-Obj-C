#import "SPLarkSettingsController.h"
#import "SPLarkSettingsCollectionView.h"
#import "SPLarkSettingsCloseButton.h"
#import "SPLarkSettingsCollectionViewCell.h"

@implementation SPLarkSettingsController

- (instancetype)init {
    self = [super init];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _closeButton = [[SPLarkSettingsCloseButton alloc] init];
        _collectionView = [[SPLarkSettingsCollectionView alloc] init];

        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel.text = NSLocalizedString(@"Settings", nil);
    self.titleLabel.font = [UIFont systemFontOfSize:23 weight:UIFontWeightBold];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.numberOfLines = 0;
    [self.view addSubview:self.titleLabel];

    [self.view addSubview:self.collectionView];

    [self.closeButton sizeToFit];
    [self.closeButton addTarget:self action:@selector(tapCloseButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(27, 40, self.view.frame.size.width - 27 * 2, self.titleLabel.frame.size.height);

    [self.collectionView layoutWithY:CGRectGetMaxY(self.titleLabel.frame) + 24];
    
    [self.closeButton layoutWithBottomX:self.view.frame.size.width - 19 y:CGRectGetMidY(self.titleLabel.frame) - self.closeButton.frame.size.height / 2 - 2];
}

- (NSInteger)settingsCount {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must be overridden in subclass" userInfo:nil];
}

- (NSString *)settingTitleAtIndex:(NSInteger)index highlighted:(BOOL)highlighted {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must be overridden in subclass" userInfo:nil];
}

- (nullable NSString *)settingSubtitleAtIndex:(NSInteger)index highlighted:(BOOL)highlighted {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must be overridden in subclass" userInfo:nil];
}

- (BOOL)settingHighlightedAtIndex:(NSInteger)index {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must be overridden in subclass" userInfo:nil];
}

- (UIColor *)settingColorHighlightedAtIndex:(NSInteger)index {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must be overridden in subclass" userInfo:nil];
}

- (void)settingDidSelectAtIndex:(NSInteger)index completion:(void(^)(void))completion {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must be overridden in subclass" userInfo:nil];
}

- (void)reloadItemAtIndex:(NSInteger)index {
    [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.collectionView) {
        return [self settingsCount];
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.collectionView) {
        NSLog(@"Warning: collectionView is nil at cellForItemAtIndexPath");
        return nil; 
    }

    SPLarkSettingsCollectionViewCell *cell = (SPLarkSettingsCollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:self.collectionView.cellIdentificator forIndexPath:indexPath];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        BOOL highlighted = [self settingHighlightedAtIndex:indexPath.row];
        cell.titleLabel.text = [self settingTitleAtIndex:indexPath.row highlighted:highlighted];
        cell.subtitleLabel.text = [self settingSubtitleAtIndex:indexPath.row highlighted:highlighted];
        [cell setHighlighted:highlighted withColor:(highlighted ? [self settingColorHighlightedAtIndex:indexPath.row] : [[UIColor whiteColor] colorWithAlphaComponent:0.1])];
    });

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SPLarkSettingsCollectionViewCell *cell = (SPLarkSettingsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    [self settingDidSelectAtIndex:indexPath.row completion:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            BOOL highlighted = [self settingHighlightedAtIndex:indexPath.row];
            cell.titleLabel.text = [self settingTitleAtIndex:indexPath.row highlighted:highlighted];
            cell.subtitleLabel.text = [self settingSubtitleAtIndex:indexPath.row highlighted:highlighted];
            [cell setHighlighted:highlighted withColor:(highlighted ? [self settingColorHighlightedAtIndex:indexPath.row] : [[UIColor whiteColor] colorWithAlphaComponent:0.1])];
        });
    }];
}

- (void)tapCloseButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
