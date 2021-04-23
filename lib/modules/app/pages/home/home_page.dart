import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/modules/app/pages/challenge/challenge_page.dart';
import 'package:DevQuiz/modules/app/pages/challenge/widgets/quiz/quiz_widget.dart';
import 'home_controller.dart';
import 'home_state.dart';
import 'package:DevQuiz/modules/app/pages/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/modules/app/pages/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/modules/app/pages/home/widgets/quizCard/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(
            user: controller.user!,
          ),
          body: Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                      style: "easy",
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                      style: "mid",
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                      style: "hard",
                    ),
                    LevelButtonWidget(
                      label: "Perito",
                      style: "expert",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: controller.quizes!
                        .map((e) => QuizCardWidget(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChallengePage(questions: e.questions),
                                    ));
                              },
                              title: e.title,
                              percent:
                                  (e.questionAnswered / e.questions.length),
                              totalQuestions: e.questions.length,
                              completedQuestions: e.questionAnswered,
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ));
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
