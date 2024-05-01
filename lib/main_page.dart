import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentQuestionIndex = 0;

  List<String> questions = [
    '1. 1 + 1 = ?',
    '2. 2 + 2 = ?',
    '3. 3 * 3 = ?',
    '4. 4 * 4 = ?',
    '5. 10 * 10 = ?',
  ];

  List<List<String>> answers = [
    ['6', '2', '9', '1'],
    ['4', '56', '3', '8'],
    ['89', '100', '9', '89'],
    ['8', '10', '16', '25'],
    ['400', '1', '10', '100'],
  ];

  List<String> correctAnswers = ['2', '4', '9', '16', '100'];

  bool? isAnsweredCorrectly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionWidget(
              question: questions[currentQuestionIndex],
              answers: answers[currentQuestionIndex],
              onAnswerSelected: (selectedAnswer) {
                setState(() {
                  isAnsweredCorrectly =
                      selectedAnswer == correctAnswers[currentQuestionIndex];
                });
              },
            ),
            if (isAnsweredCorrectly != null)
              Text(
                isAnsweredCorrectly! ? "To'g'ri" : "Noto'g'ri",
                style: TextStyle(
                  color: isAnsweredCorrectly! ? Colors.green : Colors.red,
                ),
              ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAnsweredCorrectly = null;
                  currentQuestionIndex =
                      (currentQuestionIndex + 1) % questions.length;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                "Keyingi ->",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> answers;
  final Function(String) onAnswerSelected;

  QuestionWidget({
    required this.question,
    required this.answers,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20),
        ),
        ...answers.map((answer) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  onAnswerSelected(answer);
                },
                child: Text(answer),
              ),
            )),
      ],
    );
  }
}
