//
//  FlutterIosTextLabel.h
//  Runner
//
//  Created by  androidlongs on 2022/2/28.
//

//代码清单9-13
#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

//实现协议FlutterPlatformView
@interface FlutterIosTextLabel :  NSObject<FlutterPlatformView>

-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId
                       arguments:(id _Nullable)args
                 binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end


NS_ASSUME_NONNULL_END
