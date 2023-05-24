import 'package:app_usuario_cooper/app/modules/home/domain/entity/cards_entity.dart';
import 'package:dart_either/dart_either.dart';
import '../../../../core/shared/exception/app_exception.dart';
import '../entity/{{name.snakeCase()}}_entity.dart';


abstract interface class {{name.pascalCase()}}GetAllUsecase {
  Future<Either<AppException, {{name.pascalCase()}}Entity>> call();
}
