#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TSSettingsIndexType) {
    TSSettingsIndexTypePassthroughMode = 0,
    TSSettingsIndexTypeKeepInPlace,
    TSSettingsIndexTypeHideAtSnapshot,
    TSSettingsIndexTypeSingleLineMode,
    TSSettingsIndexTypeUsesInvertedColor,
    TSSettingsIndexTypeUsesRotation,
    TSSettingsIndexTypeUsesLargeFont,
    TSSettingsIndexTypeUsesArrowPrefixes,
    TSSettingsIndexTypeUsesBitrate
};

@interface TSSettingsIndex : NSObject

+ (NSString *)keyForIndex:(TSSettingsIndexType)index;
+ (NSString *)titleForIndex:(TSSettingsIndexType)index;
+ (NSString *)subtitleForIndex:(TSSettingsIndexType)index highlighted:(BOOL)highlighted restartRequired:(BOOL)restartRequired;
+ (NSArray<NSNumber *> *)allSettingsIndexes;

@end
