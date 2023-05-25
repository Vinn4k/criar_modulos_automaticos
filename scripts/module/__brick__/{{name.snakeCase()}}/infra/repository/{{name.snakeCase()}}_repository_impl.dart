

import 'package:dart_either/dart_either.dart';

import '../../../../core/shared/exception/app_exception.dart';
import '../datasource/{{name.snakeCase()}}_datasource.dart';
import '../../domain/entity/{{name.snakeCase()}}_entity.dart';

import '../../domain/repository/{{name.snakeCase()}}_repository.dart';


class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository{
final {{name.pascalCase()}}Datasource datasource;

{{name.pascalCase()}}RepositoryImpl(this.datasource);

    @override
    Future<Either<AppException, {{name.pascalCase()}}Entity>> getAll() async {
        return datasource.getAll();
        }

}