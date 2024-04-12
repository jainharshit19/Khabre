class NewsArt{
  
String imgUrl;
String newsHead;
String newsDes;
String newsUrl;
String newsCont;




NewsArt({
required this.imgUrl,
required this.newsHead,
required this.newsDes,
required this.newsUrl,
required this.newsCont




});

static NewsArt fromApiToApp(Map<String,dynamic>article){
  
  return NewsArt(imgUrl: article["urlToImage"] ?? "https://th.bing.com/th/id/OIP.cPBUknoP9DUWTTpvZThYKQHaEK?w=309&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
  newsHead: article["title"] ?? "--", 
  newsDes: article["description"] ?? "--", 
  newsUrl: article["url"] ?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
  newsCont: article["content"] ?? "--");
}


}