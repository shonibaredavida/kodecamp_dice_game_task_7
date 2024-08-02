import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_dice_game_task_7/controllers/dice_rolll_controller.dart';
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
        color: Colors.black,
        child: Stack(children: [
          Positioned(
            top: 40,
            right: 40,
            child: GetBuilder<DiceRollController>(builder: (controller) {
              return Text.rich(
                TextSpan(
                    text: controller.currentTurn.toString(),
                    style: const TextStyle(
                        fontSize: DiceSizes.fontSizeTitle, color: Colors.red),
                    children: const [
                      TextSpan(
                        text: "/6",
                        style: TextStyle(
                            fontSize: DiceSizes.fontSizeTitle * .8,
                            color: Colors.white),
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
                          backgroundColor: controller.thrownValues.length < 6
                              ? Colors.yellow
                              : Colors.red.withOpacity(0.3),
                          foregroundColor: Colors.black,
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
                                    ? Colors.black
                                    : Colors.white),
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
