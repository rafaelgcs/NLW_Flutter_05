import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/modules/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int totalQuestions;
  final int completedQuestions;
  final double percent;
  const QuizCardWidget(
      {Key? key,
      required this.title,
      required this.totalQuestions,
      required this.completedQuestions,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text.rich(
                  TextSpan(
                    text: completedQuestions.toString(),
                    style: AppTextStyles.body11,
                    children: [
                      TextSpan(
                        text: " de ",
                      ),
                      TextSpan(
                        text: totalQuestions.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(
                  value: percent,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
