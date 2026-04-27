import 'package:flutter/material.dart';
import 'package:quiz_app/widget/answer_button.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screens/resultsScreen.dart';
import 'package:quiz_app/widget/StyledText.dart';

class Questionsscreen extends StatefulWidget {
  const Questionsscreen({super.key});

  @override
  State<Questionsscreen> createState() => _QuestionsscreenState();
}

class _QuestionsscreenState extends State<Questionsscreen> {
  var currentQuestionIndex = 0;
  List<String> selectedAnswers = [];

  void answerQuestion(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    // If all questions answered, go to results
    if (selectedAnswers.length == questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(selectedAnswers: selectedAnswers),
        ),
      );
      return;
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQueestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 99, 2, 116),
              const Color.fromARGB(255, 16, 4, 150),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: StyledText(currentQueestion.text),
              ),
              SizedBox(height: 30),
              ...currentQueestion.getShuffleAnswers().map((answer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 5,
                  ),
                  child: AnswerButton(
                    text: answer,
                    onTap: () => answerQuestion(answer),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
