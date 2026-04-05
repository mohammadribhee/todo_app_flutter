import 'package:persone/features/todo/data/datasources/todo_local_data_source.dart';
import 'package:persone/features/todo/data/models/todo_model.dart';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final List<TodoModel> todos = [];

  @override
  Future<void> addTodo(TodoModel todo) async {
    todos.add(todo);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    return todos;
  }

  @override
  Future<void> toggleTodo(String id) async {
    final index = todos.indexWhere((t) => t.id == id);

    if (index != -1) {
      final current = todos[index];

      todos[index] = TodoModel(
        id: current.id,
        title: current.title,
        description: current.description,
        dueDate: current.dueDate,
        isCompleted: !current.isCompleted,
        category: current.category,
      );
    }
  }
}
