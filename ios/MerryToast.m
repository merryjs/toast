
#import "MerryToast.h"

@implementation MerryToast {
  CGFloat _keyOffset;
}
RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}
- (instancetype)init {
  if (self = [super init]) {
    _keyOffset = 0;
    [[NSNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(keyboardWasShown:)
               name:UIKeyboardDidShowNotification
             object:nil];
    [[NSNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(keyboardWillHiden:)
               name:UIKeyboardWillHideNotification
             object:nil];
  }
  return self;
}

- (void)keyboardWasShown:(NSNotification *)notification {

  CGSize keyboardSize =
      [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey]
          CGRectValue]
          .size;

  int height = MIN(keyboardSize.height, keyboardSize.width);
  int width = MAX(keyboardSize.height, keyboardSize.width);

  _keyOffset = height;
}

- (void)keyboardWillHiden:(NSNotification *)notification {
  _keyOffset = 0;
}

- (NSDictionary *)constantsToExport {
  return @{
    @"SHORT" : [NSNumber numberWithDouble:MerryToastShortDuration],
    @"LONG" : [NSNumber numberWithDouble:MerryToastLongDuration],
    @"BOTTOM" : [NSNumber numberWithInteger:MerryToastGravityBottom],
    @"CENTER" : [NSNumber numberWithInteger:MerryToastGravityCenter],
    @"TOP" : [NSNumber numberWithInteger:MerryToastGravityTop]
  };
}
//
// RCT_EXPORT_METHOD(show:(NSString *)msg duration:(double)duration {
//    [self _show:msg duration:duration gravity:MerryToastGravityBottom];
//});
//
// RCT_EXPORT_METHOD(showWithGravity:(NSString *)msg duration:(double)duration
// gravity:(nonnull NSNumber *)gravity{
//    [self _show:msg duration:duration gravity:gravity.intValue];
//});
//- (UIViewController *)visibleViewController:(UIViewController
//*)rootViewController
//{
//    if (rootViewController.presentedViewController == nil)
//    {
//        return rootViewController;
//    }
//    if ([rootViewController.presentedViewController
//    isKindOfClass:[UINavigationController class]])
//    {
//        UINavigationController *navigationController = (UINavigationController
//        *)rootViewController.presentedViewController; UIViewController
//        *lastViewController = [[navigationController viewControllers]
//        lastObject];
//
//        return [self visibleViewController:lastViewController];
//    }
//    if ([rootViewController.presentedViewController
//    isKindOfClass:[UITabBarController class]])
//    {
//        UITabBarController *tabBarController = (UITabBarController
//        *)rootViewController.presentedViewController; UIViewController
//        *selectedViewController = tabBarController.selectedViewController;
//
//        return [self visibleViewController:selectedViewController];
//    }
//
//    UIViewController *presentedViewController = (UIViewController
//    *)rootViewController.presentedViewController;
//
//    return [self visibleViewController:presentedViewController];
//}
//
//- (void)_show:(NSString *)msg duration:(NSTimeInterval)duration
//gravity:(NSInteger)gravity {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        //UIView *root = [[[[[UIApplication sharedApplication] delegate]
//        window] rootViewController] view]; UIViewController *ctrl = [self
//        visibleViewController:[UIApplication
//        sharedApplication].keyWindow.rootViewController]; UIView *root = [ctrl
//        view]; CGRect bound = root.bounds; bound.size.height -= _keyOffset; if
//        (bound.size.height > MerryToastBottomOffset*2) {
//            bound.origin.y += MerryToastBottomOffset;
//            bound.size.height -= MerryToastBottomOffset*2;
//        }
//        UIView *view = [[UIView alloc] initWithFrame:bound];
//        view.userInteractionEnabled = NO;
//        [root addSubview:view];
//        UIView __weak *blockView = view;
//        id position;
//        if (gravity == MerryToastGravityTop) {
//            position = CSToastPositionTop;
//        } else if (gravity == MerryToastGravityCenter) {
//            position = CSToastPositionCenter;
//        } else {
//            position = CSToastPositionBottom;
//        }
//        [view makeToast:msg
//               duration:duration
//               position:position
//                  title:nil
//                  image:nil
//                  style:nil
//             completion:^(BOOL didTap) {
//                 [blockView removeFromSuperview];
//             }];
//    });
//}
@end
