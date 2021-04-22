import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/modules/app/pages/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/modules/shared/models/answer_model.dart';
import 'package:DevQuiz/modules/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AnswerModel answers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (int i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answers(i),
              isSelected: indexSelected == i,
              onTap: () {
                if (indexSelected == -1) {
                  indexSelected = i;
                  setState(() {});
                }
              },
            )
        ],
      ),
    );
  }
}
