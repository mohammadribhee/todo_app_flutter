import '../entities/todo.dart';

abstract class TodoRepository {
  Future<void> addTodo(Todo todo);
}
