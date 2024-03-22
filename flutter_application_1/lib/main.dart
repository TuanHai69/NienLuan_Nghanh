import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'ui/screens.dart';

// import 'package:myshop/ui/cart/cart_manager.dart';
// import 'package:myshop/ui/orders/order_manager.dart';
import 'ui/products/edit_product_screen.dart';

// import 'ui/products/products_manager.dart';
// import 'ui/products/product_detail_screen.dart';

// import 'ui/products/user_products_screen.dart';

// import 'ui/products/products_overview_screen.dart';

// import 'ui/cart/cart_screen.dart';
// import 'ui/orders/orders_screen.dart';

Future<void> main() async {
  // (1) Load the .env file
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.purple,
      secondary: Colors.deepOrange,
      background: Colors.white,
      surfaceTint: Colors.grey[200],
    );

    final themeData = ThemeData(
      fontFamily: 'Lato',
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        shadowColor: colorScheme.shadow,
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 20,
        ),
      ),
    );

    return MultiProvider(
      providers: [
        // (2) Create and provide AuthManager
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
        ChangeNotifierProxyProvider<AuthManager, ProductsManager>(
          create: (ctx) => ProductsManager(),
          update: (ctx, authManager, productsManager) {
            // Khi authManager có báo hiệu thay đổi thì đọc lại authTokem
            // cho productManager
            productsManager!.authToken = authManager.authToken;
            return productsManager;
          },
        ),
        ChangeNotifierProxyProvider<AuthManager, CartManager>(
          create: (ctx) => CartManager(),
          update: (ctx, authManager, cartManager) {
            // Khi authManager có báo hiệu thay đổi thì đọc lại authToken
            // cho cartManager
            cartManager!.authToken = authManager.authToken;
            return cartManager;
          },
        ),
        ChangeNotifierProxyProvider<AuthManager, OrdersManager>(
          create: (ctx) => OrdersManager(),
          update: (ctx, authManager, orderManager) {
            // Khi authManager có báo hiệu thay đổi thì đọc lại authToken
            // cho cartManager
            orderManager!.authToken = authManager.authToken;
            return orderManager;
          },
        ),

        // ChangeNotifierProvider(
        //   create: (ctx) => CartManager(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => OrdersManager(),
        // ),
      ],
      // (3) Consume the Auth Manager instance
      child: Consumer<AuthManager>(builder: (ctx, authManager, child) {
        return MaterialApp(
          title: 'MyShop',
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: authManager.isAuth
              ? const SafeArea(child: ProductsOverviewScreen())
              : FutureBuilder(
                  future: authManager.tryAutoLogin(),
                  builder: (ctx, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SafeArea(child: SplashScreen())
                        : const SafeArea(child: AuthScreen());
                  },
                ),
          routes: {
            CartScreen.routeName: (ctx) => const SafeArea(
                  child: CartScreen(),
                ),
            OrdersScreen.routeName: (ctx) => const SafeArea(
                  child: OrdersScreen(),
                ),
            UserProductsScreen.routeName: (ctx) => const SafeArea(
                  child: UserProductsScreen(),
                ),
          },
          onGenerateRoute: (settings) {
            if (settings.name == ProductDetailScreen.routeName) {
              final productId = settings.arguments as String;
              return MaterialPageRoute(
                settings: settings,
                builder: (ctx) {
                  return SafeArea(
                    child: ProductDetailScreen(
                      ctx.read<ProductsManager>().findById(productId)!,
                    ),
                  );
                },
              );
            }
            if (settings.name == EditProductScreen.routeName) {
              final productId = settings.arguments as String?;
              return MaterialPageRoute(
                builder: (ctx) {
                  return SafeArea(
                    child: EditProductScreen(
                      productId != null
                          ? ctx.read<ProductsManager>().findById(productId)
                          : null,
                    ),
                  );
                },
              );
            }
            return null;
          },
          // const SafeArea(child: OrdersScreen()
          // CartScreen(),
          // ProductsOverviewScreen(),
          // UserProductsScreen(),
          // ProductDetailScreen(
          //   ProductsManager().items[0],
          // ),
          // ),
          // Scaffold(
          //   appBar: AppBar(
          //     title: const Text('MyShop'),
          //   ),
          //   body: const Center(
          //     child: Text('Welcome to MyShop'),
          //   ),
          // ),
        );
      }),
    );
  }
}
