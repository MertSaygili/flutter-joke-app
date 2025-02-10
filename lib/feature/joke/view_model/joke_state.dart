import 'package:equatable/equatable.dart';
import 'package:joke_flutter_app/core/model/joke_categories.dart';
import 'package:joke_flutter_app/core/model/joke_model.dart';

class JokeState extends Equatable {
  final JokeModel? joke;
  final JokeCategories? categories;

  const JokeState({
    this.categories,
    this.joke,
  });

  JokeState copyWith({
    JokeModel? joke,
    JokeCategories? categories,
  }) {
    return JokeState(
      joke: joke ?? this.joke,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
        categories,
        joke,
      ];
}
