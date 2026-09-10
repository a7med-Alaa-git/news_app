class ArticleModel {
  final String title;
  final String? image;
  final String date;

  ArticleModel({required this.title, required this.image, required this.date});

  factory ArticleModel.fromjson(dynamic json) {
    return ArticleModel(
      title: json['title'],
      image: json['urlToImage'],
      date: json['publishedAt'],
    );
  }
}
