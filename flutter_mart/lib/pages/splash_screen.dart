import'Package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_mart/pages/product_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3500,
      splashIconSize: 300,
      splash: Center(
      child: Lottie.network(
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
              ),
              
    ), nextScreen:const ProductPage());
  }
}