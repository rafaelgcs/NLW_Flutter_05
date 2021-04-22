import 'dart:convert';

import 'package:DevQuiz/modules/shared/models/question_model.dart';

enum Level { easy, mid, hard, expert }

extension LevenStringExt on String {
  Level get levelParse => {
        "easy": Level.easy,
        "mid": Level.mid,
        "hard": Level.hard,
        "expert": Level.expert
      }[this]!;
}

extension LeveExt on Level {
  String get parse => {
        Level.easy: "easy",
        Level.mid: "mid",
        Level.hard: "hard",
        Level.expert: "expert"
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().levelParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
