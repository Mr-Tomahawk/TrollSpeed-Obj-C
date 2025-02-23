#import "TSSettingsIndex.h"

extern NSString *const HUDUserDefaultsKeyPassthroughMode;
extern NSString *const HUDUserDefaultsKeyKeepInPlace;
extern NSString *const HUDUserDefaultsKeyHideAtSnapshot;
extern NSString *const HUDUserDefaultsKeySingleLineMode;
extern NSString *const HUDUserDefaultsKeyUsesInvertedColor;
extern NSString *const HUDUserDefaultsKeyUsesRotation;
extern NSString *const HUDUserDefaultsKeyUsesLargeFont;
extern NSString *const HUDUserDefaultsKeyUsesArrowPrefixes;
extern NSString *const HUDUserDefaultsKeyUsesBitrate;

@implementation TSSettingsIndex

+ (NSString *)keyForIndex:(TSSettingsIndexType)index {
    switch (index) {
        case TSSettingsIndexTypePassthroughMode:
            return HUDUserDefaultsKeyPassthroughMode;
        case TSSettingsIndexTypeKeepInPlace:
            return HUDUserDefaultsKeyKeepInPlace;
        case TSSettingsIndexTypeHideAtSnapshot:
            return HUDUserDefaultsKeyHideAtSnapshot;
        case TSSettingsIndexTypeSingleLineMode:
            return HUDUserDefaultsKeySingleLineMode;
        case TSSettingsIndexTypeUsesInvertedColor:
            return HUDUserDefaultsKeyUsesInvertedColor;
        case TSSettingsIndexTypeUsesRotation:
            return HUDUserDefaultsKeyUsesRotation;
        case TSSettingsIndexTypeUsesLargeFont:
            return HUDUserDefaultsKeyUsesLargeFont;
        case TSSettingsIndexTypeUsesArrowPrefixes:
            return HUDUserDefaultsKeyUsesArrowPrefixes;
        case TSSettingsIndexTypeUsesBitrate:
            return HUDUserDefaultsKeyUsesBitrate;
        default:
            return nil;
    }
}

+ (NSString *)titleForIndex:(TSSettingsIndexType)index {
    switch (index) {
        case TSSettingsIndexTypePassthroughMode:
            return NSLocalizedString(@"Pass-through", @"TSSettingsIndex");
        case TSSettingsIndexTypeKeepInPlace:
            return NSLocalizedString(@"Keep In-place", @"TSSettingsIndex");
        case TSSettingsIndexTypeHideAtSnapshot:
            return NSLocalizedString(@"Hide @snapshot", @"TSSettingsIndex");
        case TSSettingsIndexTypeSingleLineMode:
            return NSLocalizedString(@"Incoming Only", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesInvertedColor:
            return NSLocalizedString(@"Appearance", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesRotation:
            return NSLocalizedString(@"Landscape", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesLargeFont:
            return NSLocalizedString(@"Size", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesArrowPrefixes:
            return NSLocalizedString(@"Prefixes", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesBitrate:
            return NSLocalizedString(@"Unit", @"TSSettingsIndex");
        default:
            return @"";
    }
}

+ (NSString *)subtitleForIndex:(TSSettingsIndexType)index highlighted:(BOOL)highlighted restartRequired:(BOOL)restartRequired {
    switch (index) {
        case TSSettingsIndexTypePassthroughMode:
            if (restartRequired) {
                return NSLocalizedString(@"Re-open to apply", @"TSSettingsIndex");
            } else {
                return highlighted ? NSLocalizedString(@"ON", @"TSSettingsIndex") : NSLocalizedString(@"OFF", @"TSSettingsIndex");
            }
        case TSSettingsIndexTypeKeepInPlace: // fall through
        case TSSettingsIndexTypeHideAtSnapshot: // fall through
        case TSSettingsIndexTypeSingleLineMode:
            return highlighted ? NSLocalizedString(@"ON", @"TSSettingsIndex") : NSLocalizedString(@"OFF", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesInvertedColor:
            return highlighted ? NSLocalizedString(@"Inverted", @"TSSettingsIndex") : NSLocalizedString(@"Classic", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesRotation:
            return highlighted ? NSLocalizedString(@"Follow", @"TSSettingsIndex") : NSLocalizedString(@"Hide", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesLargeFont:
            return highlighted ? NSLocalizedString(@"Large", @"TSSettingsIndex") : NSLocalizedString(@"Standard", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesArrowPrefixes:
            return highlighted ? NSLocalizedString(@"↑↓", @"TSSettingsIndex") : NSLocalizedString(@"▲▼", @"TSSettingsIndex");
        case TSSettingsIndexTypeUsesBitrate:
            return highlighted ? NSLocalizedString(@"b/s", @"TSSettingsIndex") : NSLocalizedString(@"B/s", @"TSSettingsIndex");
        default:
            return @"";
    }
}

+ (NSArray<NSNumber *> *)allSettingsIndexes {
    return @[
        @(TSSettingsIndexTypePassthroughMode),
        @(TSSettingsIndexTypeKeepInPlace),
        @(TSSettingsIndexTypeHideAtSnapshot),
        @(TSSettingsIndexTypeSingleLineMode),
        @(TSSettingsIndexTypeUsesInvertedColor),
        @(TSSettingsIndexTypeUsesRotation),
        @(TSSettingsIndexTypeUsesLargeFont),
        @(TSSettingsIndexTypeUsesArrowPrefixes),
        @(TSSettingsIndexTypeUsesBitrate)
    ];
}

@end
