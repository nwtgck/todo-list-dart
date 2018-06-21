class TodoItem {
  final String name;
  final DateTime createdAt;
  bool isFinished;

  // (from: https://dev.classmethod.jp/client-side/about_dart_constructors/)
  TodoItem(this.name, this.createdAt, this.isFinished);
}
