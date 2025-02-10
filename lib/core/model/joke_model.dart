import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_model.g.dart';

@JsonSerializable()
final class JokeModel extends Equatable {
  final bool? error;
  final String? category;
  final String? type;
  final String? setup;
  final String? delivery;
  final String? joke;
  final Flags? flags;
  final bool? safe;
  final int? id;
  final String? lang;

  factory JokeModel.fromJson(Map<String, dynamic> json) => _$JokeModelFromJson(json);

  Map<String, dynamic> toJson() => _$JokeModelToJson(this);

  const JokeModel({
    this.error,
    this.category,
    this.type,
    this.setup,
    this.delivery,
    this.joke,
    this.flags,
    this.safe,
    this.id,
    this.lang,
  });

  @override
  List<Object?> get props => [
        error,
        category,
        type,
        setup,
        delivery,
        joke,
        flags,
        safe,
        id,
        lang,
      ];
}

@immutable
@JsonSerializable()
final class Flags extends Equatable {
  final bool? nsfw;
  final bool? religious;
  final bool? political;
  final bool? racist;
  final bool? sexist;
  final bool? explicit;

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);

  Map<String, dynamic> toJson() => _$FlagsToJson(this);

  const Flags({
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
  });

  @override
  List<Object?> get props => [
        nsfw,
        religious,
        political,
        racist,
        sexist,
        explicit,
      ];
}
