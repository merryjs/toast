
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import "Toast/UIView+Toast.h"
#import <UIKit/UIKit.h>

NSInteger const MerryToastBottomOffset = 40;
double const MerryToastShortDuration = 3.0;
double const MerryToastLongDuration = 5.0;
NSInteger const MerryToastGravityBottom = 1;
NSInteger const MerryToastGravityCenter = 2;
NSInteger const MerryToastGravityTop = 3;

@interface MerryToast : NSObject <RCTBridgeModule>

@end
