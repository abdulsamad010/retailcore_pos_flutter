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
    PRODUCT_ID INTEGER,
    SUPPLIER_ID INTEGER,
    CUSTOMER_ID INTEGER,
    QUANTITY INTEGER,
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

  Future<List<Map<String,dynamic>>> getStockMovementsDb() async{
    await initDb();
    return await db!.query("STOCK_MOVEMENTS");
  }

  Future<List<Map<String,dynamic>>> getCustomersDb() async{
    await initDb();
    return await db!.query("CUSTOMERS");
  }

  Future<List<Map<String,dynamic>>> getSuppliersDb() async{
    await initDb();
    return await db!.query("SUPPLIERS");
  }

  Future<int> addProductDb(String n,int q,int p,String b) async{
    await initDb();
    await db!.insert("PRODUCTS", {
      "NAME":n,
      "QUANTITY":q,
      "PRICE":p,
      "BARCODE":b,
    });

    List<Map<String, Object?>> id= await db!.query("PRODUCTS",columns: ["ID"],orderBy: "ID DESC",limit: 1,);
    return id[0]["ID"] as int;
  }



  Future<void> addStockMovementSupplierDb(int pId,int sId,int q,int p) async {
    final type="Stock In";
    final date=DateTime.now().toString();
    await initDb();
    await db!.insert("STOCK_MOVEMENTS", {
      "PRODUCT_ID": pId,
      "SUPPLIER_ID": sId,
      "QUANTITY": q,
      "PRICE": p,
      "TYPE": type,
      "DATE": date,
    });
  }

  Future<void> addSalesDb(int cId,int p) async {
    final date=DateTime.now().toString();
    await initDb();
    await db!.insert("SALES", {
      "CUSTOMER_ID": cId,
      "TOTAL_AMOUNT": p,
      "DATE": date,
    });
  }

  Future<List<Map<String,dynamic>>> showSalesDb() async {
    await initDb();
    return await db!.query("SALES");
  }

  Future<void> addStockMovementCustomerDb(cId,int p) async {
    final type="Stock Out";
    final date=DateTime.now().toString();
    await initDb();
    await db!.insert("STOCK_MOVEMENTS", {
      "CUSTOMER_ID": cId,
      "PRICE": p,
      "TYPE": type,
      "DATE": date,
    });
  }


  Future<int> addSupplierDb(String n2,String p2) async{
    await initDb();
    final id=await db!.insert("SUPPLIERS", {
      "NAME":n2,
      "PHONE":p2,
    });
    return id;
  }

  Future<int> addCustomerDb(String n2,String p2) async{
    await initDb();
    final id=await db!.insert("CUSTOMERS", {
      "NAME":n2,
      "PHONE":p2,
    });
    return id;
  }

  Future<void> deleteProductDb(int id) async {
    await initDb();

    await db!.delete(
      "PRODUCTS",
      where: "ID = ?",
      whereArgs: [id],
    );
  }

  Future<List<Map<String,dynamic>>> findProductDb(barcode) async {
    await initDb();

    return await db!.query(
      "PRODUCTS",
      where: "BARCODE = ?",
      whereArgs: [barcode],
    );
  }

  Future<void> updateProductDb(List<Map<String,dynamic>> productsQuantity) async {
    await initDb();

    for(int i=0;i<productsQuantity.length;i++) {
      await db!.update(
        "PRODUCTS",
        {
          "QUANTITY": productsQuantity[i]["QUANTITY"]
        },
        where: "ID = ?",
        whereArgs: [productsQuantity[i]["ID"]],
      );
    }
  }

  Future<void> deleteStockMovementDb(int id) async {
    await initDb();

    await db!.delete(
      "STOCK_MOVEMENTS",
      where: "ID = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteSupplierDb(int id) async {
    await initDb();

    await db!.delete(
      "SUPPLIERS",
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