import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Succuss<T>;
  const factory ApiResult.failure(ApiErrorModel error) = Failure<T>;
}
