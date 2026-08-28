import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class ProductController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();
  RxList<Map<String,dynamic>> products=<Map<String,dynamic>>[].obs;

  @override
  void onInit(){
    super.onInit();
    showProducts();
  }

  Future<void> showProducts() async{
    products.value= await obj.getProductDb();
  }

  Future<void> deleteProduct(int id) async{
    await obj.deleteProductDb(id);
    showProducts();
  }
}

