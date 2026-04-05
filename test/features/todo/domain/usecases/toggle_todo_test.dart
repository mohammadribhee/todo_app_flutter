import 'package:flutter_test/flutter_test.dart';
import 'package:persone/features/todo/domain/entities/todo.dart';
import 'package:persone/features/todo/domain/repositories/todo_repository.dart';
import 'package:persone/features/todo/domain/usecases/toggle_todo.dart';

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
  Future<void> toggleTodo(String id) async {
    final index = todos.indexWhere((t) => t.id == id);

    if (index != -1) {
      final current = todos[index];

      todos[index] = Todo(
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

void main() {
  test('should turn off/on state from repository', () async {
    // Arrange
    final repository = FakeTodoRepository();
    final toggleTodo = ToggleTodo(repository);

    final todo = Todo(
      id: '1',
      title: 'Test Task',
      category: 'Work',
      isCompleted: false,
    );

    await repository.addTodo(todo);

    // Act
    await toggleTodo('1');

    // Assert
    final result = await repository.getTodos();

    expect(result.first.isCompleted, true);
  });
}
