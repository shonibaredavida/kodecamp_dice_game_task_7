import 'package:fluttertoast/fluttertoast.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/sizes.dart';

Future diceToast({required String text, bool longDuration = false, fontsize}) {
  Toast? toastLenght;
  int? iosDuration;

  if (longDuration) {
    toastLenght = Toast.LENGTH_LONG;
    iosDuration = 2;
  }
  return Fluttertoast.showToast(
      msg: text,
      toastLength: toastLenght ?? Toast.LENGTH_SHORT,
      timeInSecForIosWeb: iosDuration ?? 1,
      fontSize: fontsize ?? DiceSizes.fontSizeXLg);
}
