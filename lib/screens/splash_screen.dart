import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_dice_game_task_7/controllers/splash_screen_controller.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/sizes.dart';

import '../utils/constants/images.dart';
import '../utils/constants/text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Container(
        color: Colors.black54,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.splashImage,
                height: 150,
              ),
              const SizedBox(
                height: DiceSizes.spaceBtwItems,
              ),
              const Text(
                appName,
                style: TextStyle(
                    fontSize: 2 * DiceSizes.fontSizeMd,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0.5),
              ),
              const SizedBox(
                height: DiceSizes.spaceBtwSectionsSm,
              )
            ],
          ),
        ),
      ),
    );
  }
}
