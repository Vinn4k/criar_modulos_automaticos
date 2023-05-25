


import '../../../../core/shared/exception/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import '../../domain/entity/{{name.snakeCase()}}_entity.dart';


abstract interface class {{name.pascalCase()}}Datasource{
  Future<Either<AppException, {{name.pascalCase()}}Entity>> getAll();

}
