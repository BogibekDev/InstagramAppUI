class Post {
  String username;
  String userImage;
  String? where;
  String? image;
  String? description;
  int countLikes;
  int countComments;

  Post({
    required this.username,
    required this.userImage,
    this.where,
    this.image,
    this.description,
    this.countLikes = 0,
    this.countComments = 0,
  });
}
