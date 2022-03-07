package com.studyyoun.flutter_rich_text_plugin;

import android.content.Context;

import java.util.Map;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugin.platform.PlatformViewRegistry;


public class TestViewFactory extends PlatformViewFactory {


    public TestViewFactory() {
        super(StandardMessageCodec.INSTANCE);
    }

    //args是由Flutter传过来的自定义参数
    @Override
    public PlatformView create(Context context, int id, Object args) {
        //flutter 传递过来的参数
        Map<String, Object> params = (Map<String, Object>) args;
        //创建 自定义的TestTextView
        return new TestTextView(context, id, params);

    }

    ///需要在MainActivity的onCreate方法中调用
    public static void registerWith(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        //通过 platformViewsController 来获取 Registry
        PlatformViewRegistry registry = flutterPluginBinding.getPlatformViewRegistry();
        //通过工厂类 PlatformViewRegistry 注册Android原生View
        //参数一就是 设置标识
        //参数二就是 自定义的Android原生View
        registry.registerViewFactory(
                "com.flutter_to_native_test_textview",
                new TestViewFactory());
    }
}
