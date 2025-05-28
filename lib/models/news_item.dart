class NewsItem {
  final String time;
  final String category;
  final String title;
  final String message;
  final String? subheader;
  final String author;
  final String authorIcon;
  final String? image;
  int likes;
  bool liked;
  bool bookmarked;

  NewsItem({
    required this.time,
    required this.category,
    required this.title,
    required this.message,
     this.subheader,
    required this.author,
    required this.authorIcon,
    this.image,
    this.likes = 0,
    this.liked = false,
    this.bookmarked = false,
  });
}
