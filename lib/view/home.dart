import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:khabre/controller/fetch_news.dart';
import 'package:khabre/model/newArt.dart';
import 'package:khabre/view/widget/newscontainer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isload=false;
  late NewsArt newsArt;


GetNews() async{
  log("GetNews called");
  setState(() {
      isload = true;
    });
  newsArt = await FetchNews.fetchNews();
  setState(() {
        isload=false;
  });
}
@override
  void initState() {
    log('app started');
    GetNews();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isload ? const Center(child: CircularProgressIndicator(),) : PageView.builder(
        controller: PageController(initialPage: 1),
       scrollDirection: Axis.vertical, 
       
       onPageChanged: (value) {
         GetNews();
       },
       itemBuilder: (context , index){
        return NewsContaainer(imgUrl: newsArt.imgUrl,
        newsHead: newsArt.newsHead, newsCont: newsArt.newsCont,
          newsDes:newsArt.newsDes ,
          newsUrl: newsArt.newsUrl);
      }),
    );
  }
}