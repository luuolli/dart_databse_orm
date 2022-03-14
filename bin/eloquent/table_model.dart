abstract class ITableModel<E> {
  String get tableName;

  String get primary => 'id';

  int? get id;

  E? find(int id, {List<String>? columns}) {
    final query =
        '''SELECT ${columns == null ? '*' : columns.join(',')} FROM $tableName WHERE id = $id;''';
    print(query);
    return null;
  }

  void insert({required Map<String, dynamic> fields}) {
    final columns = _columnsFromFields(fields);
    final values = _getValuesFromFields(fields);

    final query = '''INSERT INTO $tableName $columns VALUES $values;''';
    print(query);
  }

  void update({required Map<String, dynamic> fields}) {
    final columns = fields.keys.toList();
    final values = _getValuesFromFields(fields).toList();
    final set = Iterable.generate(columns.length, (int index) {
      return '''${columns[index]} = ${values[index]}''';
    }).join(',');
    final query = '''UPDATE $tableName SET $set WHERE id = $id;''';
    print(query);
  }

  Iterable<String> _columnsFromFields(Map<String, dynamic> fields) {
    return fields.keys;
  }

  Iterable<dynamic> _getValuesFromFields(Map<String, dynamic> fields) {
    return fields.values.map((value) => value is String ? "'$value'" : value);
  }
}
