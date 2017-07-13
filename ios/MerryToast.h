
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <UIKit/UIKit.h>
#import <Toast/UIView+Toast.h>

NSInteger const LRDRCTSimpleToastBottomOffset = 40;
double const LRDRCTSimpleToastShortDuration = 3.0;
double const LRDRCTSimpleToastLongDuration = 5.0;
NSInteger const LRDRCTSimpleToastGravityBottom = 1;
NSInteger const LRDRCTSimpleToastGravityCenter = 2;
NSInteger const LRDRCTSimpleToastGravityTop = 3;

@interface MerryToast : NSObject <RCTBridgeModule>

@end
