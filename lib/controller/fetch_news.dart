// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=c61f8a5cf066438eb8a56964669f5d47
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:khabre/model/newArt.dart';




class FetchNews{
static List sourcesId =[
  "abc-news",
 
    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
   
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",
    
    "national-geographic",
 
    "news24",
    "new-scientist",
   
    "new-york-magazine",
    "next-big-future",
  
    "techcrunch",
    "techradar",
   
    "the-hindu",
   
    "the-wall-street-journal",
    
    "the-washington-times",
    "time",
    "usa-today",

];


  static Future <NewsArt> fetchNews() async{
    try {
      print(10);
      final random =new Random();
      int ind = random.nextInt(sourcesId.length);
      var sourceId = sourcesId[ind];
      print(sourcesId.length);
      print(ind);
      print(sourceId);

      Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=c61f8a5cf066438eb8a56964669f5d47"));
        Map body_data = jsonDecode(response.body);
        log(2);
        print(body_data);
        List articles = body_data["articles"];
        //print(articles);
      print("***********************");
      final Newrandom =new Random();
      var myArticle = articles[random.nextInt(articles.length)];
      print(myArticle);
      print("***********************");
      log(11);
      return NewsArt.fromApiToApp(myArticle);
    } catch (e) {
      print(e.toString());
      return NewsArt(imgUrl: 'https://th.bing.com/th/id/OIP.cPBUknoP9DUWTTpvZThYKQHaEK?w=309&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7', newsHead: 'Title', newsDes: 'Hello', newsUrl: '', newsCont: '1');
    }
  }
}
