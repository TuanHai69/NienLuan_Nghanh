import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.lightBlue[100],
                child: ListTile(
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.pink,
                  ),
                  title: Text('Giỏ hàng ${index + 1}'),
                  subtitle: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  title: Text('Chi tiết ${i + 1}'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      print(
                                          'Sản phẩm ${i + 1} xóa khỏi giỏ hàng');
                                      // Thêm hành động xóa chi tiết ở đây
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Chi tiết giỏ hàng ${index + 1}',
                      style: const TextStyle(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.payment, color: Colors.green),
                        onPressed: () {
                          print('Thanh toán giỏ hàng');

                          // Thêm hành động thanh toán ở đây
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          print('Xóa sản Giỏ hàng');

                          // Thêm hành động xóa sản phẩm ở đây
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
