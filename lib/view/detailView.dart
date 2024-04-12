import 'package:flutter/material.dart';



class DetailView extends StatefulWidget {
  String newsUrl;
   DetailView({super.key,required this.newsUrl});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: Text(widget.newsUrl)),
    );
  }
}