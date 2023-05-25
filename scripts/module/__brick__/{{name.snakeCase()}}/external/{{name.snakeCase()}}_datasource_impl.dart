
import 'package:dart_either/dart_either.dart';

import '../../../core/shared/exception/app_exception.dart';
import '../../../core/rest_client/rest_client.dart';

import '../domain/entity/{{name.snakeCase()}}_entity.dart';
import '../infra/datasource/{{name.snakeCase()}}_datasource.dart';


class {{name.pascalCase()}}DatasourceImpl implements {{name.pascalCase()}}Datasource{
final RestClient restClient;

{{name.pascalCase()}}DatasourceImpl({required this.restClient});

  @override
  Future<Either<AppException, {{name.pascalCase()}}Entity>> getAll() async {
  // TODO: implement getAll
  throw UnimplementedError();
  }
}
