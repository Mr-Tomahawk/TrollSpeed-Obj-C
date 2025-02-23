#import <UIKit/UIKit.h>
#import "SPLarkController/SPLarkSettingsController.h"

@protocol TSSettingsControllerDelegate <NSObject>
@optional
- (BOOL)settingHighlightedForKey:(NSString *)key;
- (void)settingDidSelectForKey:(NSString *)key;
@end

@interface TSSettingsController : SPLarkSettingsController

@property (nonatomic, weak) id<TSSettingsControllerDelegate> delegate;
@property (nonatomic, assign) BOOL alreadyLaunched;

@end
