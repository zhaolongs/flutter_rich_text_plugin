import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

//代码清单9-21 加载富文本组件
class NaviteRichWidget extends StatelessWidget {
  final String htmlText;

  NaviteRichWidget({Key? key, required this.htmlText}) : super(key: key);
  ///通信加载View通道
  String viewType = 'com.flutter_to_native_test_textview';

  ///内容构建
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? buildAndroidView() : buildUIKitView();
  }
  //代码清单9-21-Android中通过 PlatformViewLink 来加载
  buildAndroidView() {
    //参数
    Map<String, dynamic> creationParams = <String, dynamic>{};
    creationParams["content"] = htmlText;

    return PlatformViewLink(
      viewType: viewType,
      surfaceFactory:
          (BuildContext context, PlatformViewController controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: params.id,
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          onFocus: () {
            params.onFocusChanged(true);
          },
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }

  //代码清单9-21-2 iOS 通过 UiKitView 来加载 iOS原生View
  buildUIKitView() {
    return UiKitView(
      //标识
      viewType: viewType,
      creationParams: {
        "content": htmlText,
      },
      //参数的编码方式
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
