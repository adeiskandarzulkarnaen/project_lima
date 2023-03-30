class News {
  final String id;
  final String newsPhoto;
  final String newsCaption;


  News({
    required this.id,
    required this.newsPhoto,
    required this.newsCaption,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map["id"], 
      newsPhoto: map["news_photo"],
      newsCaption: map["news_caption"]
    );
  }

  factory News.dummy(String id) {
    return News(
      id: id,
      newsPhoto: "https://picsum.photos/1080/690",
      newsCaption:  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Fusce ac consequat eros. Donec vitae orci eu risus maximus facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Fusce ac consequat eros. Donec vitae orci eu risus maximus facilisis.",
    );
  }
}