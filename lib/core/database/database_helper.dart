import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? db;

  Future<void> initDb() async {
    if (db != null) {
      return;
    }

    db = await openDatabase(
      join(await getDatabasesPath(), "myDb.db"),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE PRODUCTS(
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT NOT NULL,
            QUANTITY INTEGER NOT NULL,
            PRICE INTEGER NOT NULL,
            BARCODE TEXT NOT NULL
          )
        ''');

        await db.execute('''
  CREATE TABLE SUPPLIERS(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    NAME TEXT NOT NULL,
    PHONE TEXT NOT NULL
  )
''');

        await db.execute('''
  CREATE TABLE CUSTOMERS(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    NAME TEXT NOT NULL,
    PHONE TEXT NOT NULL
  )
''');

        await db.execute('''
  CREATE TABLE SALES(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    CUSTOMER_ID INTEGER,
    TOTAL_AMOUNT INTEGER NOT NULL,
    DATE TEXT NOT NULL
  )
''');

        await db.execute('''
  CREATE TABLE STOCK_MOVEMENTS(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    PRODUCT_ID INTEGER NOT NULL,
    SUPPLIER_ID INTEGER,
    CUSTOMER_ID INTEGER,
    QUANTITY INTEGER NOT NULL,
    PRICE INTEGER NOT NULL,
    TYPE TEXT NOT NULL,
    DATE TEXT NOT NULL
  )
''');
      },
    );
  }

  Future<List<Map<String,dynamic>>> getProductDb() async{
    await initDb();
    return await db!.query("PRODUCTS");
  }

  Future<List<Map<String,dynamic>>> getCustomersDb() async{
    await initDb();
    return await db!.query("CUSTOMERS");
  }

  Future<void> addProductDb(String n,int q,int p,String b) async{
    await initDb();
    await db!.insert("PRODUCTS", {
      "NAME":n,
      "QUANTITY":q,
      "PRICE":p,
      "BARCODE":b,
    });
  }

  Future<void> deleteProductDb(int id) async {
    await initDb();

    await db!.delete(
      "PRODUCTS",
      where: "ID = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteCustomerDb(int id) async {
    await initDb();

    await db!.delete(
      "CUSTOMERS",
      where: "ID = ?",
      whereArgs: [id],
    );
  }
}