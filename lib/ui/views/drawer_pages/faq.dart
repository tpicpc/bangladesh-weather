import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqScreen extends StatefulWidget {
  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool _expanded = false;
  bool _expanded2 = false;
  bool _expanded3 = false;
  bool _expanded4 = false;
  bool _expanded5 = false;
  bool _expanded6 = false;
  bool _expanded7 = false;
  bool _expanded8 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("প্রশ্ন ও উত্তর"),
        ),
        backgroundColor: Color(0xFFE5E5E5),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 800),
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "বাতাসের গতিপ্রবাহ এর মধ্যে প্রথম বন্ধনীর মধ্যে মাঝে মাঝে একটা বা দুইটা অথবা তিনটা অক্ষর দেখায়। এর মাধ্যমে কি বোঝানো হয় ?  ",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              "এর মাধ্যমে বাতাস প্রবাহের দিক নির্ধারণ কে বুঝায়। \n\nপূর্ব = East(E),\n পশ্চিম = West(W),\n উত্তর = North(N),\nদক্ষিণ = South(S)\n\nচলুন কিছু উদাহরণের মাধ্যমে বুঝি। মনে করি এখানে দেখাচ্ছে (SSW) ।  এর পূর্ণনাম হচ্ছে South,  sotuh  - West মানে বাতাস দক্ষিণ ও দক্ষিণ পূর্ব দিকে থেকে আসতেছে।  যদি (E)  থাকে তাহলে East (পূর্ব ) দিকে বাতাস আসতেছে।  ",
                            ),
                          ),
                          isExpanded: _expanded5,
                          canTapOnHeader: true),
                    ],
                    expansionCallback: (panerIndex, isExpanded) {
                      _expanded5 = !_expanded5;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "অনুভূতিশীল তাপমাত্রা ও শুধু তাপমাত্রা এর মধ্যে পার্থক্য কি আছে  ? ",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              "হ্যাঁ ,  অনুভূতিশীল তাপমাত্রা ও তাপমাত্রা এর মধ্যে পার্থক্য আছে।  চলুন একটা উদাহরণের মাধ্যমে বুঝি । ধরি, তাপমাত্রা আছে ৩৫ ডিগ্রি সেলসিয়াস এবং অনুভূতিশীল তাপমাত্রা আছে ৩২ ডিগ্রি সেলসিয়াস। এখানে থেকে আমাদের বুঝে নিতে হবে বর্তমান তাপমাত্রা ৩৫ ডিগ্রি সেলসিয়াস কিন্তু আমাদের শরীরে তাপমাত্রা অনুভব হচ্ছে ৩২ ডিগ্রি সেলসিয়াস। ",
                            ),
                          ),
                          isExpanded: _expanded,
                          canTapOnHeader: true),
                    ],
                    expansionCallback: (panerIndex, isExpanded) {
                      _expanded = !_expanded;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "দমকা বাতাসের গতিপ্রবাহ বলতে কি বোঝায়?",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              "দমকা বাতাসের গতিপ্রবাহ বলতে হঠাৎ করে বা আচমকা যে বাতাস আসে সেই বাতাসের গতিপ্রবাহকে বোঝায়।\n\nচলুন একতা উদাহরণ মাধ্যমে বুঝি। মনে করি, দেওয়া আছে দমকা বাতাসের গতিপ্রবাহ 16 km/h তাহলে এখানে আমাদের বুঝে নিতে হবে হঠাৎ করে বা আচমকা এলোমেলো যে বাতাস আসে সেই বাতাসের গতি ঘণ্টায় ১৬ কিলোমিটার বেগে আসে।",
                            ),
                          ),
                          isExpanded: _expanded2,
                          canTapOnHeader: true),
                    ],
                    expansionCallback: (panerIndex, isExpanded) {
                      _expanded2 = !_expanded2;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "বৃষ্টি হওয়ার সম্ভাবনা বলতে এখানে কি বোঝানো হয়েছে?",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              "ধরুন, অ্যাপ বলছে বৃষ্টি হওয়ার সম্ভাবনা ৬০%। এই ৬০% ধারনা দেয় যে বৃষ্টির ব্যাপারে আপনার কতটা নিশ্চিত হওয়া উচিত। এর মানে এই নয় যে দিনের ৬০% সময় বৃষ্টি হবে। এর মানে এই নয় যে ৬০% এলাকায় বৃষ্টি হবে । ",
                            ),
                          ),
                          isExpanded: _expanded3,
                          canTapOnHeader: true),
                    ],
                    expansionCallback: (panerIndex, isExpanded) {
                      _expanded3 = !_expanded3;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "এই অ্যাপটি ব্যাবহার করার মাধ্যমে আমরা কিভাবে উপকৃত হতে পারি?",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              "কোথাও ঘুরতে যাচ্ছি। যাওয়ার আগে অ্যাপটিতে প্রবেশ করলেই আমরা দেখতে পাবো সারাদিনের অথবা সামনে কয়েকদিন অথবা সামনে কয়েক ঘণ্টা বৃষ্টি হওয়ার সম্ভাবনা আছে কি না বা আবহাওয়া কেমন থাকবে। এতে আমরা সাবধানতা অবলম্বন করতে পারবো। \n\nঘুম থেকে উঠেই যদি অ্যাপটিতে প্রবেশ করে দেখে নেই আজকের সারাদিনের আবহাওয়া কেমন থাকবে তাহলে সেই অনুযায়ী আমাদের সারাদিনের কাজের পরিকল্পনা করতে সুবিধা হবে। \n\n ঘুমাতে যাওয়ার আগে যদি অ্যাপটি তে প্রবেশ করে দেখে নেই সারারাতের আবহাওয়া কেমন থাকবে তাহলে সেই অনুযায়ী প্রস্তুতি নিয়ে ঘুমাতে যেতে পারবো। \n\n কোন অনুষ্ঠান করার আগে অ্যাপটির মাধ্যমে সারাদিনের বা কয়দিনের আবহাওয়া দেখে সেই অনুযায়ী অনুষ্ঠান সম্পন্ন করার প্রস্তুতি নিতে পারব। \n\nএগুলো ছাড়াও আরও বিভিন্ন ভাবে প্রয়োজন মতো ব্যাবহার করে উপকৃত হতে পারেন। ",
                            ),
                          ),
                          isExpanded: _expanded4,
                          canTapOnHeader: true),
                    ],
                    expansionCallback: (panerIndex, isExpanded) {
                      _expanded4 = !_expanded4;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "অ্যাপটি কি নেট ছারা চালানো সম্ভব? ",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              "না, নেট ছাড়া অ্যাপটি ব্যাবহার করা সম্ভব নয়। কারণ ১৫ মিনিট পর পর তথ্য গুলোকে আপডেট করা হয় এবং সকল তথ্য গুলো সার্ভার থেকে নিয়ে আসে তাই ইন্টারনেট ছাড়া অ্যাপটি ব্যাবহার করা সম্ভব নয়। ",
                            ),
                          ),
                          isExpanded: _expanded6,
                          canTapOnHeader: true),
                    ],
                    expansionCallback: (panerIndex, isExpanded) {
                      _expanded6 = !_expanded6;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "এই অ্যাপটির ভবিষ্যতের পরিকল্পনা কি? ",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              "বর্তমানে অ্যাপটি শুধুমাত্র বাংলাদেশি মানুষের ব্যাবহারের জন্য বানানো হয়েছে। ভবিষ্যতে সকল দেশের মানুষ যেন ব্যাবহার করতে পারে সেই অনুযায়ী উপযোগী করা সহ আরও অনেক নতুন নতুন অনেক ফিচার যুক্ত করা। ",
                            ),
                          ),
                          isExpanded: _expanded7,
                          canTapOnHeader: true),
                    ],
                    expansionCallback: (panerIndex, isExpanded) {
                      _expanded7 = !_expanded7;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "এই অ্যাপটির সক্ষমতা কি?",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              "অ্যাপের তথ্য গুলোকে ১৫ মিনিট পর পর আপডেট করা হয়। এর মধ্যে আবহাওয়ার যদি কোন পরিবর্তন আসে তাহলে সেই তথ্যটিকে আপডেট করা হয় এবং বড় কোন দুর্যোগ আসলে নিউজ এর মাধ্যমে জানিয়ে দেয়। ",
                            ),
                          ),
                          isExpanded: _expanded8,
                          canTapOnHeader: true),
                    ],
                    expansionCallback: (panerIndex, isExpanded) {
                      _expanded8 = !_expanded8;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
