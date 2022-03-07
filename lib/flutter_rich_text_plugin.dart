

export 'src/nav_rich_text_view.dart';

import 'dart:async';

import 'package:flutter/services.dart';

class FlutterRichTextPlugin {
  static const MethodChannel _channel = MethodChannel('flutter_rich_text_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static sendMessage(){
    _channel.invokeMethod("load",null);
  }
}
