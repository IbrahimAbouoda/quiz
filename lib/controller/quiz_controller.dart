import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/model/qustion.dart';
import 'package:quiz/view/result_screens/result_screen.dart';
import 'package:quiz/view/welcom_screen.dart';

class QuizController extends GetxController {
  String name = '';
  final List<QoustionModel> _qutionList = [
    QoustionModel(
        answer: 2,
        id: 1,
        options: ['55', '26', '63', '62'],
        qustion: "ما عمر الرسول عندما توفي"),
    QoustionModel(
      answer: 2,
      id: 1,
      options: ['ماريا', 'صفية', 'خديجة', 'عائشة'],
      qustion: "ما اسم اول زوجة للرسول ",
    ),
    QoustionModel(
        answer: 2,
        id: 1,
        options: ['عمار', 'علي', 'عمر', 'ابو بكر'],
        qustion: "اول من اسلم من الرجال"),
    QoustionModel(
        answer: 2,
        id: 1,
        options: ['55', '26', '63', '62'],
        qustion: " ول من اسلم من النساء"),
    QoustionModel(
        answer: 2,
        id: 1,
        options: ['55', '26', '63', '62'],
        qustion: "ما عمر الرسول عندما توفي"),
    QoustionModel(
        answer: 2,
        id: 1,
        options: ['55', '26', '63', '62'],
        qustion: "ما عمر الرسول عندما توفي"),
    QoustionModel(
        answer: 2,
        id: 1,
        options: ['55', '26', '63', '62'],
        qustion: "ما عمر الرسول عندما توفي"),
  ];

  bool _isPressed = false;
  double _numberOfQusion = 1;
  int? _selectAnswer;
  int _countOfCorrectAnswer = 0;
  final RxInt _sec = 15.obs;

  int get qutionListCount => _qutionList.length;

  List<QoustionModel> get qutionList => [..._qutionList];

  bool get isPressed => _isPressed;

  double get numberOfQusion => _numberOfQusion;

  int? get selectAnswer => _selectAnswer;

  int get countOfCorrectAnswer => _countOfCorrectAnswer;

  RxInt get sec => _sec;
  int? _correctAnswer;

  final Map<int, bool> __qustionAsAnswerd = {};
  Timer? _timer;
  final maxSec = 15;
  late PageController pageController;

  @override
  void onInit() {
    // TODO: implement onInit

    pageController = PageController(initialPage: 0);

    restAnswer();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    pageController.dispose();
    super.onClose();
  }

  double get scoreResult {
    return _countOfCorrectAnswer * 100 / qutionListCount;
  }

  void checkAnswer(QoustionModel qoustionModel, int selectedAnnswer) {
    _isPressed = true;
    _selectAnswer = selectedAnnswer;
    _correctAnswer = qoustionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswer++;
    }
    stopTimer();
    __qustionAsAnswerd.update(qoustionModel.id, (value) => true);
    Future.delayed(Duration(milliseconds: 500)).then((value) => nextQustion());
    update();
  }

  bool checkedIsQoustionsAnswerds(int quesId) {
    return __qustionAsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  nextQustion() {
    if (_timer != null || _timer!.isActive) {
      stopTimer();
    }

    if (pageController.page == _qutionList.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
      startTimer();
    }
    _numberOfQusion = pageController.page! + 2;

    update();
  }

  void restAnswer() {
    for (var element in _qutionList) {
      __qustionAsAnswerd.addAll({element.id: false});
    }
    update();
  }

  void startTimer() {
    restTimer();

    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else
        () {
          stopTimer();
          nextQustion();
        };
    });
  }

  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green;
      } else if (_selectAnswer == answerIndex &&
          _correctAnswer != _selectAnswer) {
        return Colors.red;
      }
    }

    return Colors.white;
  }

  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (_selectAnswer == answerIndex &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }

    return Icons.close;
  }


  void startAgain(){
    _correctAnswer=null;
    _countOfCorrectAnswer=0;
    _selectAnswer=null;
    restAnswer();
    //todo navigation welcom screen
    Get.offAndToNamed(WelcomScreen.routeName);
  }
  void restTimer() => _sec.value = maxSec;

  void stopTimer() => _timer!.cancel();
}
