import 'package:dart_either/dart_either.dart';


import '../../../../core/shared/exception/app_exception.dart';
import '{{name.snakeCase()}}_get_all_usecase.dart';
import '../entity/{{name.snakeCase()}}_entity.dart';
import '../repository/{{name.snakeCase()}}_repository.dart';


class {{name.pascalCase()}}GetAllUsecaseImpl implements {{name.pascalCase()}}GetAllUsecase {
  final {{name.pascalCase()}}Repository repository;

{{name.pascalCase()}}GetAllUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, {{name.pascalCase()}}Entity>> call()  {
    return  repository.getAll();
  }
}
