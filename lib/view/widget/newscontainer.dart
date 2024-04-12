import 'package:flutter/material.dart';
import 'package:khabre/view/detailView.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContaainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCont;

  NewsContaainer({
    super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsCont,
    required this.newsUrl,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      launchUrl(
        uri,
        webViewConfiguration: WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true
        ),
        mode: LaunchMode.inAppWebView
      );
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            imgUrl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 15,
              ),
              Text(
                newsHead.length > 70
                    ? "${newsHead.substring(0, 70)}..."
                    : newsHead,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                newsDes,
                style: TextStyle(fontSize: 12, color: Colors.black38),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                newsCont.length > 250
                    ? newsCont
                    : "${newsCont.toString()}...",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ]),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () async {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailView(newsUrl: newsUrl)));
                    await _launchUrl(newsUrl);
                  },
                  child: Text("Read More")),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
