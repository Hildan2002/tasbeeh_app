// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ActivityTableTable extends ActivityTable
    with TableInfo<$ActivityTableTable, ActivityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentValueMeta = const VerificationMeta(
    'currentValue',
  );
  @override
  late final GeneratedColumn<int> currentValue = GeneratedColumn<int>(
    'current_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reminderMeta = const VerificationMeta(
    'reminder',
  );
  @override
  late final GeneratedColumn<int> reminder = GeneratedColumn<int>(
    'reminder',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetValueMeta = const VerificationMeta(
    'targetValue',
  );
  @override
  late final GeneratedColumn<int> targetValue = GeneratedColumn<int>(
    'target_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    currentValue,
    reminder,
    targetValue,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('current_value')) {
      context.handle(
        _currentValueMeta,
        currentValue.isAcceptableOrUnknown(
          data['current_value']!,
          _currentValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentValueMeta);
    }
    if (data.containsKey('reminder')) {
      context.handle(
        _reminderMeta,
        reminder.isAcceptableOrUnknown(data['reminder']!, _reminderMeta),
      );
    }
    if (data.containsKey('target_value')) {
      context.handle(
        _targetValueMeta,
        targetValue.isAcceptableOrUnknown(
          data['target_value']!,
          _targetValueMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      currentValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_value'],
      )!,
      reminder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder'],
      ),
      targetValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_value'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $ActivityTableTable createAlias(String alias) {
    return $ActivityTableTable(attachedDatabase, alias);
  }
}

class ActivityTableData extends DataClass
    implements Insertable<ActivityTableData> {
  final int id;
  final String title;
  final int currentValue;
  final int? reminder;
  final int? targetValue;
  final String? note;
  const ActivityTableData({
    required this.id,
    required this.title,
    required this.currentValue,
    this.reminder,
    this.targetValue,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['current_value'] = Variable<int>(currentValue);
    if (!nullToAbsent || reminder != null) {
      map['reminder'] = Variable<int>(reminder);
    }
    if (!nullToAbsent || targetValue != null) {
      map['target_value'] = Variable<int>(targetValue);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ActivityTableCompanion toCompanion(bool nullToAbsent) {
    return ActivityTableCompanion(
      id: Value(id),
      title: Value(title),
      currentValue: Value(currentValue),
      reminder: reminder == null && nullToAbsent
          ? const Value.absent()
          : Value(reminder),
      targetValue: targetValue == null && nullToAbsent
          ? const Value.absent()
          : Value(targetValue),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory ActivityTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      currentValue: serializer.fromJson<int>(json['currentValue']),
      reminder: serializer.fromJson<int?>(json['reminder']),
      targetValue: serializer.fromJson<int?>(json['targetValue']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'currentValue': serializer.toJson<int>(currentValue),
      'reminder': serializer.toJson<int?>(reminder),
      'targetValue': serializer.toJson<int?>(targetValue),
      'note': serializer.toJson<String?>(note),
    };
  }

  ActivityTableData copyWith({
    int? id,
    String? title,
    int? currentValue,
    Value<int?> reminder = const Value.absent(),
    Value<int?> targetValue = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => ActivityTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    currentValue: currentValue ?? this.currentValue,
    reminder: reminder.present ? reminder.value : this.reminder,
    targetValue: targetValue.present ? targetValue.value : this.targetValue,
    note: note.present ? note.value : this.note,
  );
  ActivityTableData copyWithCompanion(ActivityTableCompanion data) {
    return ActivityTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      currentValue: data.currentValue.present
          ? data.currentValue.value
          : this.currentValue,
      reminder: data.reminder.present ? data.reminder.value : this.reminder,
      targetValue: data.targetValue.present
          ? data.targetValue.value
          : this.targetValue,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('currentValue: $currentValue, ')
          ..write('reminder: $reminder, ')
          ..write('targetValue: $targetValue, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, currentValue, reminder, targetValue, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.currentValue == this.currentValue &&
          other.reminder == this.reminder &&
          other.targetValue == this.targetValue &&
          other.note == this.note);
}

class ActivityTableCompanion extends UpdateCompanion<ActivityTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> currentValue;
  final Value<int?> reminder;
  final Value<int?> targetValue;
  final Value<String?> note;
  const ActivityTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.reminder = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.note = const Value.absent(),
  });
  ActivityTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int currentValue,
    this.reminder = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.note = const Value.absent(),
  }) : title = Value(title),
       currentValue = Value(currentValue);
  static Insertable<ActivityTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? currentValue,
    Expression<int>? reminder,
    Expression<int>? targetValue,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (currentValue != null) 'current_value': currentValue,
      if (reminder != null) 'reminder': reminder,
      if (targetValue != null) 'target_value': targetValue,
      if (note != null) 'note': note,
    });
  }

  ActivityTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<int>? currentValue,
    Value<int?>? reminder,
    Value<int?>? targetValue,
    Value<String?>? note,
  }) {
    return ActivityTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      currentValue: currentValue ?? this.currentValue,
      reminder: reminder ?? this.reminder,
      targetValue: targetValue ?? this.targetValue,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (currentValue.present) {
      map['current_value'] = Variable<int>(currentValue.value);
    }
    if (reminder.present) {
      map['reminder'] = Variable<int>(reminder.value);
    }
    if (targetValue.present) {
      map['target_value'] = Variable<int>(targetValue.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('currentValue: $currentValue, ')
          ..write('reminder: $reminder, ')
          ..write('targetValue: $targetValue, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ActivityTableTable activityTable = $ActivityTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [activityTable];
}

typedef $$ActivityTableTableCreateCompanionBuilder =
    ActivityTableCompanion Function({
      Value<int> id,
      required String title,
      required int currentValue,
      Value<int?> reminder,
      Value<int?> targetValue,
      Value<String?> note,
    });
typedef $$ActivityTableTableUpdateCompanionBuilder =
    ActivityTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<int> currentValue,
      Value<int?> reminder,
      Value<int?> targetValue,
      Value<String?> note,
    });

class $$ActivityTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityTableTable> {
  $$ActivityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminder => $composableBuilder(
    column: $table.reminder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivityTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityTableTable> {
  $$ActivityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminder => $composableBuilder(
    column: $table.reminder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityTableTable> {
  $$ActivityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reminder =>
      $composableBuilder(column: $table.reminder, builder: (column) => column);

  GeneratedColumn<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$ActivityTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityTableTable,
          ActivityTableData,
          $$ActivityTableTableFilterComposer,
          $$ActivityTableTableOrderingComposer,
          $$ActivityTableTableAnnotationComposer,
          $$ActivityTableTableCreateCompanionBuilder,
          $$ActivityTableTableUpdateCompanionBuilder,
          (
            ActivityTableData,
            BaseReferences<
              _$AppDatabase,
              $ActivityTableTable,
              ActivityTableData
            >,
          ),
          ActivityTableData,
          PrefetchHooks Function()
        > {
  $$ActivityTableTableTableManager(_$AppDatabase db, $ActivityTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> currentValue = const Value.absent(),
                Value<int?> reminder = const Value.absent(),
                Value<int?> targetValue = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ActivityTableCompanion(
                id: id,
                title: title,
                currentValue: currentValue,
                reminder: reminder,
                targetValue: targetValue,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required int currentValue,
                Value<int?> reminder = const Value.absent(),
                Value<int?> targetValue = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ActivityTableCompanion.insert(
                id: id,
                title: title,
                currentValue: currentValue,
                reminder: reminder,
                targetValue: targetValue,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityTableTable,
      ActivityTableData,
      $$ActivityTableTableFilterComposer,
      $$ActivityTableTableOrderingComposer,
      $$ActivityTableTableAnnotationComposer,
      $$ActivityTableTableCreateCompanionBuilder,
      $$ActivityTableTableUpdateCompanionBuilder,
      (
        ActivityTableData,
        BaseReferences<_$AppDatabase, $ActivityTableTable, ActivityTableData>,
      ),
      ActivityTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ActivityTableTableTableManager get activityTable =>
      $$ActivityTableTableTableManager(_db, _db.activityTable);
}
