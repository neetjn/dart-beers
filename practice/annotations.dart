// must import mirrors to reflect class metadata
import 'dart:mirrors';

const DEBUG = true;

void Log(String msg) {
  if (DEBUG) {
    print('DEBUG: ${msg}');
  }
}

/// Custom exception for theoretical database relation issues.
class DatabaseException implements Exception {
  String cause;
  DatabaseException(this.cause) {
    Log('EXCEPTION: ${this.cause}');
  }
}

/// Definition for our database table metadata.
/// Will define a table name to map object to database.
///   @Table('people')
class Table {
  final String name;

  const Table({this.name});
}

/// Definition for our database field metadata.
/// Will define a column to map object field to.
///   @Field('name')
///   String name;
class Field {
  final String name;

  const Field({this.name});
}

/// Theoretical database connection with a container.
/// Designed as a simpleton for simplicity.
///   DatabaseConnection db = new DatabaseConnection();
///   db.containers['users'] = [];
class DatabaseConnection {
  static final DatabaseConnection _database_connection = new DatabaseConnection._internal();
  Map container;

  factory DatabaseConnection() {
    return _database_connection;
  }

  DatabaseConnection._internal() {
    this.container = new Map();
    Log('New database connection established.');
  }
}

/// Theoretical database table struct.
/// Designed for interfacing a relational database table.
///   DatabaseTable table = new DatabaseTable.fromDAO(Person);
class DatabaseTable {
  static final ClassMirror typeRef = reflectClass(DAO);

  String name;
  List<Map> data;

  DatabaseTable.fromDAO(var instance) {
    ClassMirror dao = reflectClass(instance);
    if (dao.isSubclassOf(DatabaseTable.typeRef)) {
      List<InstanceMirror> metadata = dao.metadata;
      try {
        var field = metadata.singleWhere((cls) => cls.type.reflectedType == Table);
        String tableName = field.getField(#name).reflectee;
        if (DAO.db.container[tableName].runtimeType == Null) {
          DAO.db.container[tableName] = new List<Map>();
          Log('Table for "${tableName}" was not found and created.');
          this.name = tableName;
          this.data = DAO.db.container[tableName];
        }
      } catch (StateError) {
        throw DatabaseException('DAO for class ${dao.reflectedType.runtimeType} does not define a table.');
      }
    } else {
      throw DatabaseException('Provided model is not a child of DAO.');
    }
  }
}

/// Definition for our data access objects.
/// Will provide a simulated interface for interacting with database.
///   @Table('people')
///   class Foo extends DAO;
class DAO {
  static final DatabaseConnection db = new DatabaseConnection();

  DatabaseTable table;
  Map model;
  bool debug = false;

  Lookup(List<Map> data) {
    return null;
  }

  DAO([this.debug]) {
    this.table = DatabaseTable.fromDAO(this.runtimeType);
    this.model = Lookup(this.table.data);
    Log('Table "${this.table.name}" found with "${this.table.data.length}" entries.');
  }

  saveModel() {
    Log('Attempting to save model, not yet implemented.');
    if (this.model != null) {
      // save existing model using given fields
    } else {
      // insert new map (column) into table
      // would need to map annotation field names
    }
  }

  /// Find all database entries related to model.
  /// Using the provided DAO, query for entries.
  ///   List<dynamic> people = DAO.query(People, {field: 'foobar'});
  static List<dynamic> query(var model, Map query) {
    DatabaseTable table = new DatabaseTable.fromDAO(model);
    // stubbed -- would ideally return a valid search and map to models
    return table.data;
  }
}

@Table(name: 'people')
class Person extends DAO {
  @Field(name: '_id')
  String id;
  @Field(name: 'name')
  String name;
  @Field(name: 'age')
  int age;

  Map model;

  @override
  Lookup(List<Map> data) {
    return data.singleWhere((column) => column['_id'] == this.id);
  }

  Person({this.id, this.name, this.age}) : super(DEBUG) {
    if (this.id == null)
      this.id = DateTime.now().millisecondsSinceEpoch.toString();
    Log('Person "${this.name}" created');
  }
}

void main() {
  Person person = new Person(name: 'Joe');
  // List<dynamic> people = DAO.query(Person, {});
  // person = people[0];
  // person.age = 5;
  // person.saveModel();
}
