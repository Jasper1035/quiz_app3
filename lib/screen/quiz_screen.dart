import 'package:flutter/material.dart';
// import 'package:quiz_app3/model/question.dart';
import 'package:quiz_app3/model/questions.dart';
import 'package:quiz_app3/screen/result_screen.dart';
import 'package:quiz_app3/widget/answer_card.dart';
import 'package:quiz_app3/widget/rectangle_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;

  int questionIndex = 0;

  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;

    if (selectedAnswerIndex == questions[questionIndex].correctAnswerIndex) {
      score++;
    }

    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 23),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),

            isLastQuestion
                ? RectangleButton(
                    label: 'Finish',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) {
                            return ResultScreen(score: score);
                          },
                        ),
                      );
                    },
                  )
                : RectangleButton(
                    label: 'Next',
                    onPressed: selectedAnswerIndex != null
                        ? goToNextQuestion
                        : null,
                  ),
          ],
        ),
      ),
    );
  }
}
