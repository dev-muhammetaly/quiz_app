import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screens/questionsScreen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  // Returns how many answers were correct
  int get numCorrect {
    int count = 0;
    for (var i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].answers[0]) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 99, 2, 116),
              Color.fromARGB(255, 16, 4, 150),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'You answered $numCorrect out of ${questions.length} questions correctly!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // Per-question result list
                ...List.generate(questions.length, (index) {
                  final isCorrect =
                      selectedAnswers[index] == questions[index].answers[0];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isCorrect
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          isCorrect ? Icons.check_circle : Icons.cancel,
                          color: isCorrect
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          size: 26,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Question text
                              Text(
                                questions[index].text,
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              // User's answer
                              Text(
                                'Your answer: ${selectedAnswers[index]}',
                                style: GoogleFonts.lato(
                                  color: isCorrect
                                      ? Colors.greenAccent
                                      : Colors.redAccent,
                                  fontSize: 13,
                                ),
                              ),
                              // Show correct answer only if wrong
                              if (!isCorrect) ...[
                                const SizedBox(height: 2),
                                Text(
                                  'Correct answer: ${questions[index].answers[0]}',
                                  style: GoogleFonts.lato(
                                    color: Colors.greenAccent,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 30),
                // Restart button
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Questionsscreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: Text(
                    'Restart Quiz',
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
