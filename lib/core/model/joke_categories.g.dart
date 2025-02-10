// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeCategories _$JokeCategoriesFromJson(Map<String, dynamic> json) =>
    JokeCategories(
      error: json['error'] as bool?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categoryAliases: (json['categoryAliases'] as List<dynamic>?)
          ?.map((e) => CategoryAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JokeCategoriesToJson(JokeCategories instance) =>
    <String, dynamic>{
      'error': instance.error,
      'categories': instance.categories,
      'categoryAliases': instance.categoryAliases,
      'timestamp': instance.timestamp,
    };

CategoryAlias _$CategoryAliasFromJson(Map<String, dynamic> json) =>
    CategoryAlias(
      alias: json['alias'] as String?,
      resolved: json['resolved'] as String?,
    );

Map<String, dynamic> _$CategoryAliasToJson(CategoryAlias instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'resolved': instance.resolved,
    };
