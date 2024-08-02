import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_dice_game_task_7/screens/splash_screen.dart';

void main(List<String> args) {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: SplashScreen(),
    ),
  ));
}
