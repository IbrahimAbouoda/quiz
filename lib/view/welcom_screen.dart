import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz/controller/quiz_controller.dart';
import 'package:quiz/view/quiz_screens/quiz_screen.dart';
import 'package:quiz/widgest/custom_button.dart';
import '../constants.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({Key? key}) : super(key: key);
  static const routeName = '/welcom_screen';

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  final _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit(contex) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    Get.offAndToNamed(QuizScreen.routeName);
    Get.find<QuizController>().startTimer();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/sui.png"), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Let\’s start quiz",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  Text(
                    "Enter Your Name to Stert",
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),

                  ),
                  Spacer(flex: 1,),
                  Form(
                    key: _formKey,
                    child: GetBuilder<QuizController>(
                      init: Get.find<QuizController>(),
                      builder: (controller)=>
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "full name",
                          labelStyle: TextStyle(color: Colors.white),

                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3),
                              borderRadius: BorderRadius.circular(15)),

                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "name should no be empty";

                          }else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          controller.name=value!.trim().toUpperCase();

                        },
                        onFieldSubmitted: (_)=>_submit(context),
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                  Align(alignment: Alignment.center,
                  child: CustomButton(
                    width: double.infinity,
                    onPressed: () => _submit(context)
                     ,
                    text: "Lets start quiz",
                  ),),
                  Spacer(flex: 2,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
