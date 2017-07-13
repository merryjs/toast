
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <UIKit/UIKit.h>
#import <Toast/UIView+Toast.h>

@interface MerryToast : NSObject <RCTBridgeModule>

@end
