import 'package:flutter_test/flutter_test.dart';
import 'package:persone/features/todo/domain/entities/todo.dart';
import 'package:persone/features/todo/domain/repositories/todo_repository.dart';
import 'package:persone/features/todo/domain/usecases/get_todos.dart';

class FakeTodoRepository implements TodoRepository {
  final List<Todo> todos = [];

  @override
  Future<void> addTodo(Todo todo) async {
    todos.add(todo);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return todos;
  }

  @override
  Future<void> toggleTodo(String id) async {}
}

void main() {
  test('should return todos from repository', () async {
    // Arrange
    final repository = FakeTodoRepository();
    final getTodos = GetTodos(repository);

    final todo = Todo(
      id: '1',
      title: 'Test Task',
      category: 'Work',
    );

    await repository.addTodo(todo);

    // Act
    final result = await getTodos();

    // Assert
    expect(result.length, 1);
    expect(result.first.title, 'Test Task');
  });
}
