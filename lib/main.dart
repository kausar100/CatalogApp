import 'package:flutter/material.dart';
import 'package:flutter_practice/core/store.dart';
import 'package:flutter_practice/pages/cart_page.dart';
import 'package:flutter_practice/pages/detail_homepage.dart';
import 'package:flutter_practice/pages/homepage.dart';
import 'package:flutter_practice/pages/login_page.dart';
import 'package:flutter_practice/utils/MyRoute.dart';
import 'package:flutter_practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_, __) =>  MaterialPage(child: LoginPage()),
          MyRoute.homePage: (_, __) =>  MaterialPage(child: HomePage()),
          MyRoute.detailHomePage: (uri, __) {
            String? itemId = uri.queryParameters["id"];
            final catalog =
                (VxState.store as MyStore).catalog.getById(int.parse(itemId!));
            return MaterialPage(
                child: DetailHomePage(
              catalog: catalog,
            ));
          },
          MyRoute.loginPage: (_, __) =>  MaterialPage(child: LoginPage()),
          MyRoute.cartPage: (_, __) => const MaterialPage(child: CartPage()),
        },
      ),
    );
  }
}
