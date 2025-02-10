import 'package:joke_flutter_app/core/model/joke_categories.dart';
import 'package:joke_flutter_app/core/model/joke_model.dart';

abstract class IJokeService {
  Future<JokeModel?> getJoke({required String category});
  Future<JokeCategories?> getCategories();
}
