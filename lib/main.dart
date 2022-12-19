import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/utils/binding.dart';
import 'package:quiz/view/quiz_screens/quiz_screen.dart';
import 'package:quiz/view/result_screens/result_screen.dart';
import 'package:quiz/view/welcom_screen.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MyBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      initialRoute: WelcomScreen.routeName,
      getPages: [
         GetPage(name: WelcomScreen.routeName, page: ()=>WelcomScreen()),
         GetPage(name: QuizScreen.routeName, page: ()=>QuizScreen()),
         GetPage(name: ResultScreen.routeName, page: ()=>ResultScreen()),

      ],
    );
  }
}
