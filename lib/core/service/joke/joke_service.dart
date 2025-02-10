import 'package:joke_flutter_app/core/model/joke_categories.dart';
import 'package:joke_flutter_app/core/model/joke_model.dart';
import 'package:joke_flutter_app/core/service/joke/i_joke_service.dart';
import 'package:joke_flutter_app/core/service/joke/joke_routes.dart';
import 'package:joke_flutter_app/core/service/service_manager.dart';

class JokeService extends IJokeService {
  @override
  Future<JokeModel?> getJoke({required String category}) async {
    final response = await ServiceManager.instance.get(
      JokeRoutes.joke.path(category: category),
    );

    if (response.data != null) {
      return JokeModel.fromJson(response.data!);
    }
    return null;
  }

  @override
  Future<JokeCategories?> getCategories() async {
    final response = await ServiceManager.instance.get(
      JokeRoutes.categories.path(),
    );

    if (response.data != null) {
      return JokeCategories.fromJson(response.data!);
    }
    return null;
  }
}
