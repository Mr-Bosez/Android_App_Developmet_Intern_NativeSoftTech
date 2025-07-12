import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_item_model.freezed.dart';

@freezed
abstract class AddItemState with _$AddItemState {
  const factory AddItemState({
    String? imagePath,
    @Default(false) bool isLoading,
    String? selectedCategory,
    @Default([]) List<String> categories,
    @Default([]) List<String> sizes,
    @Default([]) List<String> colors,
    @Default(false) bool ? isDiscounted,
    String? discountPercentage,
  }) = _AddItemState;
}
