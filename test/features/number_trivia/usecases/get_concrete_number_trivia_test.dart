import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_clean_architecture_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_tdd_clean_architecture_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_tdd_clean_architecture_course/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia getConcreteNumberTrivia;
  MockNumberTriviaRepository numberTriviaRepository;

  setUp(() {
    numberTriviaRepository = MockNumberTriviaRepository();
    getConcreteNumberTrivia = GetConcreteNumberTrivia(numberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'text');

  test('should get trivia for the number from the repository', () async {
    when(numberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) => Future.value(Right(tNumberTrivia)));

    final result = await getConcreteNumberTrivia(Params(number: tNumber));

    expect(result, Right(tNumberTrivia));
  });
}
