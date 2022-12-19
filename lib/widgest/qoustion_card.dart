import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz/controller/quiz_controller.dart';
import 'package:quiz/model/qustion.dart';
import 'package:quiz/widgest/answer_options.dart';

class QoustionCard extends StatelessWidget {
  final QoustionModel qoustionModel;

  QoustionCard({Key? key, required this.qoustionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 450,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  qoustionModel.qustion,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Spacer(
                  flex: 1,
                ),
                ...List.generate(
                    qoustionModel.options.length,
                    (index) => Column(
                          children: [
                            AnswerOptions(
                                text: qoustionModel.options[index],
                                index: index,
                                qosionID: qoustionModel.id,
                                onPressed: () => Get.find<QuizController>()
                                    .checkAnswer(qoustionModel, index)),

                            SizedBox(height: 15,),
                          ],

                        )),
                Spacer(flex:1,),
              ],
            ),
          )),
    );
  }
}
