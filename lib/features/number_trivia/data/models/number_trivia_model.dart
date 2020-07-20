import 'package:flutter/foundation.dart';
import 'package:flutter_tdd_clean_architecture_course/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {

  NumberTriviaModel({@required int number, @required String text}): super(number: number, text: text);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> jsonMap) => NumberTriviaModel(text: jsonMap['text'], number: jsonMap['number']);
}