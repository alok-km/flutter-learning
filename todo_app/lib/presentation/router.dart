import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/data/repository.dart';
import 'package:todo_app/presentation/screens/add_todo_screen.dart';
import 'package:todo_app/presentation/screens/edit_todo_screen.dart';
import 'package:todo_app/presentation/screens/todos_screen.dart';

class AppRouter {

  Repository repository;

  AppRouter() {
    repository = Repository();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => TodosCubit(),
                child: TodosScreen()));
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => AddTodoScren());
      default:
        return null;
    }
  }
}