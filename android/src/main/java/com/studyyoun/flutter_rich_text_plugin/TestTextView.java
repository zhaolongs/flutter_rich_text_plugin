package com.studyyoun.flutter_rich_text_plugin;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Message;
import android.text.Html;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.RequiresApi;

import java.net.URL;
import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

//代码清单9-10
//com/example/flutter_native_message_app/TestTextView.java
/// 创建 Android 原生自定义View
public class TestTextView implements PlatformView {

    ///这里使用的是一个 TextView
    private final TextView mTestTextView;
    private Context mContext;

    TestTextView(Context context, int id, Map<String, Object> params) {
        mContext = context;
        //创建 TextView
        TextView lTextView = new TextView(context);
        //设置文字
        lTextView.setText("");
        this.mTestTextView = lTextView;
        //flutter 传递过来的参数
        if (params!=null&&params.containsKey("content")) {
            String myContent = (String) params.get("content");
            //设置文本显示
            lTextView.setText(Html.fromHtml(myContent));
        }
    }
    @Override
    public View getView() {
        return mTestTextView;
    }

    @Override
    public void dispose() {}
}
