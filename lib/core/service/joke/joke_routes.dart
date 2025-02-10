enum JokeRoutes {
  joke,
  categories,
}

extension JokeRoutesExtension on JokeRoutes {
  String path({String? category}) {
    switch (this) {
      case JokeRoutes.joke:
        return '/joke/$category';
      case JokeRoutes.categories:
        return '/categories';
    }
  }
}
