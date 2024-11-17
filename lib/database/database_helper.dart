import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'innovaTech.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Tabla para usuarios
        await db.execute('''
          CREATE TABLE usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            correo TEXT NOT NULL UNIQUE,
            contrasena TEXT NOT NULL
          )
        ''');

        // Tabla para productos
        await db.execute('''
          CREATE TABLE productos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            descripcion TEXT NOT NULL,
            precio REAL NOT NULL,
            imagen TEXT NOT NULL
          )
        ''');

        // Tabla para facturas
        await db.execute('''
          CREATE TABLE facturas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            cliente_id INTEGER NOT NULL,
            total REAL NOT NULL,
            fecha TEXT NOT NULL,
            FOREIGN KEY (cliente_id) REFERENCES usuarios (id)
          )
        ''');

        // Tabla para los detalles de las facturas
        await db.execute('''
          CREATE TABLE detalle_factura (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            factura_id INTEGER NOT NULL,
            producto_id INTEGER NOT NULL,
            cantidad INTEGER NOT NULL,
            precio_unitario REAL NOT NULL,
            FOREIGN KEY (factura_id) REFERENCES facturas (id),
            FOREIGN KEY (producto_id) REFERENCES productos (id)
          )
        ''');
      },
    );
  }

  // Registro de usuario
  Future<int> registerUser(Map<String, dynamic> user) async {
    try {
      final db = await database;
      return await db.insert('usuarios', user);
    } catch (e) {
      print('Error al registrar usuario: $e');
      rethrow;
    }
  }

  // Inicio de sesión
  Future<Map<String, dynamic>?> loginUser(String correo, String contrasena) async {
    final db = await database;
    final result = await db.query(
      'usuarios',
      where: 'correo = ? AND contrasena = ?',
      whereArgs: [correo, contrasena],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // Insertar producto
  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await database;
    return await db.insert('productos', product);
  }

  // Obtener lista de productos
  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    return await db.query('productos');
  }

  // Insertar factura
  Future<int> insertFactura(Map<String, dynamic> factura) async {
    final db = await database;
    return await db.insert('facturas', factura);
  }

  // Insertar detalle de factura
  Future<int> insertDetalleFactura(Map<String, dynamic> detalle) async {
    final db = await database;
    return await db.insert('detalle_factura', detalle);
  }

  // Obtener lista de facturas
  Future<List<Map<String, dynamic>>> getFacturas() async {
    final db = await database;
    return await db.query('facturas');
  }

  // Obtener detalles de una factura
  Future<List<Map<String, dynamic>>> getDetalleFactura(int facturaId) async {
    final db = await database;
    return await db.query(
      'detalle_factura',
      where: 'factura_id = ?',
      whereArgs: [facturaId],
    );
  }

  // Actualizar producto
  Future<int> updateProduct(int id, Map<String, dynamic> product) async {
    final db = await database;
    return await db.update(
      'productos',
      product,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Eliminar producto
  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete(
      'productos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Eliminar factura
  Future<int> deleteFactura(int id) async {
    final db = await database;
    return await db.delete(
      'facturas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
