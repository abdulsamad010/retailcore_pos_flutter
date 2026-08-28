import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class SupplierController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();
  RxList<Map<String,dynamic>> suppliers=<Map<String,dynamic>>[].obs;

  @override
  void onInit(){
    super.onInit();
    showSuppliers();
  }

  Future<void> showSuppliers() async{
    suppliers.value= await obj.getSuppliersDb();
  }

  Future<void> deleteSupplier(int id) async{
    await obj.deleteSupplierDb(id);
    showSuppliers();
  }
}

