import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_clean_architecture_course/core/usecases/use_case.dart';
import 'package:flutter_tdd_clean_architecture_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_tdd_clean_architecture_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_tdd_clean_architecture_course/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia getRandomNumberTrivia;
  MockNumberTriviaRepository numberTriviaRepository;

  setUp(() {
    numberTriviaRepository = MockNumberTriviaRepository();
    getRandomNumberTrivia = GetRandomNumberTrivia(numberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'text');

  test('should get trivia for random number from the repository', () async {
    when(numberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) => Future.value(Right(tNumberTrivia)));

    final result = await getRandomNumberTrivia(NoParams());

    expect(result, Right(tNumberTrivia));
  });
}
