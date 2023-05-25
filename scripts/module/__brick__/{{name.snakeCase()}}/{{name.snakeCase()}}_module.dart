import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../../core/rest_client/dio/dio_rest_client.dart';
import 'domain/usecase/{{name.snakeCase()}}_get_all_usecase_impl.dart';

import 'external/{{name.snakeCase()}}_datasource_impl.dart';
import 'infra/repository/{{name.snakeCase()}}_repository_impl.dart';
import 'presenter/bloc/{{name.snakeCase()}}_bloc.dart';
import 'presenter/page/{{name.snakeCase()}}_page.dart';

class {{name.pascalCase()}}Module extends Module {
  @override
  List<Bind> get binds => [
  Bind.lazySingleton((i) => DioRestClient(dio: Dio())),
  Bind.lazySingleton((i) => {{name.pascalCase()}}DatasourceImpl(restClient: i())),
  Bind.lazySingleton((i) => {{name.pascalCase()}}RepositoryImpl( i())),
  Bind.lazySingleton((i) => {{name.pascalCase()}}GetAllUsecaseImpl( repository: i())),


  Bind.lazySingleton((i) => {{name.pascalCase()}}Bloc({{name.camelCase()}}GetAllUsecase:i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => {{name.pascalCase()}}Page(bloc: Modular.get<{{name.pascalCase()}}Bloc>(),

                ))
      ];
}
