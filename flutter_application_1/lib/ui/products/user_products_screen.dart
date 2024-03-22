import 'package:flutter/material.dart';
import '../../ui/products/edit_product_screen.dart';
import 'package:provider/provider.dart';

import 'user_product_list_tile.dart';
import 'products_manager.dart';

import '../shared/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Products'),
          actions: <Widget>[
            AddUserProductButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                );
                // print('Go to edit product screen');
              },
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: context.read<ProductsManager>().fetchUserProducts(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () =>
                  context.read<ProductsManager>().fetchUserProducts(),
              child: const UserProductList(),
            );
          },
        )
        // const UserProductList(),
        );
  }
}

class UserProductList extends StatelessWidget {
  const UserProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Dùng Consumer để truy xuất và lắng nghe báo hiệu
    // thay đổi trạng thái từ ProductsManager
    // final productsManager = ProductsManager();

    return Consumer<ProductsManager>(
      builder: (ctx, productsManager, child) {
        return ListView.builder(
          itemCount: productsManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductListTile(
                productsManager.items[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

class AddUserProductButton extends StatelessWidget {
  const AddUserProductButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: const Icon(Icons.add));
  }
}
