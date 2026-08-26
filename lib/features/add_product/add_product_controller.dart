import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class AddProductController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();

  Future<void> addProduct(String n,int q,int p,String b) async{
    await obj.addProductDb(n,q,p,b);
  }

}

