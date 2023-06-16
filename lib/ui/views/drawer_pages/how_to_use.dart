import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowToUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("কিভাবে ব্যাবহার করব"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          "কিভাবে অ্যাপটি ব্যাবহার করতে হবে তার জন্য একটা ভিডিও বানানো হচ্ছে...।খুব তাড়াতাড়ি  আপডেট করা হবে।  ধন্যবাদ  ",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
        ),
      )),
    );
  }
}
