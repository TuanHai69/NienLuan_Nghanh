class Artical {
  String articalId;
  final String title;
  final String imageUrl;
  final String content;
  final String author;
  final DateTime release;
  int favorite;

  Artical(this.articalId, this.title, this.imageUrl, this.content, this.author,
      this.release, this.favorite);

  static List<Artical> sample = [
    Artical(
        '1',
        'Nội dung bài báo 1',
        'image/artical1.jpg',
        'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
            'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
        'author1',
        DateTime.parse('2024-01-25'),
        2000),
    Artical('2', 'Nội dung bài báo 2', 'image/artical2.jpg', 'content',
        'author2', DateTime.parse('2024-01-25'), 2000),
    Artical('3', 'Nội dung bài báo 3', 'image/artical3.jpg', 'content',
        'author3', DateTime.parse('2024-01-25'), 2002),
    Artical('4', 'Nội dung bài báo 4', 'image/artical4.jpg', 'content',
        'author4', DateTime.parse('2024-01-25'), 2003)
  ];
}

class FavoriteArticals {
  String userId;
  String articalId;
  FavoriteArticals(this.userId, this.articalId);
  static List<FavoriteArticals> exs = [
    FavoriteArticals('user_id1', '1'),
    FavoriteArticals('user_id1', '2'),
  ];

  //   Account account;
  // Artical artical;

  // FavoriteArticals(this.account, this.artical);
}
