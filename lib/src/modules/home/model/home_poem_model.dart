// File: /home/shadman/Codes/basic_structure/lib/src/modules/home/model/home_poem_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_poem_model.freezed.dart'; // Changed this line
part 'home_poem_model.g.dart';

@freezed
class PoemModel with _$PoemModel {
  const factory PoemModel({
    required List<String> lines,
  }) = _PoemModel;

  factory PoemModel.fromJson(Map<String, dynamic> json) =>
      _$PoemModelFromJson(json);
}
