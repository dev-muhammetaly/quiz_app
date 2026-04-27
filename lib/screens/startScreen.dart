import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questionsScreen.dart';
import 'package:quiz_app/widget/StyledText.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/quiz-logo.png",
            width: 200,
            color: const Color.fromARGB(52, 248, 248, 248),
          ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset("assets/images/quiz-logo.png", width: 200),
          // ),
          SizedBox(height: 80),
          StyledText("Learn flutter in the fun way!"),
          SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Questionsscreen()),
              );
            },
            icon: Icon(
              Icons.arrow_right_alt_outlined,
              size: 50,
              color: Colors.white,
            ),
            label: StyledText("Start quiz!"),
          ),
        ],
      ),
    );
  }
}
