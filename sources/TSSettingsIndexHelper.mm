#import "TSSettingsIndexHelper.h"

@implementation TSSettingsIndexHelper

+ (NSInteger)settingsCount {
    return [TSSettingsIndex allSettingsIndexes].count;
}

+ (NSString *)titleAtIndex:(NSInteger)index {
    return [TSSettingsIndex titleForIndex:(TSSettingsIndexType)index];
}

+ (NSString *)subtitleAtIndex:(NSInteger)index highlighted:(BOOL)highlighted restartRequired:(BOOL)restartRequired {
    return [TSSettingsIndex subtitleForIndex:(TSSettingsIndexType)index highlighted:highlighted restartRequired:restartRequired];
}

+ (NSString *)keyAtIndex:(NSInteger)index {
    return [TSSettingsIndex keyForIndex:(TSSettingsIndexType)index];
}

@end
