#import "FlutterRichTextPlugin.h"
#import "FlutterIosTextLabelFactory.h"
@implementation FlutterRichTextPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_rich_text_plugin"
            binaryMessenger:[registrar messenger]];
  FlutterRichTextPlugin* instance = [[FlutterRichTextPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];

    FlutterIosTextLabelFactory* factory =
          [[FlutterIosTextLabelFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:factory
                            withId:@"com.flutter_to_native_test_textview"];

}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
