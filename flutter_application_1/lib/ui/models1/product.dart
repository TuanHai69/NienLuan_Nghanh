class Products {
  String id;
  String image;
  String name;
  String discription;
  double cost;
  int alreadySell;
  int instock;
  int loveCount;

  Products({
    required this.id,
    required this.image,
    required this.name,
    required this.discription,
    required this.cost,
    required this.alreadySell,
    required this.instock,
    required this.loveCount,
  });

  static List<Products> product = [
    Products(
      id: '1',
      image: 'image/artical1.jpg',
      name: 'Luffy',
      discription:
          'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
          'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
      cost: 56000,
      instock: 100,
      alreadySell: 0,
      loveCount: 2000,
    ),
    Products(
      id: '2',
      image: 'image/artical2.jpg',
      name: 'Luffy',
      discription:
          'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
          'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
      cost: 56000,
      instock: 100,
      alreadySell: 0,
      loveCount: 2000,
    ),
    Products(
      id: '3',
      image: 'image/artical3.jpg',
      name: 'Sanjj',
      discription:
          'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
          'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
      cost: 56000,
      instock: 100,
      alreadySell: 0,
      loveCount: 2000,
    ),
    Products(
      id: '4',
      image: 'image/artical4.jpg',
      name: 'Luffy',
      discription:
          'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
          'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
      cost: 56000,
      instock: 100,
      alreadySell: 0,
      loveCount: 2000,
    ),
    Products(
      id: '5',
      image: 'image/artical1.jpg',
      name: 'Luffy',
      discription:
          'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
          'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
      cost: 56000,
      instock: 100,
      alreadySell: 0,
      loveCount: 2000,
    ),
    Products(
      id: '6',
      image: 'image/artical2.jpg',
      name: 'Luffy',
      discription:
          'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
          'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
      cost: 56000,
      instock: 100,
      alreadySell: 0,
      loveCount: 2000,
    ),
    Products(
      id: '7',
      image: 'image/artical3.jpg',
      name: 'Sanjj',
      discription:
          'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
          'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
      cost: 56000,
      instock: 100,
      alreadySell: 0,
      loveCount: 2000,
    ),
    Products(
      id: '8',
      image: 'image/artical4.jpg',
      name: 'Luffy',
      discription:
          'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
          'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
      cost: 56000,
      instock: 100,
      alreadySell: 0,
      loveCount: 2000,
    ),
  ];
}

class FavoriteProducts {
  String userid;
  String id;
  FavoriteProducts({required this.userid, required this.id});
  static List<FavoriteProducts> like = [
    FavoriteProducts(userid: 'user_id1', id: '1'),
    FavoriteProducts(userid: 'user_id1', id: '2'),
    FavoriteProducts(userid: 'user_id1', id: '3'),
  ];
}
