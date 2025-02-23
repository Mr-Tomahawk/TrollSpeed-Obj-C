#import <Foundation/Foundation.h>
#import "TSSettingsIndex.h"

@interface TSSettingsIndexHelper : NSObject

+ (NSInteger)settingsCount;
+ (NSString *)titleAtIndex:(NSInteger)index;
+ (NSString *)subtitleAtIndex:(NSInteger)index highlighted:(BOOL)highlighted restartRequired:(BOOL)restartRequired;
+ (NSString *)keyAtIndex:(NSInteger)index;

@end
