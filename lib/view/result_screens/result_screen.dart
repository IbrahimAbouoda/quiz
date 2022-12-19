import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controller/quiz_controller.dart';
import 'package:quiz/widgest/custom_button.dart';
import 'package:quiz/widgest/qoustion_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  static const routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: GetBuilder<QuizController>(
              init: Get.find<QuizController>(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'congratulation',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    controller.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: kPrimaryColor),
                  ),
                  Text(
                    "your Scouer is",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('${controller.scoreResult.round()}/100',style:  Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.white,),),
                  
                  CustomButton(onPressed: ()=>controller.startAgain(), text: "start Agin")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
