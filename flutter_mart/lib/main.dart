import 'package:flutter/material.dart';
import 'package:flutter_mart/pages/cart_page.dart';
import 'package:flutter_mart/pages/product_page.dart';
import 'package:flutter_mart/pages/splash_screen.dart';
import 'package:flutter_mart/pages/test_pages.dart';
import 'package:flutter_mart/pages/video_player.dart';
import 'package:flutter_mart/provider/cart_provider.dart';
import 'package:flutter_mart/provider/video_player_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CartProvider()),
         ChangeNotifierProvider(create: (_) => VideoProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/splash",
          routes: {
            "/products": (context)=>const ProductPage(),
            "/cart": (context)=>const CartPage(),
            "/dropdown":(context)=>const TestPage(),
            "/splash":(context)=>const SplashScreen(),
             "/video": (context) => const VideoPlayerPage(),
          },
      ),
    );
  }
}
