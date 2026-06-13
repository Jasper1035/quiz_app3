import 'package:flutter/material.dart';
import 'package:quiz_app3/model/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final percentage = (score / questions.length * 100).round();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 1000),
          Text(
            'Your Score',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: (score / questions.length).clamp(0.0, 1.0),
                  color: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(score.toString(), style: TextStyle(fontSize: 80)),
                  SizedBox(height: 10),
                  Text('$percentage%', style: TextStyle(fontSize: 25)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
