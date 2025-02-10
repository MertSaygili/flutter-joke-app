import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_categories.g.dart';

@JsonSerializable()
final class JokeCategories extends Equatable {
  final bool? error;
  final List<String>? categories;
  final List<CategoryAlias>? categoryAliases;
  final int? timestamp;

  factory JokeCategories.fromJson(Map<String, dynamic> json) => _$JokeCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$JokeCategoriesToJson(this);

  const JokeCategories({
    required this.error,
    required this.categories,
    required this.categoryAliases,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [error, categories, categoryAliases, timestamp];
}

@JsonSerializable()
final class CategoryAlias extends Equatable {
  final String? alias;
  final String? resolved;

  factory CategoryAlias.fromJson(Map<String, dynamic> json) => _$CategoryAliasFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryAliasToJson(this);

  const CategoryAlias({
    required this.alias,
    required this.resolved,
  });

  @override
  List<Object?> get props => [alias, resolved];
}
