import 'dart:async';

import 'package:angular/core.dart';

import 'TodoItem.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<TodoItem> mockTodoList = <TodoItem>[];

  Future<List<TodoItem>> getTodoList() async => mockTodoList;
}
