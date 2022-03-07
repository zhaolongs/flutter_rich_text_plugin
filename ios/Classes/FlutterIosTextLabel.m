//
//  FlutterIosTextLabel.m
//  Runner
//
//  Created by  androidlongs on 2022/2/28.
//

//代码清单9-14 FlutterIosTextLabel.m
#import "FlutterIosTextLabel.h"
#import <WebKit/WebKit.h>
@interface FlutterIosTextLabel ()

@end

@implementation FlutterIosTextLabel{
    //FlutterIosTextLabel 创建后的标识
    int64_t _viewId;
    WKWebView * _wKWebView;
    //消息回调
    FlutterMethodChannel* _channel;
}

-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        if (frame.size.width==0) {
            frame=CGRectMake(frame.origin.x,
                             frame.origin.y,
                             [UIScreen mainScreen].bounds.size.width, 22);
        }
        NSString *htmlString = args[@"content"];
        _wKWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        [_wKWebView loadHTMLString:htmlString baseURL:nil];
        _viewId = viewId;
    
    }
    return self;
}

- (nonnull UIView *)view {
    return _wKWebView;
}

@end
