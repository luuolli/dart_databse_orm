import 'eloquent/eloquent.dart';

void main(List<String> arguments) {
  final table = TablePessoa(id: 1);
  table.insert(fields: {
    'name': 'Lucas',
    'age': 23,
  });

  table.update(fields: {
    'name': 'Lucas',
    'age': 26,
  });

  table.find(1, columns: ['name', 'age']);
  table.all(columns: ['name', 'age']);
}

class TablePessoa<E> extends ITableModel<E> {
  final int? _id;

  @override
  int? get id => _id;

  TablePessoa({int? id}) : _id = id;

  @override
  String get tableName => 'peoples';
}
