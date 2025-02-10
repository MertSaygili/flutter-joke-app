import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_flutter_app/core/service/joke/i_joke_service.dart';
import 'package:joke_flutter_app/core/service/joke/joke_service.dart';
import 'package:joke_flutter_app/feature/joke/view_model/joke_state.dart';

final jokeNotifierProvider = StateNotifierProvider<JokeNotifier, JokeState>(
  (ref) => JokeNotifier(ref, jokeService: JokeService()),
);

class JokeNotifier extends StateNotifier<JokeState> {
  JokeNotifier(this.ref, {required this.jokeService}) : super(JokeState());

  final Ref ref;
  final IJokeService jokeService;

  Future<void> getCategories() async {
    final categories = await jokeService.getCategories();
    state = state.copyWith(categories: categories);
  }

  Future<void> createJoke(String? category) async {
    final joke = await jokeService.getJoke(category: category?.isEmpty ?? true ? 'Any' : category!);
    state = state.copyWith(joke: joke);
  }
}
