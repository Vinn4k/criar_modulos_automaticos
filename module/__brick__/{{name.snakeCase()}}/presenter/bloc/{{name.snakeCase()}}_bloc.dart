


import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/{{name.snakeCase()}}_get_all_usecase.dart';

import '{{name.snakeCase()}}_event.dart';
import '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc({required this.{{name.camelCase()}}GetAllUsecase}) : super({{name.pascalCase()}}State().init()) {
    on<InitEvent>(_init);
  }
  final {{name.pascalCase()}}GetAllUsecase {{name.camelCase()}}GetAllUsecase ;
  void _init(InitEvent event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(state.clone());
  }
}
