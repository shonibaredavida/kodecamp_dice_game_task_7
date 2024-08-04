import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_dice_game_task_7/controllers/dice_rolll_controller.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/colors.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/sizes.dart';

class DiceRollerScreen extends StatelessWidget {
  const DiceRollerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiceRollController());
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Stack(children: [
          Positioned(
            top: 40,
            right: 40,
            child: GetBuilder<DiceRollController>(builder: (controller) {
              return Text.rich(
                TextSpan(
                    text: controller.thrownValues.length.toString(),
                    style: TextStyle(
                        fontSize: DiceSizes.fontSizeTitle * 1.3,
                        color: errorRed),
                    children: [
                      TextSpan(
                        text: "/6",
                        style: TextStyle(
                            fontSize: DiceSizes.fontSizeTitle,
                            color: whiteColor),
                      )
                    ]),
              );
            }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: DiceSizes.spaceBtwSectionsSm,
              ),
              Obx(
                () => Image.asset(
                  controller.currentDice.value,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: GetBuilder<DiceRollController>(
                    init: controller,
                    builder: (controller) {
                      return ElevatedButton(
                        onPressed: controller.isLoading
                            ? null
                            : controller.thrownValues.length < 6
                                ? controller.rollDice
                                : controller.restartDiceGame,
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: controller.isLoading
                              ? greyColor.withOpacity(0.7)
                              : controller.thrownValues.length < 6
                                  ? amberColor
                                  : errorRed.withOpacity(0.31),
                          foregroundColor: backgroundColor,
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            controller.thrownValues.length < 6
                                ? "Roll the dice"
                                : "Reset Game",
                            style: TextStyle(
                                fontSize: DiceSizes.fontSizeTitle,
                                color: controller.thrownValues.length < 6
                                    ? backgroundColor
                                    : whiteColor),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: DiceSizes.spaceBtwSectionsMd,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
