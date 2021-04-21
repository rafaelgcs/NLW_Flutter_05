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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
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
                  children: [
                    QuizCardWidget(),
                    QuizCardWidget(),
                    QuizCardWidget(),
                    QuizCardWidget(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
