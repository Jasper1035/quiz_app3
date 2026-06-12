import 'package:flutter/material.dart';
import 'package:quiz_app3/model/questions.dart';
import 'package:quiz_app3/widget/answer_card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //nothing chnages only for github push
    final question = questions[0];
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
                // return GestureDetector(onTap: () {}, child: AnswerCard(question: question, isSelected: isSelected, correctAnswerIndex: correctAnswerIndex, selectedAnswerIndex: selectedAnswerIndex, currentIndex: currentIndex),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
