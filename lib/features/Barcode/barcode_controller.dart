import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class BarcodeController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();
  RxList<Map<String,dynamic>> products=<Map<String,dynamic>>[].obs;

  RxString barcode=''.obs;

  @override
  void onInit(){
    super.onInit();
  }

  Future<void> findProduct(String barcode) async{
    products.value= await obj.findProductDb(barcode);
  }

  Future<void> deleteProduct(int id) async{
    await obj.deleteProductDb(id);
  }
}

