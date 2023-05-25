


import '../../../../core/shared/exception/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import '../entity/{{name.snakeCase()}}_entity.dart';


abstract interface class {{name.pascalCase()}}Repository{
  Future<Either<AppException, {{name.pascalCase()}}Entity>> getAll();

}
