import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/{{name.snakeCase()}}_bloc.dart';
import '../bloc/{{name.snakeCase()}}_event.dart';
import '../bloc/{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
final {{name.pascalCase()}}Bloc bloc;

const {{name.pascalCase()}}Page({super.key, required this.bloc});
@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<{{name.pascalCase()}}Bloc>(context);

    return Scaffold(
  appBar: AppBar(
  title: const Text('{{name.titleCase()}}'),
     ),
  body: BlocBuilder<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
  builder: (context, state) {
  return Container();
  },
  ),
  );
  }
}

