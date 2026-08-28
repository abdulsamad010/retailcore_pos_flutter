import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class StockMovementController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();
  RxList<Map<String,dynamic>> products=<Map<String,dynamic>>[].obs;

  @override
  void onInit(){
    super.onInit();
    showStockMovements();
  }

  Future<void> showStockMovements() async{
    products.value= await obj.getStockMovementsDb();
  }

  Future<void> deleteStockMovement(int id) async{
    await obj.deleteStockMovementDb(id);
    showStockMovements();
  }
}

