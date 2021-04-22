import 'package:DevQuiz/modules/app/pages/home/home_state.dart';
import 'package:DevQuiz/modules/app/repositories/home_repository.dart';
import 'package:DevQuiz/modules/shared/models/answer_model.dart';
import 'package:DevQuiz/modules/shared/models/question_model.dart';
import 'package:DevQuiz/modules/shared/models/quiz_model.dart';
import 'package:DevQuiz/modules/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizes() async {
    state = HomeState.loading;
    quizes = await repository.getQuizes();
    state = HomeState.success;
  }
}
