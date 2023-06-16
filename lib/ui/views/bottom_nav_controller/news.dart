import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weatherbd/models/news_model.dart';
import 'package:weatherbd/ui/services/news_services.dart';

import '../news_dettails.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsModel? newsModel;

  bool isloaded = false;

  getData() async {
    newsModel = await NewsService().getNews();
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("আবহাওয়ার খবর"),
      ),
      backgroundColor: Color(0xFFE5E5E5),
      body: Visibility(
          visible: isloaded,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: SizedBox(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: newsModel?.articles.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 2,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) =>
                                NewsDettails(newsModel?.articles[index])),
                      ),
                      child: Container(
                        height: 155.h,
                        width: double.infinity,
                        child: Row(children: [
                          SizedBox(
                            width: 4.w,
                          ),
                          Image.network(
                            newsModel?.articles[index].image ?? "",
                            height: 145.h,
                            width: 120.w,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 5, right: 10),
                                child: Container(
                                  height: 47.h,
                                  width: 270.w,
                                  child: Text(
                                    newsModel?.articles[index].title ?? "",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 3, left: 10, right: 10),
                                child: Container(
                                  height: 12.h,
                                  width: 260.w,
                                  child: Text(
                                    newsModel?.articles[index].date ?? "",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 10, right: 10),
                                child: Container(
                                  height: 50.h,
                                  width: 270.w,
                                  child: Text(
                                    newsModel?.articles[index].description ??
                                        "",
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
