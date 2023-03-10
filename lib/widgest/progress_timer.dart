import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../constants.dart';
import '../controller/quiz_controller.dart';

class ProgressTimer extends StatelessWidget {
  ProgressTimer({Key? key}) : super (key: key);
  final controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
            () =>
            SizedBox(
              height: 50,
              width: 58,
              child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: 1 - (controller.sec.value / 15),
                      color: kPrimaryColor,
                      backgroundColor: Colors.grey,
                      strokeWidth: 8,
                    ),
                    Center(child:
                      Text(
    "${controller.sec.value}",style: Theme.of(context).textTheme.headline6!.copyWith(color: kPrimaryColor)
                      ),)
                  ]),
            ));
  }
}
  // CircularProgressIndicator
