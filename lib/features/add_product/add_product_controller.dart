import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class AddProductController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();

  Future<void> addProduct(String n,int q,int p,String b,String n2, String p2) async{
    final pId=await obj.addProductDb(n,q,p,b);
    final sId=await obj.addSupplierDb(n2,p2);
    await obj.addStockMovementSupplierDb(pId,sId,q,p);
  }

}

