import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'todo_list_service.dart';
import 'TodoItem.dart';

@Component(
  selector: 'todo-list',
  styleUrls: const ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: const [
    CORE_DIRECTIVES,
    materialDirectives,
  ],
  providers: const [TodoListService],
  // (from: https://webdev.dartlang.org/angular/guide/pipes)
  pipes: const [COMMON_PIPES],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  List<TodoItem> items = [];
  String newTodo = '';
  String searchKeyword = '';

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
  }

  List<TodoItem> getItems() {
    if (searchKeyword == "") {
      return items;
    } else {
      return
        items
          .where((item) =>
            item.name.toLowerCase().contains(searchKeyword.toLowerCase())
          )
          .toList();
    }
  }

  void add() {
    items.add(new TodoItem(
      newTodo,
      new DateTime.now()
    ));
    newTodo = '';
  }

  TodoItem remove(int index) => items.removeAt(index);
  void onReorder(ReorderEvent e) =>
      items.insert(e.destIndex, items.removeAt(e.sourceIndex));
}
